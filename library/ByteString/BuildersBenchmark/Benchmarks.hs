module ByteString.BuildersBenchmark.Benchmarks where

import Prelude
import Criterion.Main
import qualified ByteString.BuildersBenchmark.Subjects as A
import qualified ByteString.BuildersBenchmark.Actions as B
import qualified Data.Text as C


action :: B.Action -> Benchmark
action (B.Action actionName theAction) =
  bgroup (C.unpack actionName) $ map subjectBench $ subjects
  where
    subjects =
      A.byteStringStrictBuilder :
      A.byteStringTreeBuilder :
      A.bufferBuilder :
      A.binary :
      A.cereal :
      A.byteString :
      A.fastBuilder :
      A.blazeBuilder :
      []
    subjectBench subject@(A.Subject subjectName _ _ _ _ _) =
      bench (C.unpack subjectName) $ nf theAction $ subject

