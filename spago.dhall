{ name = "argonaut"
, dependencies =
  [ "argonaut-codecs"
  , "argonaut-core"
  , "argonaut-traversals"
  , "console"
  , "effect"
  , "either"
  , "foldable-traversable"
  , "maybe"
  , "prelude"
  , "quickcheck"
  , "strings"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs", "examples/**/*.purs" ]
}
