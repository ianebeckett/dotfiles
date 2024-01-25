# usr/bin/env bash

mkdir $XDG_CONFIG_HOME/zsh
mv ~/.zcompdump $ZDOTDIR
rm ~/.zsh_history
ln -s $ZDOTDIR/.zshenv ~/.zshenv
ln -s $ZDOTDIR/.zshrc ~/.zshrc
