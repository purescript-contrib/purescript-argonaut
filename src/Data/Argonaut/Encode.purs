module Data.Argonaut.Encode
  ( EncodeJson
  , encodeJson
  ) where

  import Data.Argonaut.Core
    ( Json(..)
    , foldJsonObject
    , jsonNull
    , fromNull
    , fromBoolean
    , fromNumber
    , fromString
    , fromArray
    , fromObject
    , jsonEmptyArray
    , jsonEmptyObject
    , jsonSingletonObject
     
    )
  import Data.Char
  import Data.Maybe
  import Data.Either
  import Data.Foldable (foldr)
  import Data.Tuple (Tuple(..))
  import Data.Function 

  import qualified Data.Date as Date

  import qualified Data.StrMap as M
  import qualified Data.Map as Map

  class EncodeJson a where
    encodeJson :: a -> Json

  instance encodeJsonMaybe :: (EncodeJson a) => EncodeJson (Maybe a) where
    encodeJson Nothing  = jsonNull
    encodeJson (Just a) = encodeJson a

  instance encodeJsonTuple :: (EncodeJson a, EncodeJson b) => EncodeJson (Tuple a b) where
    encodeJson (Tuple a b) = encodeJson [encodeJson a, encodeJson b]

  instance encodeJsonEither :: (EncodeJson a, EncodeJson b) => EncodeJson (Either a b) where
    encodeJson (Left a) = encodeJson a
    encodeJson (Right b) = encodeJson b

  instance encodeJsonUnit :: EncodeJson Unit where
    encodeJson = const jsonNull

  instance encodeJsonJBoolean :: EncodeJson Boolean where
    encodeJson = fromBoolean

  instance encodeJsonJNumber :: EncodeJson Number where
    encodeJson = fromNumber

  instance encodeJsonJString :: EncodeJson String where
    encodeJson = fromString

  instance encodeJsonJson :: EncodeJson Json where
    encodeJson = id

  instance encodeJsonChar :: EncodeJson Char where
    encodeJson = encodeJson <<< charString

  instance encodeJsonArray :: (EncodeJson a) => EncodeJson [a] where
    encodeJson json = fromArray (encodeJson <$> json)

  instance encodeStrMap :: (EncodeJson a) => EncodeJson (M.StrMap a) where
    encodeJson m = fromObject (encodeJson <$> m)

  instance encodeMap :: (Ord a, EncodeJson a, EncodeJson b) => EncodeJson (Map.Map a b) where
    encodeJson = encodeJson <<< Map.toList

  foreign import fromJSDate """
  function jsDate2Json(date) {return date;}
  """ :: Date.JSDate -> Json 

  instance encodeJsonJsDate :: EncodeJson Date.JSDate where
    encodeJson = fromJSDate

  instance encodeDate :: EncodeJson Date.Date where
    encodeJson date = encodeJson $ Date.toJSDate date 
