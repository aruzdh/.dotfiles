# --------------------------- SYNTAX HIGHLIGHTING FZF ---------------------------

export FZF_DARK="--color=bg+:#585B89,bg:#222435,spinner:#EAA041,hl:#e2be7d \
  --color=fg:#B4B7CF,header:#46A3AF,info:#7679A7,pointer:#E16765 \
  --color=marker:#c678dd,fg+:#B4B7CF,prompt:#25ABE4,hl+:#e2be7d \
  --color=selected-bg:#585B89"

export FZF_LIGHT="--color=bg+:#bebebe,bg:#fafafa,spinner:#ee9025,hl:#e2be7d \
  --color=fg:#6a6a6a,header:#56b6c2,info:#9b9fa6,pointer:#e05661 \
  --color=marker:#9a77cf,fg+:#6a6a6a,prompt:#118dc3,hl+:#e2be7d \
  --color=selected-bg:#bebebe"

# --------------------------- GPG KEY ---------------------------

export GPG_TTY=$TTY

# --------------------------- PNPM ---------------------------

export PNPM_HOME="/Users/aru/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME/bin:"*) ;;
*) export PATH="$PNPM_HOME/bin:$PATH" ;;
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

# ------------------------ Antigravity ------------------------
export PATH="/Users/aru/.local/bin:$PATH"
