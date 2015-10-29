module Main where

import Main.Prelude
import Control.DeepSeq
import Criterion.Main
import qualified Main.BinaryTree
import qualified Main.BinaryTreeWithSize
import qualified Main.Concat
import qualified Main.DList
import qualified Main.Seq
import qualified Main.BufferBuilderMonoid
import qualified Data.ByteString.Builder
import qualified Data.ByteString.Lazy
import qualified Data.ByteString


main =
  defaultMain $
  map sampleGroup $
  [("Small Input", smallSample), ("Large Input", largeSample)]
    
sampleGroup :: (String, Sample) -> Benchmark
sampleGroup (title, sample) =
  bgroup title
  [
    bench "Main.BufferBuilderMonoid" $ nf sample $
    (Main.BufferBuilderMonoid.bytes, mappend, mempty, Main.BufferBuilderMonoid.bytesOf)
    ,
    bench "Main.Concat" $ nf sample $
    (Main.Concat.bytes, mappend, mempty, Main.Concat.bytesOf)
    ,
    bench "Main.Seq" $ nf sample $
    (Main.Seq.bytes, mappend, mempty, Main.Seq.bytesOf)
    ,
    bench "Main.DList" $ nf sample $
    (Main.DList.bytes, mappend, mempty, Main.DList.bytesOf)
    ,
    bench "Main.BinaryTree, thru list" $ nf sample $
    (Main.BinaryTree.bytes, mappend, mempty, Main.BinaryTree.bytesOf_thruList)
    ,
    bench "Main.BinaryTree, explicit allocation" $ nf sample $
    (Main.BinaryTree.bytes, mappend, mempty, Main.BinaryTree.bytesOf_explicitAllocation)
    ,
    bench "Main.BinaryTreeWithSize" $ nf sample $
    (Main.BinaryTreeWithSize.bytes, mappend, mempty, Main.BinaryTreeWithSize.bytesOf)
    ,
    bench "Data.ByteString.Builder" $ nf sample $
    (Data.ByteString.Builder.byteString, mappend, mempty, Data.ByteString.Lazy.toStrict . Data.ByteString.Builder.toLazyByteString)
    ,
    bench "Data.ByteString" $ nf sample (id, mappend, mempty, id)
  ]

type Sample =
  forall a. (Bytes -> a, a -> a -> a, a, a -> Bytes) -> Bytes

{-# NOINLINE smallSample #-}
smallSample :: Sample
smallSample (fromBytes, (<>), mempty, toBytes) =
  toBytes $
    (fromBytes "hello" <> fromBytes "asdf") <>
    fromBytes "fsndfn" <>
    (fromBytes "dfgknfg" <> fromBytes "aaaaaa")

{-# NOINLINE largeSample #-}
largeSample :: Sample
largeSample (fromBytes, (<>), mempty, toBytes) =
  toBytes $
  foldl' (<>) mempty $ replicate 1000 $
    (fromBytes "hello" <> fromBytes "asdf") <>
    fromBytes "fsndfn" <>
    (fromBytes "dfgknfg" <> fromBytes "aaaaaa")

