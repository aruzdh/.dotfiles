# --------------------------- SYNTAX HIGHLIGHTING FZF ---------------------------

export FZF_ROSE_PINE_DARK="--color=bg+:#26233a,bg:#191724,spinner:#f6c177,hl:#ebbcba \
  --color=fg:#e0def4,header:#9ccfd8,info:#908caa,pointer:#eb6f92 \
  --color=marker:#c4a7e7,fg+:#e0def4,prompt:#31748f,hl+:#ebbcba \
  --color=selected-bg:#1f1d2e"

export FZF_ROSE_PINE_LIGHT="--color=bg+:#f2e9de,bg:#faf4ed,spinner:#ea9d34,hl:#d7827e \
  --color=fg:#575279,header:#56949f,info:#9893a5,pointer:#b4637a \
  --color=marker:#907aa9,fg+:#575279,prompt:#286983,hl+:#d7827e \
  --color=selected-bg:#fffaf3"

# --------------------------- SYNTAX HIGHLIGHTING BAT ---------------------------

export BAT_THEME="ansi"

# --------------------------- GPG KEY ---------------------------

export GPG_TTY=$TTY

# --------------------------- PNPM ---------------------------

export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

# --------------------------- JAVA ---------------------------

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

# --------------------------- GHCUP / HASKELL ---------------------------

[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env" # ghcup-env

# --------------------------- LM STUDIO ---------------------------

export PATH="$PATH:$HOME/.lmstudio/bin"

# --------------------------- CARGO ---------------------------

export PATH="$HOME/.cargo/bin:$PATH"

# --------------------------- OPAM ---------------------------

[[ ! -r '/Users/aru/.opam/opam-init/init.zsh' ]] ||
  source '/Users/aru/.opam/opam-init/init.zsh' >/dev/null 2>/dev/null

# --------------------------- PYTHON3 ---------------------------

export PATH="/opt/homebrew/opt/python@3.14/bin:$PATH"

# --------------------------- PIPX ---------------------------
export PATH="$PATH:/Users/aru/.local/bin"
