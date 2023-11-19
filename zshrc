#! /usr/bin/env zsh

# zshrc only loads in interactive shells
# use zshenv to run commands in non-interactive shells
echo "howdy from .zshrc"

# variables
#TODO: move environment variables to zhsenv?
# view system environment variables with env

# use bat for man page syntax highlighting
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"

# zsh options. see man zshoptions
unsetopt BEEP

# history #TODO: is this slowing my startup down?
setopt HIST_IGNORE_ALL_DUPS SHARE_HISTORY #TODO: stop ignoring dups?
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# aliases

# use single quotes to preserve the string literal
# bypass an alias with command foo  
alias ..='cd ..'
alias gdb='gdb -quiet' #TODO: change alias to accept args?
alias gs='git status' #TODO: remove?
alias ls='ls -lFh --color=auto'
alias ll='ls -lAFh'
alias path='<<<${(F)path}' # print $PATH, one per line
alias mv='mv -i'
alias rm='rm -i'

# functions

# use nala instead of apt
apt() { 
    command nala "$@"
}

# print contents after moving to given directory
function cd() {
    builtin cd "$@" #TODO: builtin vs command?
    ls -lFh --color=auto
}

# use VSCodium instead of Microsoft VS Code
code() {
    command codium "$@"
}

# everything that is aliased and also needs sudo should have a branch in this sudo() function
sudo() {
    if [ "$1" = "apt" ]; then
        shift
        command sudo nala "$@"
    else
        command sudo "$@"
    fi
}

# prompt customization

# ls colors. for more info: dircolors -p, man dircolors
eval $(dircolors -b ~/.dircolors)

# git prompt
# tokens: https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#Version-Control-Information:~:text=In%20normal%20formats%20and%20actionformats%20the%20following%20replacements%20are%20done%3A
autoload -Uz vcs_info # enable vcs_info
setopt prompt_subst # allow prompt substitution
zstyle ':vcs_info:*' enable git # save some time by only enabling git
zstyle ':vcs_info:*' check-for-changes true # needed for %c
zstyle ':vcs_info:*' unstagedstr '%F{1} *'
zstyle ':vcs_info:*' formats '%F{green}[%s:%b%u%F{green}]%f' # style

# precmd runs after executing a command, before the next prompt is printed. Use it to hot-update between commands
precmd() {
    vcs_info
}

PROMPT='%F{24}[%n@%m$f %F{24}%~]%f${vcs_info_msg_0_}%(!.#.$) ' # %(!.#.%$) gives # if root else $. see zshmisc(1)

# start ssh-agent (apparently, keyring already does this on ubuntu: $ ps -aux | grep ssh)
#eval "$(ssh-agent -s)" > /dev/null
#ssh-add -q ~/.ssh #TODO: does this work, or do I need to specify the file(s)? Maybe ~/.ssh/*.pub works.

# cd to $HOME when sourcing
cd
