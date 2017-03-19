module Main where

import Prelude
import Criterion.Main
import qualified ByteString.BuildersBenchmark.Benchmarks as A
import qualified ByteString.BuildersBenchmark.Actions as B


main =
  defaultMain $
  [
    A.action "concat" (B.concat 10000)
  ]
