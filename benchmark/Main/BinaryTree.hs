module Main.BinaryTree where

import Main.Prelude hiding (traverse_, fold, empty)
import Foreign
import Control.Monad.Primitive
import qualified Data.ByteString as A
import qualified Data.ByteString.Unsafe as A
import qualified Data.Vector.Storable.Mutable as B


newtype Builder =
  Builder (BinaryTree Bytes)

data BinaryTree a =
  Void |
  Leaf a |
  Branch (BinaryTree a) (BinaryTree a)
  deriving (Functor, Foldable, Traversable)

instance Monoid Builder where
  mempty = empty
  mappend = append

instance IsString Builder where
  fromString = bytes . fromString

empty :: Builder
empty =
  Builder (Void)

append :: Builder -> Builder -> Builder
append (Builder tree1) (Builder tree2) =
  Builder (Branch tree1 tree2)

bytes :: Bytes -> Builder
bytes bytes =
  Builder (Leaf bytes)

lengthOf :: Builder -> Int
lengthOf (Builder tree) =
  case tree of
    Void -> 0
    Leaf bytes -> A.length bytes
    Branch tree1 tree2 -> lengthOf (Builder tree1) + lengthOf (Builder tree2)

traverse_ :: Applicative m => (Bytes -> m ()) -> Builder -> m ()
traverse_ action (Builder tree) =
  case tree of
    Void -> action A.empty
    Leaf bytes -> action bytes
    Branch tree1 tree2 -> traverse_ action (Builder tree1) *> traverse_ action (Builder tree2)

fold :: (a -> Bytes -> a) -> a -> Builder -> a
fold step init (Builder tree) =
  case tree of
    Void -> init
    Leaf bytes -> step init bytes
    Branch tree1 tree2 -> fold step (fold step init (Builder tree1)) (Builder tree2)

bytesOf :: Builder -> Bytes
bytesOf builder =
  runST $ do
    offsetRef <- newSTRef 0
    writeRef <- newSTRef (const (pure ()))
    flip traverse_ builder $ \bytes -> do
      offset <- readSTRef offsetRef
      write <- readSTRef writeRef
      let (newWrite, newOffset) =
            A.foldl'
              (\(write, offset) byte -> (\vector -> write vector >> B.unsafeWrite vector offset byte, succ offset))
              (write, offset)
              bytes
      writeSTRef offsetRef newOffset
      writeSTRef writeRef newWrite
    length <- readSTRef offsetRef
    write <- readSTRef writeRef
    vector <- B.new length
    write vector
    let (fptr, len) = B.unsafeToForeignPtr0 vector
    unsafePrimToST $ withForeignPtr fptr $ \ptr ->
      A.unsafePackCStringFinalizer ptr len
        (finalizeForeignPtr fptr)

