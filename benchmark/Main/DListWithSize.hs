module Main.DListWithSize where

import Main.Prelude hiding (traverse_, fold, empty)
import Foreign
import qualified Data.ByteString as A
import qualified Data.ByteString.Unsafe as A
import qualified Data.DList as B

data Builder = Builder (B.DList Bytes) !Int

instance Monoid Builder where
  {-# INLINABLE mempty #-}
  mempty =
    Builder B.empty 0
  {-# INLINABLE mappend #-}
  mappend (Builder dlist1 m) (Builder dlist2 n) =
    Builder (mappend dlist1 dlist2) (m + n)

{-# INLINABLE bytes #-}
bytes :: Bytes -> Builder
bytes bytes = Builder (B.singleton bytes) (A.length bytes)

{-# INLINABLE bytesOf #-}
bytesOf :: Builder -> Bytes
bytesOf (Builder xs n) = fill n (toList xs)

fill len t0 = unsafePerformIO $ do
  ptr <- mallocArray len
  let
    go !i (a0:as0) = writeBS a0 as0 0 i
      where
        writeBS a as !j !ij
          | j < A.length a = pokeElemOff ptr ij (A.index a j) >> writeBS a as (j+1) (ij+1)
          | otherwise      = go ij as

    go !i [] = return 0

  go 0 t0
  A.packCStringLen (castPtr ptr, len)
