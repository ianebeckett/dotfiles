
echo '\n setting up apt \n'

if exists apt; then
    echo 'apt exists; skipping install' #TODO: display path of program like dotbot does for links (alter exists()/use which?)
else
    echo 'TODO: put apt install script in setup_apt.zsh'
    #/bin/bash -c '$(curl -fsSL TODO: put apt URI here)'
fi
