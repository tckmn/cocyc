#!/usr/bin/env bash

if [ $# -ne 1 ]
then
    echo >&2 give colorscheme as sole argument
    exit 1
fi

alacritty="$(dirname "$0")/base16-alacritty/colors/base16-$1.toml"
if [ ! -f "$alacritty" ]
then
    echo >&2 could not find theme
    exit 1
fi

base=~/.cache/cocyc
mkdir -p "$base"
ln -fs "$(realpath "$alacritty")" "$base/alacritty.toml"
echo "colo base16-$1" >"$base/vim.vim"
