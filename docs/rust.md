# Rust

Run:

```bash
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
```

You're will be asked to select the installation options or carry on with the
default ones:

- Host tuple
- Toolchain
- Profile
- PATH

To install a _linker_ (if needed), on macOS, run:

```bash
xcode-select --install
```

For Nvim (if getting errors), add `rust-analyzer` to the toolchain:

```bash
rustup component add rust-analyzer
```
