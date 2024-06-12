Caveats Subcommand for Homebrew
================

## What is it?

It's an [external command][external-commands] for [Homebrew] that provides caveat descriptions for Homebrew formulae and casks.

This repository is an active fork of the original [rafaelgarrido/homebrew-caveats][upstream], which is unmaintained.
See [rafaelgarrido/homebrew-caveats#10][upstream-10] for the rational behind this fork.

Most notably, this fork [greatly simplifies the installation process][upstream-9] for this subcommand.

[upstream]: https://github.com/rafaelgarrido/homebrew-caveats
[upstream-9]: https://github.com/rafaelgarrido/homebrew-caveats/pull/9
[upstream-10]: https://github.com/rafaelgarrido/homebrew-caveats/pull/10

## Installation

Run the following command:

```bash
brew tap superatomic/caveats
```

## Usage

To see caveats for a formula:

    $ brew caveats redis
    ==> redis
    To start redis now and restart at login:
      brew services start redis
    Or, if you don't want/need a background service you can just run:
      /usr/local/opt/redis/bin/redis-server /usr/local/etc/redis.conf

This also works for casks:

    $ brew caveats macfuse
    ==> macfuse
    macfuse requires a kernel extension to work.
    If the installation fails, retry after you enable it in:
      System Settings → Privacy & Security

    For more information, refer to vendor documentation or this Apple Technical Note:
      https://developer.apple.com/library/content/technotes/tn2459/_index.html

[external-commands]: https://github.com/Homebrew/brew/blob/master/docs/External-Commands.md
[Homebrew]: https://brew.sh
