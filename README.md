Caveats Subcommand for Homebrew
================

## What is it?

It's an [external command][external-commands] for [Homebrew] that provides caveat descriptions for Homebrew formulae and casks.

This repository is an active fork of the original [rafaelgarrido/homebrew-caveats](https://github.com/rafaelgarrido/homebrew-caveats), which is unmaintained.
See [rafaelgarrido/homebrew-caveats#10][upstream-10] for the rational behind this fork.

Most notably, this fork [greatly simplifies the installation process][upstream-9] for this subcommand.

[upstream-9]: https://github.com/rafaelgarrido/homebrew-caveats/pull/9
[upstream-10]: https://github.com/rafaelgarrido/homebrew-caveats/pull/10

## Installation

Run the following command:

```bash
brew tap superatomic/caveats
```

## Usage

To see caveats for a formula:

    $ brew caveats redis mysql
    ==> redis
    To start redis now and restart at login:
      brew services start redis
    Or, if you don't want/need a background service you can just run:
      /usr/local/opt/redis/bin/redis-server /usr/local/etc/redis.conf

    ==> mysql
    We've installed your MySQL database without a root password. To secure it run:
        mysql_secure_installation

    MySQL is configured to only allow connections from localhost by default

    To connect run:
        mysql -u root

    To start mysql now and restart at login:
      brew services start mysql
    Or, if you don't want/need a background service you can just run:
      /usr/local/opt/mysql/bin/mysqld_safe --datadir\=/usr/local/var/mysql

This is also valid for casks:

    $ brew caveats macfuse
    ==> macfuse
    macfuse requires a kernel extension to work.
    If the installation fails, retry after you enable it in:
      System Settings → Privacy & Security

    For more information, refer to vendor documentation or this Apple Technical Note:
      https://developer.apple.com/library/content/technotes/tn2459/_index.html

[external-commands]: https://github.com/Homebrew/brew/blob/master/docs/External-Commands.md
[Homebrew]: https://brew.sh
