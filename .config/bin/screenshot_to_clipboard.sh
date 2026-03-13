#!/bin/sh

tmp_file="$(mktemp -t screenshot_clipboard).tiff"

cleanup() {
  rm -f "$tmp_file"
}

trap cleanup EXIT

# Give the keyboard firmware time to release Hyper modifiers before the
# interactive screenshot tool starts.
sleep 0.25

/usr/sbin/screencapture -i -x "$tmp_file" || exit 1

/usr/bin/osascript <<OSA
set the clipboard to (read (POSIX file "$tmp_file") as TIFF picture)
OSA
