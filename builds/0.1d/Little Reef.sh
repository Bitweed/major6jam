#!/bin/sh
echo -ne '\033c\033]0;Little Reef\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Little Reef.x86_64" "$@"
