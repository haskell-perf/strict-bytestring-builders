module ByteString.BuildersBenchmark.Subjects where

import Prelude
import qualified ByteString.StrictBuilder as A
import qualified ByteString.TreeBuilder as G
import qualified Data.BufferBuilder as B
import qualified Data.Binary.Put as C
import qualified Data.Serialize.Put as E
import qualified Data.ByteString.Lazy as D
import qualified Data.ByteString.Builder as F
import qualified Data.ByteString.FastBuilder as H
import qualified Blaze.ByteString.Builder as I


data Subject =
  forall a.
  Subject {
    name :: Text,
    empty :: a,
    append :: a -> a -> a,
    concat :: [a] -> a,
    fromBytes :: ByteString -> a,
    toBytes :: a -> ByteString
  }

byteStringStrictBuilder :: Subject
byteStringStrictBuilder =
  Subject "bytestring-strict-builder" mempty mappend mconcat A.bytes A.builderBytes

byteStringTreeBuilder :: Subject
byteStringTreeBuilder =
  Subject "bytestring-tree-builder" mempty mappend mconcat G.byteString G.toByteString

bufferBuilder :: Subject
bufferBuilder =
  Subject "buffer-builder" (pure ()) (*>) sequenceA_ B.appendBS B.runBufferBuilder

binary :: Subject
binary =
  Subject "binary" mempty mappend mconcat C.putByteString (D.toStrict . C.runPut)

cereal :: Subject
cereal =
  Subject "cereal" mempty mappend mconcat E.putByteString E.runPut

byteString :: Subject
byteString =
  Subject "bytestring" mempty mappend mconcat F.byteString (D.toStrict . F.toLazyByteString)

fastBuilder :: Subject
fastBuilder =
  Subject "fast-builder" mempty mappend mconcat H.byteString H.toStrictByteString

blazeBuilder :: Subject
blazeBuilder =
  Subject "blaze-builder" mempty mappend mconcat I.fromByteString (D.toStrict . I.toLazyByteString)
