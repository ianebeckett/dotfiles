#! /usr/bin/env zsh

# runs in both interactive and non-interactive shells
# CAUTION: other zsh files are sourced after zshenv, and could overwrite these settings
# WARNING: do not modify the default behaviour of standard commands here, as many tools rely on those

echo "howdy from .zshenv \n"

# environment variables

# default programs
#export EDITOR="nvim"
#export TERMINAL="st"
export BROWSER="firefox"

# clean up ~/
export LESSHISTFILE="-"
export ZDOTDIR="$HOME/.config/zsh"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# useful for conditional installs
# command -v is like which, but returns exit status
function exists() {
    command -v $1 > /dev/null 2>&1
}
