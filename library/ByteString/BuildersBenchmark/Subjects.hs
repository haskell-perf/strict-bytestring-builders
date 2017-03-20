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
  Subject a (a -> a -> a) ([a] -> a) (forall b. (b -> a) -> [b] -> a) (ByteString -> a) (a -> ByteString)

byteStringStrictBuilder :: Subject
byteStringStrictBuilder =
  Subject mempty mappend mconcat foldMap A.bytes A.builderBytes

byteStringTreeBuilder :: Subject
byteStringTreeBuilder =
  Subject mempty mappend mconcat foldMap G.byteString G.toByteString

bufferBuilder :: Subject
bufferBuilder =
  Subject (pure ()) (*>) sequenceA_ traverse_ B.appendBS B.runBufferBuilder

binary :: Subject
binary =
  Subject mempty mappend mconcat foldMap C.putByteString (D.toStrict . C.runPut)

cereal :: Subject
cereal =
  Subject mempty mappend mconcat foldMap E.putByteString E.runPut

byteString :: Subject
byteString =
  Subject mempty mappend mconcat foldMap F.byteString (D.toStrict . F.toLazyByteString)

fastBuilder :: Subject
fastBuilder =
  Subject mempty mappend mconcat foldMap H.byteString H.toStrictByteString

blazeBuilder :: Subject
blazeBuilder =
  Subject mempty mappend mconcat foldMap I.fromByteString (D.toStrict . I.toLazyByteString)
