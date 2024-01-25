#! /usr/bin/env zsh

#! #TODO: put zsh path in shebang
# since most of this requires sudo, we can just run it with $ sudo ./setup_apt.zsh
# sudo kept in commands here in case we want to limit the sudo scope to less than this whole file in the future

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

# Update package lists
sudo apt update

# install packages
# use apt-get and apt-cache in lieu of apt for backwards compatibility with scripts
# be sure to install desired packages that were removed while purging snaps
for i in bat neovim git tldr fzf vlc yt-dlp ; do
  sudo apt install -y $i
done

echo "finished installing apt packages. Reboot now, then run setup_after_apt.zsh. \n"
