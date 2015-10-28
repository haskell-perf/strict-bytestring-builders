module Main.Prelude
( 
  module Exports,
  Bytes,
  LazyBytes,
  BytesBuilder,
)
where


-- base-prelude
-------------------------
import BasePrelude as Exports hiding (assert, left, right, isLeft, isRight, error)
import MTLPrelude as Exports hiding (shift)

-- either
-------------------------
import Control.Monad.Trans.Either as Exports
import Data.Either.Combinators as Exports

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
