module ByteString.BuildersBenchmark.Actions where

import Prelude
import qualified ByteString.BuildersBenchmark.Subjects as A


type Action =
  A.Subject -> ByteString

foldl :: Int -> Action
foldl factor (A.Subject empty (<>) _ _ fromBytes toBytes) =
  toBytes $ Prelude.foldl' (<>) empty $ replicate factor $
  (fromBytes "hello" <> fromBytes "asdf") <>
  fromBytes "fsndfn" <>
  (fromBytes "dfgknfg" <> fromBytes "aaaaaa")
{-# INLINE foldl #-}

foldr :: Int -> Action
foldr factor (A.Subject empty (<>) concat _ fromBytes toBytes) =
  toBytes $ Prelude.foldr (<>) empty $ replicate factor $
  (fromBytes "hello" <> fromBytes "asdf") <>
  fromBytes "fsndfn" <>
  (fromBytes "dfgknfg" <> fromBytes "aaaaaa")
{-# INLINE foldr #-}

concat :: Int -> Action
concat factor (A.Subject empty (<>) concat _ fromBytes toBytes) =
  toBytes $ concat $ replicate factor $
  (fromBytes "hello" <> fromBytes "asdf") <>
  fromBytes "fsndfn" <>
  (fromBytes "dfgknfg" <> fromBytes "aaaaaa")
{-# INLINE concat #-}

regularConcat :: [ByteString] -> Action
regularConcat input (A.Subject empty (<>) concat foldMap fromBytes toBytes) =
  (toBytes . foldMap fromBytes) input
{-# INLINE regularConcat #-}

averagedAppends :: Int -> Action
averagedAppends factor (A.Subject empty (<>) concat foldMap fromBytes toBytes) =
  toBytes builder
  where
    builder =
      (Prelude.foldl' (<>) empty $ replicate factor $ chunk) <>
      (Prelude.foldr (<>) empty $ replicate factor $ chunk)
    chunk =
      (fromBytes "hello" <> fromBytes "asdf") <>
      fromBytes "fsndfn" <>
      (fromBytes "dfgknfg" <> fromBytes "aaaaaa")
{-# INLINE averagedAppends #-}
