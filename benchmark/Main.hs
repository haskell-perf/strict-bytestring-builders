module Main where

import Main.Prelude
import Control.DeepSeq
import Criterion.Main
import qualified Main.Concat
import qualified Main.DList
import qualified Main.DListWithSize
import qualified Main.Seq
import qualified Main.BufferBuilderMonoid
import qualified Data.ByteString.Builder
import qualified Data.ByteString.Lazy
import qualified Data.ByteString
import qualified Blaze.ByteString.Builder
import qualified ByteString.TreeBuilder
import qualified ByteString.StrictBuilder


main =
  defaultMain $
  [
    sampleGroup "Small Input" smallSample True
    ,
    sampleGroup "Medium Input" mediumSample True
    ,
    sampleGroup "Large Input" largeSample False
    ,
    sampleGroup "Large Input/foldr" largeFoldr False
    ,
    sampleGroup "Large Input/mconcat" largeFoldr False
  ]
    
sampleGroup :: String -> Sample -> Bool -> Benchmark
sampleGroup title sample measureByteString =
  bgroup title $
  [
    subjectBench "ByteString.StrictBuilder" strictBuilderSubject
    ,
    subjectBench "ByteString.TreeBuilder" $
    Subject ByteString.TreeBuilder.byteString mappend mempty ByteString.TreeBuilder.toByteString mconcat
    ,
    subjectBench "Data.ByteString.Builder" $
    Subject Data.ByteString.Builder.byteString mappend mempty (Data.ByteString.Lazy.toStrict . Data.ByteString.Builder.toLazyByteString) mconcat
    ,
    subjectBench "Main.BufferBuilderMonoid" $
    Subject Main.BufferBuilderMonoid.bytes mappend mempty Main.BufferBuilderMonoid.bytesOf mconcat
  ] <>
  if measureByteString
    then [subjectBench "Data.ByteString" (Subject id mappend mempty id mconcat)]
    else []
  where
    subjectBench title subject =
      bench title $ nf sample $ subject


data Subject =
  forall a. Subject (Bytes -> a) (a -> a -> a) a (a -> Bytes) ([a] -> a)

strictBuilderSubject :: Subject
strictBuilderSubject =
  Subject ByteString.StrictBuilder.bytes mappend mempty ByteString.StrictBuilder.builderBytes mconcat

type Sample =
  Subject -> Bytes

{-# NOINLINE smallSample #-}
smallSample :: Sample
smallSample (Subject fromBytes (<>) mempty toBytes mconcat) =
  toBytes $
  foldl' (<>) mempty $ replicate 100 $
    (fromBytes "hello" <> fromBytes "asdf") <>
    fromBytes "fsndfn" <>
    (fromBytes "dfgknfg" <> fromBytes "aaaaaa")

{-# NOINLINE mediumSample #-}
mediumSample :: Sample
mediumSample (Subject fromBytes (<>) mempty toBytes mconcat) =
  toBytes $
  foldl' (<>) mempty $ replicate 200 $
    (fromBytes "hello" <> fromBytes "asdf") <>
    fromBytes "fsndfn" <>
    (fromBytes "dfgknfg" <> fromBytes "aaaaaa")

{-# NOINLINE largeSample #-}
largeSample :: Sample
largeSample (Subject fromBytes (<>) mempty toBytes mconcat) =
  toBytes $
  foldl' (<>) mempty $ replicate 300 $
    (fromBytes "hello" <> fromBytes "asdf") <>
    fromBytes "fsndfn" <>
    (fromBytes "dfgknfg" <> fromBytes "aaaaaa")

{-# NOINLINE largeFoldr #-}
largeFoldr :: Sample
largeFoldr (Subject fromBytes (<>) mempty toBytes mconcat) =
  toBytes $
  foldr (<>) mempty $ replicate 100000 $
    (fromBytes "hello" <> fromBytes "asdf") <>
    fromBytes "fsndfn" <>
    (fromBytes "dfgknfg" <> fromBytes "aaaaaa")

{-# NOINLINE largeMconcat #-}
largeMconcat :: Sample
largeMconcat (Subject fromBytes (<>) mempty toBytes mconcat) =
  toBytes $
  mconcat $
  map fromBytes $
  mconcatInput

{-# NOINLINE mconcatInput #-}
mconcatInput :: [Bytes]
mconcatInput =
  fold $ 
  replicate 100000 $
  ["hello", "asdf", "fsndfn", "dfgknfg", "aaaaaa"]
