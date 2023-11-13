#! #TODO: put zsh path in shebang
# since most of this requires sudo, we can just run it with $ sudo ./setup_apt.zsh
# sudo kept in commands here in case we want to limit the sudo scope to less than this whole file in the future

echo "\n setting up apt \n"

if exists apt; then
    echo 'apt already exists' #TODO: display path of program like dotbot does for links (alter exists()/use which?)
else
    echo 'setup_apt.zsh: TODO: put apt install script in setup_apt.zsh'
    #/bin/bash -c '$(curl -fsSL TODO: put apt URI here)'
fi

# set up nala

# add nala repository
echo "deb http://deb.volian.org/volian/ scar main" |
sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list; wget -qO - https://deb.volian.org/volian/scar.key |
sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg

# install nala
sudo apt update && sudo apt install nala

# parallel install other software with nala

# remove other junk
sudo apt-get remove ubuntu-web-launchers rhythmbox -y

# add repositories
sudo add-apt-repository ppa:tomtomtom/yt-dlp

# update mirrors
sudo nala fetch

# Update package lists
sudo apt update

# sudo apt install gnome-software

# install packages
# use apt-get and apt-cache in lieu of apt for backwards compatibility with scripts
# be sure to install desired packages that were removed while purging snaps
for i in bat tldr vlc yt-dlp; do
  sudo nala install -y $i
done

echo "\n inished installing apt packages. Reboot now \n"
