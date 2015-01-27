module Data.Argonaut.Instances.Datetime (
  jsDate2Json,
  json2JSDate
  ) where
       

import Data.Function
import Data.Maybe
import Data.Either

import Data.Argonaut.Core
import Data.Argonaut.Encode
import Data.Argonaut.Decode
import Data.Date (fromJSDate, Date(), JSDate(), toJSDate)

foreign import jsDate2Json """
function jsDate2Json(date) {return date;}
""" :: JSDate -> Json

instance encodeJsonDate :: EncodeJson JSDate where
  encodeJson = jsDate2Json

instance encodeDate :: EncodeJson Date where
  encodeJson date = encodeJson $ toJSDate date

foreign import json2JSDateImpl """
function json2JSDateImpl(json, just, nothing) {
  if (json && json.constructor && json.constructor == Date) {
    return just(json); 
  } else {
    return nothing;
  }
}
""" :: forall a. Fn3 Json (a -> Maybe a) (Maybe a) (Maybe JSDate)

json2JSDate :: Json -> Maybe JSDate
json2JSDate json = runFn3 json2JSDateImpl json (Just) (Nothing)

instance decodeJsonJSDate :: DecodeJson JSDate where
  decodeJson jsdate =
    case json2JSDate jsdate of
      Nothing -> Left "Incorrect jsdate"
      Just date -> Right date

instance decodeJsonDate :: DecodeJson Date where
  decodeJson date = fromMaybe (Left "Incorrect date") do
    jsdate <- decodeJson date # either (const Nothing) Just
    date <- fromJSDate jsdate
    return $ Right date

    
