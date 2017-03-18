module ByteString.BuildersBenchmark.Subject where

import Prelude


data Subject =
  forall a.
  Subject {
    name :: Text,
    empty :: a,
    append :: a -> a -> a,
    concat :: [a] -> a,
    fromBytes :: a -> ByteString,
    toBytes :: ByteString -> a
  }
