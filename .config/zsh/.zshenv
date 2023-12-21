#!/usr/bin/env zsh

# runs in both interactive and non-interactive shells
# CAUTION: other zsh files are sourced after zshenv, and could overwrite these settings
# WARNING: do not modify the default behaviour of standard commands here, as many tools rely on those. Do so only in .zshrc
#echo "howdy from .zshenv"

# environment variables
# default programs
#export EDITOR="nvim" #TODO: update
#export TERMINAL="st" #TODO: update
#export BROWSER="firefox" #TODO: do I want zshenv to set a different broswer from the one I typically use?

# clean up ~/
export LESSHISTFILE="-"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
#store user-specific executables in ~/.local/bin
export ZDOTDIR="$HOME/.config/zsh" #TODO: ensure that this isn't making a dir with all file permissions

exists() {
    command -v $1 > /dev/null 2>&1
}

addToPath() {
    if ! $(echo "$PATH" | tr ":" "\n" | grep -qx "$1") ; then
        PATH=$PATH:$1 ;
    fi
}

addToPathFront() {
    if ! $(echo "$PATH" | tr ":" "\n" | grep -qx "$1") ; then
        PATH=$1:$PATH ;
    fi
}

