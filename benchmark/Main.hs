module Main where

import Prelude
import Criterion.Main
import qualified ByteString.BuildersBenchmark.Benchmarks as A
import qualified ByteString.BuildersBenchmark.Actions as B
import qualified ByteString.BuildersBenchmark.Inputs as C


main =
  defaultMain $
  [
    A.allSubjects "finalization-1" (A.finalization 1)
    ,
    A.allSubjects "finalization-10" (A.finalization 10)
    ,
    A.allSubjects "finalization-100" (A.finalization 100)
    ,
    A.allSubjects "finalization-1000" (A.finalization 1000)
    ,
    A.action "regular-concat-10" (B.regularConcat $!! C.sized 10)
    ,
    A.action "regular-concat-100" (B.regularConcat $!! C.sized 100)
    ,
    A.action "regular-concat-1000" (B.regularConcat $!! C.sized 1000)
    ,
    A.action "foldl-1" (B.foldl 1)
    ,
    A.action "foldl-100" (B.foldl 100)
    ,
    A.action "foldl-10000" (B.foldl 10000)
    ,
    A.action "foldr-100" (B.foldr 100)
    ,
    A.action "foldr-10000" (B.foldr 10000)
  ]
