module Main.StrictBinaryTreeWithSize where

import Main.Prelude hiding (traverse_, fold, empty)
import qualified Data.ByteString as A
import qualified Data.ByteString.Internal as B
import qualified Main.Bytes as C
import qualified Foreign as D


data Builder =
  Builder !Int !(BinaryTree Bytes)

instance Monoid Builder where
  mempty = empty
  mappend = append

instance IsString Builder where
  fromString = bytes . fromString

data BinaryTree a =
  Void |
  Leaf !a |
  Branch !(BinaryTree a) !(BinaryTree a)
  deriving (Functor, Foldable, Traversable)

empty :: Builder
empty =
  Builder 0 (Void)

append :: Builder -> Builder -> Builder
append (Builder length1 tree1) (Builder length2 tree2) =
  Builder (length1 + length2) (Branch tree1 tree2)

bytes :: Bytes -> Builder
bytes bytes =
  Builder (A.length bytes) (Leaf bytes)

lengthOf :: Builder -> Int
lengthOf (Builder length tree) =
  length

bytesOf :: Builder -> Bytes
bytesOf (Builder length tree) =
  B.unsafeCreate length $ void . pokeTree tree

pokeTree :: BinaryTree Bytes -> D.Ptr Word8 -> IO (D.Ptr Word8)
pokeTree tree ptr =
  case tree of
    Void -> pure ptr
    Leaf bytes -> C.poke bytes ptr
    Branch tree1 tree2 -> pokeTree tree1 ptr >>= pokeTree tree2
