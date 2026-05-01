# --------------------------- SYNTAX HIGHLIGHTING ---------------------------

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --------------------------- AUTO SUGGESTIONS ---------------------------

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# --------------------------- HISTORY ---------------------------

HISTFILE=$HOME/.zsh_history
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
setopt hist_ignore_space
setopt hist_reduce_blanks

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# -------------------------- LOAD SH FILES --------------------------

zsh_dir="$HOME/.zsh"

if [[ -d "$zsh_dir" ]]; then
  for file in "$zsh_dir"/*.sh; do
    source "$file"
  done
fi

update_fzf_theme

eval "$(starship init zsh)"

source /opt/homebrew/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
