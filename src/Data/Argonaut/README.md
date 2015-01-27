# Module Documentation

## Module Data.Argonaut.Combinators

### Values

    (.?) :: forall a. (DecodeJson a) => JObject -> String -> Either String a

    (:=) :: forall a. (EncodeJson a) => String -> a -> JAssoc

    (?>>=) :: forall a b. Maybe a -> String -> Either String a

    (~>) :: forall a. (EncodeJson a) => JAssoc -> a -> Json


## Module Data.Argonaut.Core

### Types

    type JArray = [Json]

    type JAssoc = Tuple String Json

    type JBoolean = Boolean

    data JNull :: *

    type JNumber = Number

    type JObject = M.StrMap Json

    type JString = String

    data Json :: *


### Type Class Instances

    instance eqJNull :: Eq JNull

    instance eqJson :: Eq Json

    instance ordJNull :: Ord JNull

    instance ordJson :: Ord Json

    instance showJson :: Show Json

    instance showJsonNull :: Show JNull


### Values

    arrayL :: PrismP Json JArray

    booleanL :: PrismP Json JBoolean

    foldJson :: forall a. (JNull -> a) -> (JBoolean -> a) -> (JNumber -> a) -> (JString -> a) -> (JArray -> a) -> (JObject -> a) -> Json -> a

    foldJsonArray :: forall a. a -> (JArray -> a) -> Json -> a

    foldJsonBoolean :: forall a. a -> (JBoolean -> a) -> Json -> a

    foldJsonNull :: forall a. a -> (JNull -> a) -> Json -> a

    foldJsonNumber :: forall a. a -> (JNumber -> a) -> Json -> a

    foldJsonObject :: forall a. a -> (JObject -> a) -> Json -> a

    foldJsonString :: forall a. a -> (JString -> a) -> Json -> a

    fromArray :: JArray -> Json

    fromBoolean :: JBoolean -> Json

    fromNull :: JNull -> Json

    fromNumber :: JNumber -> Json

    fromObject :: JObject -> Json

    fromString :: JString -> Json

    isArray :: Json -> Boolean

    isBoolean :: Json -> Boolean

    isJsonType :: forall a. (Boolean -> (a -> Boolean) -> Json -> Boolean) -> Json -> Boolean

    isNull :: Json -> Boolean

    isNumber :: Json -> Boolean

    isObject :: Json -> Boolean

    isString :: Json -> Boolean

    jsonArrayL :: TraversalP Json Json

    jsonBooleanL :: TraversalP Json Json

    jsonEmptyArray :: Json

    jsonEmptyObject :: Json

    jsonEmptyString :: Json

    jsonFalse :: Json

    jsonNull :: Json

    jsonNullL :: TraversalP Json Json

    jsonNumberL :: TraversalP Json Json

    jsonObjectL :: TraversalP Json Json

    jsonSingletonArray :: Json -> Json

    jsonSingletonObject :: String -> Json -> Json

    jsonStringL :: TraversalP Json Json

    jsonTrue :: Json

    jsonZero :: Json

    nullL :: PrismP Json JNull

    numberL :: PrismP Json JNumber

    objectL :: PrismP Json JObject

    stringL :: PrismP Json JString

    toArray :: Json -> Maybe JArray

    toBoolean :: Json -> Maybe JBoolean

    toNull :: Json -> Maybe JNull

    toNumber :: Json -> Maybe JNumber

    toObject :: Json -> Maybe JObject

    toString :: Json -> Maybe JString


## Module Data.Argonaut.Decode

### Type Classes

    class DecodeJson a where
      decodeJson :: Json -> Either String a


