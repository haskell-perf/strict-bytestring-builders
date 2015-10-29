module Main.DListWithSize where

import Main.Prelude hiding (traverse_, fold, empty)
import qualified Data.ByteString as A
import qualified Data.ByteString.Internal as B
import qualified Main.Bytes as C
import qualified Foreign as D
import qualified Data.DList as E

data Builder = Builder (E.DList Bytes) !Int

instance Monoid Builder where
  {-# INLINABLE mempty #-}
  mempty =
    Builder E.empty 0
  {-# INLINABLE mappend #-}
  mappend (Builder dlist1 m) (Builder dlist2 n) =
    Builder (mappend dlist1 dlist2) (m + n)

instance IsString Builder where
  fromString = bytes . fromString

{-# INLINABLE bytes #-}
bytes :: Bytes -> Builder
bytes bytes = Builder (E.singleton bytes) (A.length bytes)

{-# INLINABLE bytesOf #-}
bytesOf :: Builder -> Bytes
bytesOf (Builder dlist length) =
  B.unsafeCreate length $ \ptr ->
    void $
    E.foldr
      (\bytes ptrIO -> ptrIO >>= C.pokeMinus bytes)
      (pure (D.plusPtr ptr length))
      dlist
