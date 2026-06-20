# ljh-sh/homebrew-cli

Custom Homebrew tap for [`ljh-sh`](https://github.com/ljh-sh) CLI tools.

## Formulae

| Formula | Source | Description |
|---------|--------|-------------|
| `macli`     | [`ljh-sh/macli`](https://github.com/ljh-sh/macli)         | macOS system tools CLI — only what shell / Python can't do |
| `maclisten` | [`ljh-sh/maclisten`](https://github.com/ljh-sh/maclisten) | Lightweight macOS ASR CLI |
| `roff`      | [`ljh-sh/roff`](https://github.com/ljh-sh/roff)           | Skillful man page to JSON / Markdown converter |

## Install

Homebrew auto-taps when you use the `user/tap/formula` shorthand, so a separate `brew tap` is optional:

```sh
brew install ljh-sh/cli/macli
brew install ljh-sh/cli/maclisten
brew install ljh-sh/cli/roff
```

If Homebrew 6 asks you to trust the tap first:

```sh
brew trust ljh-sh/cli
```

## Update

```sh
brew update
brew upgrade ljh-sh/cli/macli
brew upgrade ljh-sh/cli/roff
```

## Code signature

`macli` and `maclisten` ship with ad-hoc signatures (not Apple Developer IDs). Each formula removes the quarantine attribute in `post_install` so Gatekeeper doesn't prompt on first run. If you still see a warning:

```sh
xattr -dr com.apple.quarantine "$(brew --prefix)/bin/macli"
xattr -dr com.apple.quarantine "$(brew --prefix)/bin/maclisten"
```

## License

Each formula follows the license of its upstream project.
