module Main.Bytes where

import Main.Prelude
import Foreign hiding (void)
import qualified Data.ByteString as A
import qualified Data.ByteString.Internal as B


-- |
-- Write the given bytes into the pointer and
-- return a pointer incremented by the amount of written bytes.
{-# INLINABLE poke #-}
poke :: Bytes -> Ptr Word8 -> IO (Ptr Word8)
poke (B.PS foreignPointer offset length) pointer =
  do
    withForeignPtr foreignPointer $ \pointer' ->
      B.memcpy pointer (plusPtr pointer' offset) length
    pure (plusPtr pointer length)

-- |
-- Write the given bytes into the pointer and
-- return a pointer decremented by the amount of written bytes.
{-# INLINABLE pokeMinus #-}
pokeMinus :: Bytes -> Ptr Word8 -> IO (Ptr Word8)
pokeMinus (B.PS foreignPointer offset length) pointer =
  do
    withForeignPtr foreignPointer $ \pointer' ->
      B.memcpy targetPointer (plusPtr pointer' offset) length
    pure targetPointer
  where
    targetPointer =
      plusPtr pointer (negate length)
