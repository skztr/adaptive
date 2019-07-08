#!/bin/bash
orig="$PWD"
base="$(dirname "${BASH_SOURCE[0]}")"
cd "$base" || exit 1

zip -r "$orig/adaptive.zip" . -x '.git*' -x '*.zip' -x '*.sh'
