# Changelog

Notable changes to this project are documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

Breaking changes:

New features:

Bugfixes:

Other improvements:

## [v9.0.0](https://github.com/purescript-contrib/purescript-argonaut/releases/tag/v9.0.0) - 2022-04-27

Breaking changes:
- Update project and deps to PureScript v0.15.0 (#58 by @JordanMartinez)

New features:

Bugfixes:

Other improvements:
- Added `purs-tidy` formatter (#6 by @thomashoneyman)

## [v8.0.0](https://github.com/purescript-contrib/purescript-argonaut/releases/tag/v8.0.0) - 2021-02-26

Breaking changes:
- Added support for PureScript 0.14 and dropped support for all previous versions (#52)

New features:

Bugfixes:

Other improvements:
- Re-exported `Data.Argonaut.Core.stringifyWithIndent` (#51)
- Changed default branch to `main` from `master`
- Updated to comply with Contributors library guidelines by adding new issue and pull request templates, updating documentation, and migrating to Spago for local development and CI (#48, #49)

## [v7.0.0](https://github.com/purescript-contrib/purescript-argonaut/releases/tag/v7.0.0) - 2020-06-20

- Updated dependencies to account for the [typed errors introduced in `argonaut-codecs` v7.0.0](https://github.com/purescript-contrib/purescript-argonaut-codecs/releases/tag/v7.0.0). These types produce richer information to understand errors that have occurred, which can also be printed as human-readable errors.

## [v6.0.0](https://github.com/purescript-contrib/purescript-argonaut/releases/tag/v6.0.0) - 2019-03-15

- Updated several dependencies (@davezuch)

## [v5.0.0](https://github.com/purescript-contrib/purescript-argonaut/releases/tag/v5.0.0) - 2018-12-04

- Updated dependencies for `-traversals` and `-codecs`, most notably adding support for generic encoding / decoding of records (@davezuch, @elliotdavies)

## [v4.0.1](https://github.com/purescript-contrib/purescript-argonaut/releases/tag/v4.0.1) - 2018-06-22

- Added metadata including contributor guidelines
- Pushed latest release to Pursuit

## [v4.0.0](https://github.com/purescript-contrib/purescript-argonaut/releases/tag/v4.0.0) - 2018-06-09

- Updated for PureScript 0.12

## [v3.1.0](https://github.com/purescript-contrib/purescript-argonaut/releases/tag/v3.1.0) - 2017-09-14

- Added some additional re-exports (stringify, decode operators)

## [v3.0.0](https://github.com/purescript-contrib/purescript-argonaut/releases/tag/v3.0.0) - 2017-04-08

- Updated for PureScript 0.11

## [v2.0.0](https://github.com/purescript-contrib/purescript-argonaut/releases/tag/v2.0.0) - 2016-10-22

- Updated dependencies

## [v1.0.0](https://github.com/purescript-contrib/purescript-argonaut/releases/tag/v1.0.0) - 2016-06-11

Updates for the 1.0 core libraries.

## [v0.12.0](https://github.com/purescript-contrib/purescript-argonaut/releases/tag/v0.12.0) - 2016-01-15

- Updated for latest `purescript-argonaut-codecs`. **Note**: This changes Argonaut's encoding for `Either`s.

## [v0.11.0](https://github.com/purescript-contrib/purescript-argonaut/releases/tag/v0.11.0) - 2015-11-20

- Updated dependencies. **Note**: this release requires PureScript 0.7.6 or newer.

## [v0.10.0](https://github.com/purescript-contrib/purescript-argonaut/releases/tag/v0.10.0) - 2015-11-05

- Updated to use the latest versions of the argonaut component libraries

## [v0.9.0](https://github.com/purescript-contrib/purescript-argonaut/releases/tag/v0.9.0) - 2015-09-08

- Updated for PureScript 0.7.4

## [v0.8.0](https://github.com/purescript-contrib/purescript-argonaut/releases/tag/v0.8.0) - 2015-07-14

- Added aggregation

## [v0.7.0](https://github.com/purescript-contrib/purescript-argonaut/releases/tag/v0.7.0) - 2015-07-10

- Updated to PureScript 0.7 (#23)

## [v0.6.0](https://github.com/purescript-contrib/purescript-argonaut/releases/tag/v0.6.0) - 2015-05-19

- Added `EncodeJson` and `DecodeJson` instances for `Int`

## [v0.5.0](https://github.com/purescript-contrib/purescript-argonaut/releases/tag/v0.5.0) - 2015-04-21

- Bumped dependencies

## [v0.4.0](https://github.com/purescript-contrib/purescript-argonaut/releases/tag/v0.4.0) - 2015-02-21

- Updated dependencies. **Note:** This release requires PureScript v0.6.8 or later

## [v0.3.0](https://github.com/purescript-contrib/purescript-argonaut/releases/tag/v0.3.0) - 2015-01-20

- Updated dependencies to use latest `lens`.

## [v0.2.0](https://github.com/purescript-contrib/purescript-argonaut/releases/tag/v0.2.0) - 2014-09-20

- Updated version to publish docs to Pursuit

## [v0.1.0](https://github.com/purescript-contrib/purescript-argonaut/releases/tag/v0.1.0) - 2014-08-14

- Initial versioned release.
