# --------------------------- Powerlevel10k ---------------------------

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# --------------------------- CORE CONFIG ---------------------------

# Enable the subsequent settings only in interactive sessions
# Zsh uses the $- variable similarly to Bash
if [[ $- != *i* ]]; then
  return
fi

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

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# --------------------------- SYNTAX HIGHLIGHTING FZF ---------------------------

export FZF_DEFAULT_OPTS="--ansi --preview='bat --color=always --style=numbers,changes,header {}'"


# --------------------------- GPG KEY ---------------------------
 
export GPG_TTY=$TTY

# --------------------------- PNPM ---------------------------

export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# --------------------------- ALIASES ---------------------------

# GEMINI
alias gm="gemini"

# FZF
alias f="fzf"

# TYPST
alias tc="typst compile"

# NVIM
alias nv="nvim"
alias cdnv='cd ~/.config/nvim'

# GIT
alias gss='git status -s'
alias gcm='git commit -m'
alias ga='git add'
alias gac='git add .'
alias gph='git push'
alias gpl='git pull'
alias gfo='git fetch origin'
alias ghr='git reset --hard HEAD'
alias gfc='git fetch origin && git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)'

# ZSHRC
alias nvsh='nv ~/.zshrc'
alias sosh='source ~/.zshrc'
alias cl='clear'
alias md='mkdir'

# LAZYGIT
alias lg='lazygit'

# DEVELOPER DIR
alias cddv='cd ~/Developer'

# GHOSTTY
alias nvgh='nv ~/.config/ghostty/config'

# TMUX
alias tx='tmux'
alias ex='exit'
alias cgth='~/.config/alacritty/scripts/change-theme.sh'
alias txks='tmux kill-server'

# DOTFILES
alias cddf='cd ~/.dotfiles'

# EZA
alias ls='eza --icons=always -1 --group-directories-first'
alias lst='ls -T'
alias lsa='ls -a'
alias lsta='ls -T -a'
alias lsl='ls -l'

# ZQXIDE
eval "$(zoxide init zsh)"
alias cd='z'

# BAT
alias cat='bat'

# HOMEBREW UPDATE && UPGRADE
alias hbuu='brew update && brew upgrade && brew cleanup'

# iCLOUD
alias cdic='cd ~/Library/Mobile Documents/com~apple~CloudDocs'

# NOTES
alias cdnts='cd Developer/notes'

# COMP. SCI. NOTES
alias cdcsn='cd Developer/notes/compsci-notes'

# --------------------------- SCRIPTS ---------------------------

c() {
  local filename="$1"
  local output_name
  local compile_status
  local compiler_errors=""
  local c_standard="-std=c23" # Define the C standard flag

  if [[ -z "$filename" ]]; then
    echo "Error: Please provide a C filename." >&2
    return 1
  fi

  if [[ ! -f "$filename" || ! "$filename" =~ \.c$ ]]; then
    echo "Error: '$filename' is not a valid C file." >&2
    return 1
  fi

  # Determine the output name (default to filename without .c)
  output_name="${filename%.c}"

  # Attempt to compile the file and capture errors, now with -std=c23
  echo "Compiling '$filename' with C23 standard..."
  compiler_errors=$(gcc "$filename" "$c_standard" -o "$output_name" 2>&1)
  compile_status=$?

  if [[ $compile_status -ne 0 ]]; then
    echo "Compilation failed with error(s):" >&2
    echo "$compiler_errors" >&2 # Print the captured errors
    return 1
  else
    echo "Compilation successful. Executing './$output_name'..."
    if [[ -f "$output_name" && -x "$output_name" ]]; then
      "./$output_name"
      local execute_status=$?
      if [[ $execute_status -ne 0 ]]; then
        echo "Execution of './$output_name' failed with exit code $execute_status." >&2
        rm -f "$output_name"
        return $execute_status
      fi
      echo "Deleting the created binary './$output_name'..."
      rm -f "$output_name"
    else
      echo "Error: Compiled output './$output_name' not found or is not executable." >&2
      return 1
    fi
  fi
}
