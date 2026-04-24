# --------------------------- SYNTAX HIGHLIGHTING FZF ---------------------------

export FZF_BAMBOO_DARK="--color=bg+:#2f312c,bg:#252623,spinner:#e75a7c,hl:#e75a7c \
  --color=fg:#f1e9d2,header:#e75a7c,info:#96c7ef,pointer:#8fb573 \
  --color=marker:#8fb573,fg+:#8fb573,prompt:#8fb573,hl+:#e75a7c \
  --color=selected-bg:#383b35"

export FZF_BAMBOO_LIGHT="--color=bg+:#eaead0,bg:#fafae0,spinner:#c72a3c,hl:#c72a3c \
  --color=fg:#3a4238,header:#c72a3c,info:#177fff,pointer:#27850b \
  --color=marker:#27850b,fg+:#27850b,prompt:#27850b,hl+:#c72a3c \
  --color=selected-bg:#e4e4cc"

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
