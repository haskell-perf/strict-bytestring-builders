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

foldr :: Int -> Action
foldr factor (A.Subject empty (<>) concat _ fromBytes toBytes) =
  toBytes $ Prelude.foldr (<>) empty $ replicate factor $
  (fromBytes "hello" <> fromBytes "asdf") <>
  fromBytes "fsndfn" <>
  (fromBytes "dfgknfg" <> fromBytes "aaaaaa")

concat :: Int -> Action
concat factor (A.Subject empty (<>) concat _ fromBytes toBytes) =
  toBytes $ concat $ replicate factor $
  (fromBytes "hello" <> fromBytes "asdf") <>
  fromBytes "fsndfn" <>
  (fromBytes "dfgknfg" <> fromBytes "aaaaaa")

regularConcat :: [ByteString] -> Action
regularConcat input (A.Subject empty (<>) concat foldMap fromBytes toBytes) =
  (toBytes . foldMap fromBytes) input
