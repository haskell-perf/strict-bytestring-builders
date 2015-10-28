module Main.BinaryTreeWithSize where

import Main.Prelude hiding (traverse_, fold, empty)
import Foreign
import qualified Data.ByteString as A
import qualified Data.Vector.Storable.Mutable as B


data Builder =
  Builder !Int (BinaryTree Bytes)

data BinaryTree a =
  Void |
  Leaf a |
  Branch (BinaryTree a) (BinaryTree a)
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
  fill length tree

fill len t0 = unsafePerformIO $ do
  ptr <- mallocArray len
  let
    go !i (Branch l r) = do
      ll <- go i l
      go ll r

    go !i (Leaf a) = writeBS 0 i
      where
        writeBS !j !ij
          | j < A.length a = pokeElemOff ptr ij (A.index a j) >> writeBS (j+1) (ij+1)
          | otherwise      = return ij

    go !i Void    = return 0

  go 0 t0
  A.packCStringLen (castPtr ptr, len)
