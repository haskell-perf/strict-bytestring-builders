module Main.Prelude
( 
  module Exports,
  Bytes,
  LazyBytes,
  BytesBuilder,
)
where


-- rerebase
-------------------------
import Prelude as Exports hiding (assert, left, right, isLeft, isRight, error)

-- custom
-------------------------
import qualified Data.ByteString
import qualified Data.ByteString.Lazy
import qualified Data.ByteString.Builder


type Bytes =
  Data.ByteString.ByteString

type LazyBytes =
  Data.ByteString.Lazy.ByteString

type BytesBuilder =
  Data.ByteString.Builder.Builder
