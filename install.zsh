#!/usr/bin/env zsh

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

DOTFILES="$HOME/.dotfiles"

if [ ! -d "$DOTFILES" ]; then
  echo -e "${BLUE}Cloning dotfiles repo...${NC}"
  git clone https://github.com/aruzdh/.dotfiles.git "$DOTFILES"
fi

cd "$DOTFILES" || exit 1

# Install Homebrew if it's not there
if ! command -v brew &>/dev/null; then
  echo -e "${BLUE}Installing Homebrew...${NC}"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)" 2>/dev/null || eval "$(/usr/local/bin/brew shellenv)"
fi

# Check if Brewfile exists
if [[ -f "./Brewfile" ]]; then
  echo -e "${GREEN}Installing programs from Brewfile...${NC}"
  brew bundle --no-lock --file=./Brewfile
else
  echo -e "${BLUE}No Brewfile found, skipping bundle...${NC}"
fi

# Use Stow to symlink configurations
echo -e "${GREEN}Symlinking configurations with GNU Stow...${NC}"

for dir in */; do
  dir=${dir%/}
  [[ "$dir" =~ ^\. ]] && continue
  echo "Stowing $dir..."
  stow -R "$dir"
done

# Tool-specific setups
echo -e "${GREEN}Finalizing tool setups...${NC}"
echo "Setting Pnpm up..."
if command -v corepack &>/dev/null; then
  corepack enable pnpm
  pnpm setup --quiet 2>/dev/null || true
else
  echo "corepack not found, skipping pnpm setup..."
fi

# Install Rust (if not already installed)
if ! command -v rustc &>/dev/null; then
  echo "Installing Rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
fi

# Install Antigravity (if not already installed)
if ! command -v agy &>/dev/null; then
  echo "Installing Antigravity..."
  curl -fsSL https://antigravity.google/cli/install.sh | bash -s -- -y --no-modify-path
fi


echo -e "${BLUE}Installation Complete 🦦! Please restart your terminal.${NC}"
