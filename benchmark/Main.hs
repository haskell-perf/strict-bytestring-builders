module Main where

import Main.Prelude
import Control.DeepSeq
import Criterion.Main
import qualified Main.BinaryTree
import qualified Main.BinaryTreeWithSize
import qualified Main.Concat
import qualified Data.ByteString.Builder
import qualified Data.ByteString.Lazy
import qualified Data.ByteString


main =
  defaultMain
  [
    bench "Data.ByteString" $
    nf (sample id) (<>)
    ,
    bench "Data.ByteString.Builder" $
    nf (Data.ByteString.Lazy.toStrict . Data.ByteString.Builder.toLazyByteString)
       (sample Data.ByteString.Builder.byteString (<>))
    ,
    bench "Main.BinaryTree" $
    nf (Main.BinaryTree.bytesOf)
       (sample Main.BinaryTree.bytes Main.BinaryTree.append)
    ,
    bench "Main.BinaryTreeWithSize" $
    nf (Main.BinaryTreeWithSize.bytesOf)
       (sample Main.BinaryTreeWithSize.bytes Main.BinaryTreeWithSize.append)
  ]


{-# NOINLINE sample #-}
sample :: (Bytes -> a) -> (a -> a -> a) -> a
sample pure (<>) =
  (pure "hello" <> pure "asdf") <>
  pure "fsndfn" <>
  (pure "dfgknfg" <> pure "aaaaaa")

