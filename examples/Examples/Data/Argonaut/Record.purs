module Examples.Data.Argonaut.Record where

import Prelude

import Data.Argonaut.Core
import Data.Argonaut.Combinators ((~>), (:=), (.?))
import Data.Argonaut.Encode
import Data.Argonaut.Decode
import Data.Maybe
import Data.Either


import Data.Traversable (traverse)

newtype BlogPost = BlogPost
  { id         :: Int
  , title      :: String
  , categories :: String
  , content    :: String
  }

instance decodeJsonBlogPost :: DecodeJson BlogPost where
  decodeJson json = do
    obj        <- decodeJson json
    id         <- obj .? "id"
    title      <- obj .? "title"
    categories <- obj .? "categories"
    content    <- obj .? "content"
    pure $ BlogPost {id: id, title: title, categories: categories, content: content}

instance encodeJson :: EncodeJson BlogPost where
  encodeJson (BlogPost post)
    =  "id"         := post.id
    ~> "title"      := post.title
    ~> "categories" := post.categories
    ~> "content"    := post.content
    ~> jsonEmptyObject

type BlogPostArray = Array BlogPost

decodeBlogPostArray :: Json -> Either String BlogPostArray
decodeBlogPostArray json = decodeJson json >>= traverse decodeJson

encodeBlogPostArray :: BlogPostArray -> Json
encodeBlogPostArray bpa = fromArray $ encodeJson <$> bpa
