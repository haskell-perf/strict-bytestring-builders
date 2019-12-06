module Main where

import Prelude
import Gauge.Main
import qualified ByteString.BuildersBenchmark.Benchmarks as A
import qualified ByteString.BuildersBenchmark.Actions as B
import qualified ByteString.BuildersBenchmark.Inputs as C


main =
  defaultMain $
  [ A.action "averagedAppends-1" B.averagedAppends 1
    ,
    A.action "averagedAppends-100" B.averagedAppends 100
    ,
    A.action "averagedAppends-10000" B.averagedAppends 10000
    ,
    A.action "regularConcat-100" B.regularConcat $!! C.sized 100
    ,
    A.action "regularConcat-10000" B.regularConcat $!! C.sized 10000
  ]
