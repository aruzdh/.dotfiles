update_fzf_theme() {
  if [[ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" == "Dark" ]]; then
    export FZF_DEFAULT_OPTS="$FZF_BAMBOO_DARK"
    export BAT_THEME="gruvbox-dark"
  else
    export FZF_DEFAULT_OPTS="$FZF_BAMBOO_LIGHT"
    export BAT_THEME="GitHub"
  fi

  export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
    --layout=reverse \
    --inline-info \
    --pointer='>>' \
    --prompt='󰍉 SEARCH: ' \
    --marker='▒' \
    --border='double' \
    --preview-window='right:60%:border-double' \
    --preview 'bat --style=grid,numbers --color=always --line-range :500 {}'"
}

scan_n_edit() {
  local file
  file=$(fzf)
  if [[ -n "$file" ]]; then
    nvim "$file"
  fi
}
