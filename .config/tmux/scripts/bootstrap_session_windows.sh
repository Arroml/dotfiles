#!/bin/sh

socket_path="$1"
session="$2"

if [ -z "$socket_path" ] || [ -z "$session" ]; then
  exit 1
fi

tmux_cmd() {
  tmux -S "$socket_path" "$@"
}

window_count="$(tmux_cmd display-message -p -t "$session" "#{session_windows}")"
if [ "$window_count" != "1" ]; then
  exit 0
fi

path="$(tmux_cmd display-message -p -t "$session:1.1" "#{pane_current_path}")"

for index in 2 3 4 5; do
  tmux_cmd new-window -d -t "$session:$index" -c "$path"
done

tmux_cmd select-window -t "$session:1"
