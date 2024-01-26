#! /usr/bin/env zsh

echo "setting up apt \n"

if exists apt; then
    echo 'apt already exists' #TODO: display path of program like dotbot does for links (alter exists()/use which?)
else
    echo 'setup_apt.zsh: TODO: put apt install script in setup_apt.zsh'
    #/bin/bash -c '$(curl -fsSL TODO: put apt URI here)'
fi

# remove junk
for i in rhythmbox ubuntu-web-launchers; do
  sudo apt-get remove -y $i
done

# add repositories
sudo add-apt-repository ppa:tomtomtom/yt-dlp
sudo add-apt-repository ppa:neovim-ppa/unstable

# Update package lists
sudo apt-get update

# install packages
# use apt-get and apt-cache in lieu of apt for backwards compatibility with scripts
# TODO: move list to file
for i in build-essential gdb libstdc++ pthread git xclip ripgrep tmux fzf bat neovim tldr vlc yt-dlp ; do
  sudo apt-get install -y $i
done

echo "finished installing apt packages. Reboot now, then run setup_after_apt.zsh. \n"
