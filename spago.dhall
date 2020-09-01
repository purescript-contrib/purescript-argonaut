{ name = "argonaut"
, dependencies =
  [ "argonaut-codecs"
  , "argonaut-core"
  , "argonaut-traversals"
  , "console"
  , "effect"
  , "psci-support"
  , "quickcheck"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs", "examples/**/*.purs" ]
}
