#! /usr/bin/env zsh

# runs in both interactive and non-interactive shells
# of course, it doesn't run with source ~/.zshrc
echo "howdy from .zshenv \n"

# environment variables

# default programs
#export EDITOR="nvim"
#export TERMINAL="st"
export BROWSER="firefox"

# clean up ~/
export LESSHISTFILE="-"
export ZDOTDIR="$HOME/.config/zsh"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"

# useful for conditional installs
# command -v is like which, but returns exit status
function exists() {
    command -v $1 > /dev/null 2>&1
}
