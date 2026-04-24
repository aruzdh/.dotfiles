# GEMINI
alias gm="gemini"

# QWEN
alias qw="qwen"

# FZF
alias f="fzf"
alias fn="scan_n_edit"

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
alias gnv='ga nvim && gcm "chore: Update Neovim plugins"'
alias gco='git checkout'
alias gvg='git log --oneline --graph --all'

# ZSHRC
alias nvsh='nv ~/.zshrc'
alias sosh='source ~/.zshrc'
alias cl='clear'
alias md='mkdir'
alias cdp='cd ..'
alias rmm='rm -rf'
alias cpp='cp -rf'

# SIOYEK
alias syk='sioyek'

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

# PYTHON3
alias py='python3'

# PYTEST
alias pyt='pytest'

# OPEN DIR USING FINDER
alias op='open'
alias opc='open .'

# OPEN FILE USING PREVIEW
alias opp='open -a Preview'

# LEETCODE NVIM
alias nvl='nv leetcode.nvim'

# OPAM / ROCQ

# LTS switch (OCaml 4.14.2)
alias rocq-lts="opam switch rocq-lts"

# Latest switch (OCaml 5.4.0)
alias rocq-latest="opam switch rocq-latest"
