#!/usr/bin/env bash

set -euo pipefail

workspace="${1:?workspace is required}"

focused_workspace="$(aerospace list-workspaces --focused --format '%{workspace}' 2>/dev/null || true)"
visible_workspaces="$(aerospace list-workspaces --monitor all --visible --format '%{workspace}' 2>/dev/null || true)"
apps="$(
  aerospace list-windows --workspace "$workspace" --format '%{app-name}' 2>/dev/null \
    | awk '
        NF && !seen[$0]++ {
          apps[++count] = $0
        }
        END {
          for (i = 1; i <= count; ++i) {
            printf "%s%s", apps[i], (i < count ? " · " : "")
          }
        }
      '
)"

if [[ -z "$apps" ]]; then
  apps='empty'
fi

if [[ "${#apps}" -gt 30 ]]; then
  apps="${apps:0:27}..."
fi

background_color=0xff3c3836
icon_color=0xff7c6f64
label_color=0xffa89984

if [[ "$workspace" == "$focused_workspace" ]]; then
  background_color=0xffd79921
  icon_color=0xff282828
  label_color=0xff282828
elif printf '%s\n' "$visible_workspaces" | grep -Fxq "$workspace"; then
  background_color=0xff504945
  icon_color=0xfffabd2f
  label_color=0xffebdbb2
elif [[ "$apps" != 'empty' ]]; then
  icon_color=0xfffabd2f
  label_color=0xffebdbb2
fi

sketchybar --set "$NAME" \
  icon="$workspace" \
  icon.color="$icon_color" \
  label="$apps" \
  label.color="$label_color" \
  background.color="$background_color"
