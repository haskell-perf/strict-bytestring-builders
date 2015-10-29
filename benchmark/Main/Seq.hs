module Main.Seq where

import Main.Prelude hiding (traverse_, fold, empty)
import qualified Data.ByteString as A
import qualified Data.ByteString.Unsafe as A
import qualified Data.Sequence as B


newtype Builder =
  Builder (B.Seq Bytes)

instance Monoid Builder where
  {-# INLINABLE mempty #-}
  mempty =
    Builder B.empty
  {-# INLINABLE mappend #-}
  mappend (Builder seq1) (Builder seq2) =
    Builder (mappend seq1 seq2)
  {-# INLINABLE mconcat #-}
  mconcat =
    unsafeCoerce (mconcat :: [B.Seq Bytes] -> B.Seq Bytes)

{-# INLINABLE bytes #-}
bytes :: Bytes -> Builder
bytes bytes =
  Builder (B.singleton bytes)

{-# INLINABLE bytesOf #-}
bytesOf :: Builder -> Bytes
bytesOf (Builder seq) =
  mconcat (toList seq)
