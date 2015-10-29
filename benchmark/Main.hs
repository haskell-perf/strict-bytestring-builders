module Main where

import Main.Prelude
import Control.DeepSeq
import Criterion.Main
import qualified Main.BinaryTree
import qualified Main.BinaryTreeWithSize
import qualified Main.Concat
import qualified Main.DList
import qualified Main.BufferBuilderMonoid
import qualified Data.ByteString.Builder
import qualified Data.ByteString.Lazy
import qualified Data.ByteString


main =
  defaultMain
  [
    bench "Main.BufferBuilderMonoid" $ nf sample $
    (Main.BufferBuilderMonoid.bytes, mappend, Main.BufferBuilderMonoid.bytesOf)
    ,
    bench "Main.Concat" $ nf sample $
    (Main.Concat.bytes, mappend, Main.Concat.bytesOf)
    ,
    bench "Main.DList, thru list" $ nf sample $
    (Main.DList.bytes, mappend, Main.DList.bytesOf)
    ,
    bench "Main.BinaryTree, thru list" $ nf sample $
    (Main.BinaryTree.bytes, Main.BinaryTree.append, Main.BinaryTree.bytesOf_thruList)
    ,
    bench "Main.BinaryTree, explicit allocation" $ nf sample $
    (Main.BinaryTree.bytes, Main.BinaryTree.append, Main.BinaryTree.bytesOf_explicitAllocation)
    ,
    bench "Main.BinaryTreeWithSize" $ nf sample $
    (Main.BinaryTreeWithSize.bytes, Main.BinaryTreeWithSize.append, Main.BinaryTreeWithSize.bytesOf)
    ,
    bench "Data.ByteString.Builder" $ nf sample $
    (
      Data.ByteString.Builder.byteString,
      (<>),
      Data.ByteString.Lazy.toStrict . Data.ByteString.Builder.toLazyByteString
    )
    ,
    bench "Data.ByteString" $ nf sample (id, (<>), id)
  ]


{-# NOINLINE sample #-}
sample :: (Bytes -> a, a -> a -> a, a -> Bytes) -> Bytes
sample (fromBytes, (<>), toBytes) =
  toBytes $
    (fromBytes "hello" <> fromBytes "asdf") <>
    fromBytes "fsndfn" <>
    (fromBytes "dfgknfg" <> fromBytes "aaaaaa")

