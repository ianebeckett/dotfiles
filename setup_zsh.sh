# usr/bin/env bash

mkdir $XDG_CONFIG_HOME/zsh
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
rm ~/.zsh_history
rm ~/.zcompdump
ln -s $ZDOTDIR/.zshenv ~/.zshenv
ln -s $ZDOTDIR/.zshrc ~/.zshrc
