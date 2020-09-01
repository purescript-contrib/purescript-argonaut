# Argonaut

[![CI](https://github.com/purescript-contrib/purescript-argonaut/workflows/CI/badge.svg?branch=main)](https://github.com/purescript-contrib/purescript-argonaut/actions?query=workflow%3ACI+branch%3Amain)
[![Release](http://img.shields.io/github/release/purescript-contrib/purescript-argonaut.svg)](https://github.com/purescript-contrib/purescript-argonaut/releases)
[![Pursuit](http://pursuit.purescript.org/packages/purescript-argonaut/badge)](http://pursuit.purescript.org/packages/purescript-argonaut)
[![Maintainer: garyb](https://img.shields.io/badge/maintainer-garyb-teal.svg)](http://github.com/garyb)
[![Maintainer: thomashoneyman](https://img.shields.io/badge/maintainer-thomashoneyman-teal.svg)](http://github.com/thomashoneyman)

[Argonaut](https://github.com/purescript-contrib/purescript-argonaut) is a collection of libraries for working with JSON in PureScript. This library bundles together the following:

- [purescript-argonaut-core](https://github.com/purescript-contrib/purescript-argonaut-core) provides basic parsing, printing, folding and types for `Json`.
- [purescript-argonaut-codecs](https://github.com/purescript-contrib/purescript-argonaut-codecs) provides codecs based on `EncodeJson` and `DecodeJson` type classes (along with instances for common data types) and combinators for encoding and decoding `Json` values.
- [purescript-argonaut-traversals](https://github.com/purescript-contrib/purescript-argonaut-traversals) defines prisms, traversals, zippers, and `JCursor` for the `Json` type.

## Installation

Install `argonaut` with [Spago](https://github.com/purescript/spago):

```sh
spago install argonaut
```

You can also install Argonaut libraries individually (for example, by only installing `argonaut-core` for the `Json` type).

## Quick start

This library bundles together several other libraries. We recommend checking out the quick starts for those libraries depending on which use case you're looking for:

- To learn more about the basic data types and parsing functions in Argonaut, see [purescript-argonaut-core](https://github.com/purescript-contrib/purescript-argonaut-core).
- To learn more about encoding and decoding PureScript types to and from `Json` using type classes, see [purescript-argonaut-codecs](https://github.com/purescript-contrib/purescript-argonaut-codecs).
- To learn more about encoding and decoding PureScript types to and from `Json` using profunctors, see [purescript-codec-argonaut](https://github.com/garyb/purescript-codec-argonaut).
- To learn more about manipulating `Json` using optics and `JCursor`, see [purescript-argonaut-traversals](https://github.com/purescript-contrib/purescript-argonaut-traversals)

## Documentation

`argonaut` documentation is stored in a few places:

1. Module documentation is [published on Pursuit](https://pursuit.purescript.org/packages/purescript-argonaut).
2. Written documentation and [the changelog](./docs/CHANGELOG.md) are kept in [the docs directory](./docs).
3. Usage examples can be found in [the test suite](./test).

If you get stuck, there are several ways to get help:

- [Open an issue](https://github.com/purescript-contrib/purescript-argonaut/issues) if you have encountered a bug or problem.
- [Search or start a thread on the PureScript Discourse](https://discourse.purescript.org) if you have general questions. You can also ask questions in the `#purescript` and `#purescript-beginners` channels on the [Functional Programming Slack](https://functionalprogramming.slack.com) ([invite link](https://fpchat-invite.herokuapp.com/)).

## Contributing

You can contribute to `argonaut` in several ways:

1. If you encounter a problem or have a question, please [open an issue](https://github.com/purescript-contrib/purescript-argonaut/issues). We'll do our best to work with you to resolve or answer it.

2. If you would like to contribute code, tests, or documentation, please [read the contributor guide](./.github/CONTRIBUTING.md). It's a short, helpful introduction to contributing to this library, including development instructions.

3. If you have written a library, tutorial, guide, or other resource based on this package, please share it on the [PureScript Discourse](https://discourse.purescript.org)! Writing libraries and learning resources are a great way to help this library succeed.
