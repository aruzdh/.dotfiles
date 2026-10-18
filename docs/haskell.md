# Haskell

Run:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

You're will be asked to enable some features:

- Channels: GHCup maintained
- Pre-release channel: No
- Cross channel: No
- 3rdparty channel: Yes
- Add the PATH variable: No (already handle by `stow zsh`)
- Install HLS (haskell-language-server): Yes
- Better integration of stack with GHCup: Yes

To install `hlint`:

```bash
cabal update
cabal install hlint
```
