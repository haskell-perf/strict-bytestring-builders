module ByteString.BuildersBenchmark.Inputs where

import Prelude
import qualified ByteString.BuildersBenchmark.Subjects as A
import qualified ByteString.BuildersBenchmark.Actions as B


sized :: Int -> [ByteString]
sized factor =
  replicate factor "abcdefg"
