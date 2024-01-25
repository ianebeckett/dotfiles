#! /usr/bin/env zsh

# disable error reporting for Ubuntu
sudo sed -i 's/enabled=1/enabled=0/g' /etc/default/apport

# update tldr db
tldr --update
