module ByteString.BuildersBenchmark.Actions where

import Prelude
import qualified ByteString.BuildersBenchmark.Subjects as A


data Action =
  Action Text (A.Subject -> ByteString)

foldl' :: Int -> Action
foldl' factor =
  Action name $ \(A.Subject _ empty (<>) _ fromBytes toBytes) ->
  toBytes $ Prelude.foldl' (<>) empty $ replicate factor $
    (fromBytes "hello" <> fromBytes "asdf") <>
    fromBytes "fsndfn" <>
    (fromBytes "dfgknfg" <> fromBytes "aaaaaa")
  where
    name =
      "foldl'/" <> fromString (show factor)

foldr :: Int -> Action
foldr factor =
  Action name $ \(A.Subject _ empty (<>) concat fromBytes toBytes) ->
  toBytes $ Prelude.foldr (<>) empty $ replicate factor $
  (fromBytes "hello" <> fromBytes "asdf") <>
  fromBytes "fsndfn" <>
  (fromBytes "dfgknfg" <> fromBytes "aaaaaa")
  where
    name =
      "foldr/" <> fromString (show factor)

concat :: Int -> Action
concat factor =
  Action name $ \(A.Subject _ empty (<>) concat fromBytes toBytes) ->
  toBytes $ concat $ replicate factor $
  (fromBytes "hello" <> fromBytes "asdf") <>
  fromBytes "fsndfn" <>
  (fromBytes "dfgknfg" <> fromBytes "aaaaaa")
  where
    name =
      "mconcat/" <> fromString (show factor)