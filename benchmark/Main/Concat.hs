module Main.Concat where

import Main.Prelude
import Foreign
import qualified Data.ByteString as A


newtype Builder =
  Builder (Concat Bytes)
  deriving (Monoid)

newtype Concat a =
  Concat (([a] -> a) -> a)

instance Monoid (Concat a) where
  {-# INLINABLE mempty #-}
  mempty =
    Concat (\concat -> concat [])
  {-# INLINABLE mappend #-}
  mappend (Concat run1) (Concat run2) =
    Concat (\concat -> concat [run1 concat, run2 concat])
  {-# INLINABLE mconcat #-}
  mconcat list =
    Concat (\concat -> concat (map (\(Concat run) -> run concat) list))

{-# INLINABLE bytes #-}
bytes :: Bytes -> Builder
bytes bytes =
  Builder (Concat (\concat -> bytes))

{-# INLINABLE bytesOf #-}
bytesOf :: Builder -> Bytes
bytesOf (Builder (Concat onConcat)) =
  onConcat mconcat
