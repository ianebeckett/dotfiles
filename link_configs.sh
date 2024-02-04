#! /usr/bin/env bash 

for dir in ~/.dotfiles/.config/*; do
	if [ -d "$dir" ]; then
		dirname=$(basename "$dir")
		ln -s $dir ~/.config/$dirname
	fi
done
