module ByteString.BuildersBenchmark.Benchmarks (action) where

import Prelude
import Gauge.Main
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

finalization :: Int -> String -> A.Subject -> Benchmark
finalization factor subjectName (A.Subject mempty (<>) mconcat foldMap fromBytes toBytes) =
  bench subjectName $! whnf toBytes $! subject
  where
    subject =
      foldr (<>) mempty $ replicate factor $
      (fromBytes "hello" <> fromBytes "asdf") <>
      fromBytes "fsndfn" <>
      (fromBytes "dfgknfg" <> fromBytes "aaaaaa")
