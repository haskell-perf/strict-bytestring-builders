module Main where

import Prelude
import Criterion.Main
import qualified ByteString.BuildersBenchmark.Benchmarks as A
import qualified ByteString.BuildersBenchmark.Actions as B
import qualified ByteString.BuildersBenchmark.Inputs as C


main =
  defaultMain $
  [
    A.action "averaged-appends-1" (B.averagedAppends 1)
    ,
    A.action "averaged-appends-100" (B.averagedAppends 100)
    ,
    A.action "averaged-appends-10000" (B.averagedAppends 10000)
    ,
    A.action "regular-concat-100" (B.regularConcat $!! C.sized 100)
    ,
    A.action "regular-concat-10000" (B.regularConcat $!! C.sized 10000)
  ]
