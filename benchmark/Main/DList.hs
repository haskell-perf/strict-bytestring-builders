module Main.DList where

import Main.Prelude hiding (traverse_, fold, empty)
import qualified Data.ByteString as A
import qualified Data.ByteString.Unsafe as A
import qualified Data.DList as B


newtype Builder =
  Builder (B.DList Bytes)

instance Monoid Builder where
  {-# INLINABLE mempty #-}
  mempty =
    Builder B.empty
  {-# INLINABLE mappend #-}
  mappend (Builder dlist1) (Builder dlist2) =
    Builder (mappend dlist1 dlist2)
  {-# INLINABLE mconcat #-}
  mconcat =
    unsafeCoerce (mconcat :: [B.DList Bytes] -> B.DList Bytes)

{-# INLINABLE bytes #-}
bytes :: Bytes -> Builder
bytes bytes =
  Builder (B.singleton bytes)

{-# INLINABLE bytesOf #-}
bytesOf :: Builder -> Bytes
bytesOf (Builder dlist) =
  mconcat (toList dlist)
