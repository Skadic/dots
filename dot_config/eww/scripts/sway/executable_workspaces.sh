#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
workspaces=$(swaymsg -t get_workspaces | jq -Mrc ".[].name |= tonumber | map({name, urgent, focused, visible, dummy: false})")
base=$(cat "$script_dir/base.json");

echo "$workspaces$base" | jq -cMs 'add | unique_by(.name) | sort_by(.name)'
