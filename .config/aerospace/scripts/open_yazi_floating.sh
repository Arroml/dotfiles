#!/usr/bin/env bash

set -euo pipefail

before_window_id="$(aerospace list-windows --focused --format '%{window-id}' 2>/dev/null || true)"

wezterm start --cwd "${HOME}" yazi >/dev/null 2>&1 &

for _ in {1..40}; do
  current_window="$(aerospace list-windows --focused --json 2>/dev/null || true)"
  current_window_id="$(printf '%s' "$current_window" | jq -r '.[0]["window-id"] // empty')"
  current_app_name="$(printf '%s' "$current_window" | jq -r '.[0]["app-name"] // empty')"

  if [[ -n "$current_window_id" && "$current_window_id" != "$before_window_id" && "$current_app_name" == "WezTerm" ]]; then
    aerospace layout floating
    exit 0
  fi

  sleep 0.1
done

exit 1
