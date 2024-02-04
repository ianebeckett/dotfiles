#! /usr/bin/env zsh

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# TODO: do PackerSync etc via script?
echo "now do: evim, :so packer, :PackerSync"
