module Main.BufferBuilderMonoid where

import Main.Prelude hiding (traverse_, fold, empty)
import qualified Data.BufferBuilder as A

newtype Builder =
  Builder (A.BufferBuilder ())

instance Monoid Builder where
  {-# INLINABLE mempty #-}
  mempty =
    Builder (pure ())
  {-# INLINABLE mappend #-}
  mappend (Builder bb1) (Builder bb2) =
    Builder (bb1 *> bb2)

{-# INLINABLE bytes #-}
bytes :: Bytes -> Builder
bytes bytes =
  Builder (A.appendBS bytes)

{-# INLINABLE bytesOf #-}
bytesOf :: Builder -> Bytes
bytesOf (Builder bb) =
  A.runBufferBuilder bb