### Type Class Instances

    instance decodeArray :: (DecodeJson a) => DecodeJson [a]

    instance decodeJsonBoolean :: DecodeJson Boolean

    instance decodeJsonChar :: DecodeJson Char

    instance decodeJsonEither :: (DecodeJson a, DecodeJson b) => DecodeJson (Either a b)

    instance decodeJsonJson :: DecodeJson Json

    instance decodeJsonMaybe :: (DecodeJson a) => DecodeJson (Maybe a)

    instance decodeJsonNull :: DecodeJson Unit

    instance decodeJsonNumber :: DecodeJson Number

    instance decodeJsonString :: DecodeJson String

    instance decodeJsonTuple :: (DecodeJson a, DecodeJson b) => DecodeJson (Tuple a b)

    instance decodeMap :: (Ord a, DecodeJson a, DecodeJson b) => DecodeJson (Map.Map a b)

    instance decodeStrMap :: (DecodeJson a) => DecodeJson (M.StrMap a)


### Values

    arrayIndexL :: forall a. (DecodeJson a, EncodeJson a) => JNumber -> TraversalP Json a

    decodeL :: forall a. (DecodeJson a, EncodeJson a) => PrismP Json a

    decodeMaybe :: forall a. (DecodeJson a) => Json -> Maybe a

    objectFieldL :: forall a. (DecodeJson a, EncodeJson a) => JString -> TraversalP Json a


## Module Data.Argonaut.Encode

### Type Classes

    class EncodeJson a where
      encodeJson :: a -> Json


### Type Class Instances

    instance encodeJsonArray :: (EncodeJson a) => EncodeJson [a]

    instance encodeJsonChar :: EncodeJson Char

    instance encodeJsonEither :: (EncodeJson a, EncodeJson b) => EncodeJson (Either a b)

    instance encodeJsonJBoolean :: EncodeJson Boolean

    instance encodeJsonJNumber :: EncodeJson Number

    instance encodeJsonJString :: EncodeJson String

    instance encodeJsonJson :: EncodeJson Json

    instance encodeJsonMaybe :: (EncodeJson a) => EncodeJson (Maybe a)

    instance encodeJsonTuple :: (EncodeJson a, EncodeJson b) => EncodeJson (Tuple a b)

    instance encodeJsonUnit :: EncodeJson Unit

    instance encodeMap :: (Ord a, EncodeJson a, EncodeJson b) => EncodeJson (Map.Map a b)

    instance encodeStrMap :: (EncodeJson a) => EncodeJson (M.StrMap a)


## Module Data.Argonaut.JCursor

### Types

    data JCursor where
      JCursorTop :: JCursor
      JField :: String -> JCursor -> JCursor
      JIndex :: Number -> JCursor -> JCursor

    newtype JsonPrim where
      JsonPrim :: (forall a. (JNull -> a) -> (JBoolean -> a) -> (JNumber -> a) -> (JString -> a) -> a) -> JsonPrim


### Type Class Instances

    instance decodeJsonJCursor :: DecodeJson JCursor

    instance encodeJsonJCursor :: EncodeJson JCursor

    instance eqJCursor :: Eq JCursor

    instance monoidJCursor :: Monoid JCursor

    instance ordJCursor :: Ord JCursor

    instance semigroupJCursor :: Semigroup JCursor

    instance showJCursor :: Show JCursor

    instance showJsonPrim :: Show JsonPrim


### Values

    cursorGet :: JCursor -> Json -> Maybe Json

    cursorSet :: JCursor -> Json -> Json -> Maybe Json

    downField :: String -> JCursor -> JCursor

    downIndex :: Number -> JCursor -> JCursor

    fromPrims :: [Tuple JCursor JsonPrim] -> Maybe Json

    insideOut :: JCursor -> JCursor

    primBool :: JBoolean -> JsonPrim

    primNull :: JsonPrim

    primNum :: JNumber -> JsonPrim

    primStr :: JString -> JsonPrim

    primToJson :: JsonPrim -> Json

    runJsonPrim :: JsonPrim -> (forall a. (JNull -> a) -> (JBoolean -> a) -> (JNumber -> a) -> (JString -> a) -> a)

    toPrims :: Json -> [Tuple JCursor JsonPrim]


## Module Data.Argonaut.Parser

### Values

    jsonParser :: String -> Either String Json


## Module Data.Argonaut.Printer

### Type Classes

    class Printer a where
      printJson :: Json -> a


### Type Class Instances

    instance printerString :: Printer String



