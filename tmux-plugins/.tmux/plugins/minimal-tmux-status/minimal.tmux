#!/usr/bin/env bash

get_tmux_option() {
  local option=$1
  local default_value="$2"
  # shellcheck disable=SC2155
  local option_value=$(tmux show-options -gqv "$option")
  if [ -n "$option_value" ]; then
    echo "$option_value"
    return
  fi
  echo "$default_value"
}
use_arrow=$(get_tmux_option "@minimal-tmux-use-arrow" false)
if "$use_arrow"; then
  rarrow=$(get_tmux_option "@minimal-tmux-right-arrow" "")
  larrow=$(get_tmux_option "@minimal-tmux-left-arrow" "")
else
  larrow=""
  rarrow=""
fi
bg=$(get_tmux_option "@minimal-tmux-bg" '#d47d49')
fg=$(get_tmux_option "@minimal-tmux-fg" '#0f0908')

status=$(get_tmux_option "@minimal-tmux-status" "bottom")
justify=$(get_tmux_option "@minimal-tmux-justify" "centre")

indicator_state=$(get_tmux_option "@minimal-tmux-indicator" true)
right_state=$(get_tmux_option "@minimal-tmux-right" true)
left_state=$(get_tmux_option "@minimal-tmux-left" true)

if [ "$indicator_state" = true ]; then
  indicator=$(get_tmux_option "@minimal-tmux-indicator-str" "  tmux  ")
else
  indicator=""
fi

window_status_format=$(get_tmux_option "@minimal-tmux-window-status-format" ' #I:#W ')
status_right=$(get_tmux_option "@minimal-tmux-status-right" "#S")
status_left=$(get_tmux_option "@minimal-tmux-status-left" "#[bg=default,fg=default,bold]#{?client_prefix,,${indicator}}#[bg=${bg},fg=${fg},bold]#{?client_prefix,${indicator},}#[bg=default,fg=default,bold]")
expanded_icon=$(get_tmux_option "@minimal-tmux-expanded-icon" ' 󰊓 ')
show_expanded_icon_for_all_tabs=$(get_tmux_option "@minimal-tmux-show-expanded-icon-for-all-tabs" false)

status_right_extra="$status_right$(get_tmux_option "@minimal-tmux-status-right-extra" '')"
status_left_extra="$status_left$(get_tmux_option "@minimal-tmux-status-left-extra" '')"

if [ "$right_state" = false ]; then
  status_right_extra=""
fi

if [ "$left_state" = false ]; then
  status_left_extra=""
fi

tmux set-option -g status-position "${status}"
tmux set-option -g status-style bg=default,fg=default
tmux set-option -g status-justify "${justify}"
tmux set-option -g status-left "${status_left_extra}"
tmux set-option -g status-right "${status_right_extra}"
tmux set-option -g window-status-format "${window_status_format}"
tmux set-option -g window-status-current-format "#[fg=${bg}]$larrow#[bg=${bg},fg=${fg}]${window_status_format}#[fg=${bg},bg=default]$rarrow#{?window_zoomed_flag,${expanded_icon}, }"
if [ "$show_expanded_icon_for_all_tabs" = true ]; then
  tmux set-option -g window-status-format " ${window_status_format}#{?window_zoomed_flag,${expanded_icon}, }"
fi
