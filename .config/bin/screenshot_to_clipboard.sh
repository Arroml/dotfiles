#!/bin/sh

tmp_file="$(mktemp -t screenshot_clipboard).tiff"

cleanup() {
  rm -f "$tmp_file"
}

trap cleanup EXIT

/usr/sbin/screencapture -i -x "$tmp_file" || exit 1

/usr/bin/osascript <<OSA
set the clipboard to (read (POSIX file "$tmp_file") as TIFF picture)
OSA
