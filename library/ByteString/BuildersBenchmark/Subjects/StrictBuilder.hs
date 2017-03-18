module ByteString.BuildersBenchmark.Subjects.StrictBuilder where

import Prelude
import ByteString.BuildersBenchmark.Subject
import ByteString.StrictBuilder


subject :: Subject
subject =
  Subject "bytestring-strict-builder" mempty mappend mconcat bytes builderBytes
