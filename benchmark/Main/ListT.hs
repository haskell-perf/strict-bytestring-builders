module Main.ListT where

import Main.Prelude hiding (traverse_, fold, empty)
import qualified ListT as A

newtype Builder =
  Builder (A.ListT Identity Bytes)
  deriving (Monoid)

{-# INLINABLE bytes #-}
bytes :: Bytes -> Builder
bytes =
  Builder . pure

{-# INLINABLE bytesOf #-}
bytesOf :: Builder -> Bytes
bytesOf (Builder listt) =
  mconcat (runIdentity (A.toList listt))
