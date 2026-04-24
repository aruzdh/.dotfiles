# .dotfiles

My personal, automated macOS development environment. This repository uses
**GNU Stow** to manage configurations and **Homebrew Bundle** to automate
software installation.

---

## One-Command Installation

Open the terminal and run:

```bash
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/aruzdh/.dotfiles/main/install.zsh)"

```

**What this script does:**

1. Clones this repository to `~/.dotfiles`.
2. Installs **Homebrew** if not present.
3. Installs all CLI tools defined in the `Brewfile`.
4. Symlinks all configurations from `~/.dotfiles` to their respective locations
  in `$HOME` using `stow`.
5. Enables `pnpm` via Corepack and runs `pnpm setup`.
6. Installs Rust.

---

## Repository Structure

Configurations are organized into "packages" that `stow` can map:

* `ghostty/`: Terminal emulator
* `nvim/`: Neovim setup (LazyVim-based).
* `zsh/`: Shell configuration, including aliases, exports, and functions.
* `tmux/`: Session management and pane multiplexing.
* `gitconfig/`: Global git rules
* `starship/` & `p10k/`: Shell prompt configurations.
* `qutebrowser/`: Keyboard-driven web browser setup.

---

## Post-Install Manual Steps

While the configurations are automated, security keys must be handled manually
for safety:

1. Create and set up your SSH and GPG keys.
1. Create `~/.gitconfig.local` (or `~/.dotfiles/gitconfig/.gitconfig.local`)
with your personal details:

```ini
[user]
  name = Your Name
  email = your_email@example.com
  signingkey = YOUR_GPG_KEY_ID

```
