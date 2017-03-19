module ByteString.BuildersBenchmark.Benchmarks where

import Prelude
import Criterion.Main
import qualified ByteString.BuildersBenchmark.Subjects as A
import qualified ByteString.BuildersBenchmark.Actions as B


action :: String -> B.Action -> Benchmark
action actionName action =
  bgroup actionName benchmarks
  where
    benchmarks =
      subjectBench "byteStringTreeBuilder" A.byteStringTreeBuilder :
      subjectBench "byteStringStrictBuilder" A.byteStringStrictBuilder :
      subjectBench "bufferBuilder" A.bufferBuilder :
      subjectBench "binary" A.binary :
      subjectBench "cereal" A.cereal :
      subjectBench "byteString" A.byteString :
      subjectBench "fastBuilder" A.fastBuilder :
      subjectBench "blazeBuilder" A.blazeBuilder :
      []
      where
        subjectBench subjectName subject =
          actionAndSubject action subjectName subject

actionAndSubject :: B.Action -> String -> A.Subject -> Benchmark
actionAndSubject action subjectName subject =
  bench subjectName $ nf action $ subject
