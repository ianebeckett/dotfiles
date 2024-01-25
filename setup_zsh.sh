# usr/bin/env bash

mkdir $XDG_CONGIG_HOME/zsh
mv ~/.zcompdump $ZDOTDIR
rm ~/.zsh_history
ln -s $ZDOTDIR/.zshenv ~/.zshenv
ln -s $ZDOTDIR/.zshrc ~/.zshrc
