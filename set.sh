#!/usr/bin/env bash

if [ $# -ne 1 ]
then
    echo >&2 give colorscheme as sole argument
    exit 1
fi

here="$(dirname "$0")"

alacritty="$here/base16-alacritty/colors/base16-$1.toml"
if [ ! -f "$alacritty" ]
then
    echo >&2 could not find theme
    exit 1
fi

base=~/.cache/cocyc
mkdir -p "$base"
ln -fs "$(realpath "$alacritty")" "$base/alacritty.toml"
ln -fs "$(realpath "$here/base16-i3/colors/base16-$1.config")" "$base/i3.config"
echo "colo base16-$1" >"$base/vim.vim"
echo "$1" >"$here/current"
