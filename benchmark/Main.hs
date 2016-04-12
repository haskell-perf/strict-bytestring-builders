module Main where

import Main.Prelude
import Control.DeepSeq
import Criterion.Main
import qualified Main.Concat
import qualified Main.DList
import qualified Main.DListWithSize
import qualified Main.Seq
import qualified Main.BufferBuilderMonoid
import qualified Main.ListT
import qualified Data.ByteString.Builder
import qualified Data.ByteString.Lazy
import qualified Data.ByteString
import qualified Blaze.ByteString.Builder
import qualified ByteString.TreeBuilder


main =
  defaultMain $
  map sampleGroup $
  [
    ("Small Input", smallSample, True)
    ,
    ("Medium Input", mediumSample, True)
    ,
    ("Large Input", largeSample, False)
    ,
    ("Large Input/foldr", largeFoldr, False)
    ,
    ("Large Input/mconcat", largeFoldr, False)
  ]
    
sampleGroup :: (String, Sample, Bool) -> Benchmark
sampleGroup (title, sample, measureByteString) =
  bgroup title $
  [
    bench "ByteString.TreeBuilder" $ nf sample $
    (ByteString.TreeBuilder.byteString, mappend, mempty, ByteString.TreeBuilder.toByteString, mconcat)
    ,
    bench "Main.BufferBuilderMonoid" $ nf sample $
    (Main.BufferBuilderMonoid.bytes, mappend, mempty, Main.BufferBuilderMonoid.bytesOf, mconcat)
    ,
    bench "Main.DListWithSize" $ nf sample $
    (Main.DListWithSize.bytes, mappend, mempty, Main.DListWithSize.bytesOf, mconcat)
    ,
    bench "Main.DList" $ nf sample $
    (Main.DList.bytes, mappend, mempty, Main.DList.bytesOf, mconcat)
    ,
    bench "Main.Seq" $ nf sample $
    (Main.Seq.bytes, mappend, mempty, Main.Seq.bytesOf, mconcat)
    ,
    bench "Blaze.ByteString.Builder" $ nf sample $
    (Blaze.ByteString.Builder.fromByteString, mappend, mempty, Data.ByteString.Lazy.toStrict . Blaze.ByteString.Builder.toLazyByteString, mconcat)
    ,
    bench "Data.ByteString.Builder" $ nf sample $
    (Data.ByteString.Builder.byteString, mappend, mempty, Data.ByteString.Lazy.toStrict . Data.ByteString.Builder.toLazyByteString, mconcat)
  ] <>
  if measureByteString
    then [bench "Data.ByteString" $ nf sample (id, mappend, mempty, id, mconcat)]
    else []

type Sample =
  forall a. (Bytes -> a, a -> a -> a, a, a -> Bytes, [a] -> a) -> Bytes

{-# NOINLINE smallSample #-}
smallSample :: Sample
smallSample (fromBytes, (<>), mempty, toBytes, _) =
  toBytes $
    (fromBytes "hello" <> fromBytes "asdf") <>
    fromBytes "fsndfn" <>
    (fromBytes "dfgknfg" <> fromBytes "aaaaaa")

{-# NOINLINE mediumSample #-}
mediumSample :: Sample
mediumSample (fromBytes, (<>), mempty, toBytes, _) =
  toBytes $
  foldl' (<>) mempty $ replicate 1000 $
    (fromBytes "hello" <> fromBytes "asdf") <>
    fromBytes "fsndfn" <>
    (fromBytes "dfgknfg" <> fromBytes "aaaaaa")


{-# NOINLINE largeSample #-}
largeSample :: Sample
largeSample (fromBytes, (<>), mempty, toBytes, _) =
  toBytes $
  foldl' (<>) mempty $ replicate 100000 $
    (fromBytes "hello" <> fromBytes "asdf") <>
    fromBytes "fsndfn" <>
    (fromBytes "dfgknfg" <> fromBytes "aaaaaa")


{-# NOINLINE largeFoldr #-}
largeFoldr :: Sample
largeFoldr (fromBytes, (<>), mempty, toBytes, _) =
  toBytes $
  foldr (<>) mempty $ replicate 100000 $
    (fromBytes "hello" <> fromBytes "asdf") <>
    fromBytes "fsndfn" <>
    (fromBytes "dfgknfg" <> fromBytes "aaaaaa")

{-# NOINLINE largeMconcat #-}
largeMconcat :: Sample
largeMconcat (fromBytes, (<>), mempty, toBytes, mconcat) =
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
