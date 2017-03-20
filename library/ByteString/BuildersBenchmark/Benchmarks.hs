module ByteString.BuildersBenchmark.Benchmarks where

import Prelude
import Criterion.Main
import qualified ByteString.BuildersBenchmark.Subjects as A
import qualified ByteString.BuildersBenchmark.Actions as B


allSubjects :: String -> (String -> A.Subject -> Benchmark) -> Benchmark
allSubjects groupName subjectBench =
  bgroup groupName benchmarks
  where
    benchmarks =
      subjectBench "byteStringStrictBuilder" A.byteStringStrictBuilder :
      subjectBench "byteStringTreeBuilder" A.byteStringTreeBuilder :
      subjectBench "fastBuilder" A.fastBuilder :
      subjectBench "bufferBuilder" A.bufferBuilder :
      subjectBench "byteString" A.byteString :
      subjectBench "blazeBuilder" A.blazeBuilder :
      subjectBench "binary" A.binary :
      subjectBench "cereal" A.cereal :
      []

action :: String -> B.Action -> Benchmark
action actionName action =
  allSubjects actionName (actionAndSubject action)

actionAndSubject :: B.Action -> String -> A.Subject -> Benchmark
actionAndSubject action subjectName subject =
  bench subjectName $ whnf action $ subject
