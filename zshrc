#! /usr/bin/env zsh

# zshrc only loads in interactive shells
# use ~/.dotfiles/zshenv to run commands in non-interactive shells
echo "howdy from .zshrc \n"

# variables
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
    builtin cd "$@" #TODO: quote "$@" for consistency? #TODO: builtin vs command?
    ls -lFh --color=auto
}

# use VSCodium instead of Microsoft VS Code
code() {
    command codium "$@"
}

#TODO: use eza instead of pipes?
#function ll() {
#    { echo permissions links owner group size month date time name;
#        command ls -lAFh; # --color-auto can't be used here, since it's piped into column # todo: does it work now that i've added grep --color=auto?
#    } | 
#    column -t |
#    grep -v 'total' # remove total size of this directory from ls
#};

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

# precmd runs before every prompt. Use it to hot-update between commands
precmd() {vcs_info} # run vcs_info as a pre-command

PROMPT='%F{24}[%n@%m$f %F{24}%~]%f${vcs_info_msg_0_}%(!.#.$) ' # %(!.#.%$) gives # if root else $. see zshmisc(1)

# custom $PATH locations
#TODO: stop duplicating elements in PATH
export JAVA_HOME=/usr/lib/jvm/jdk-19
export PATH=/usr/local/apache-maven-3.9.5/bin:$JAVA_HOME:$PATH

# start ssh-agent (apparently, keyring already does this on ubuntu: $ ps -aux | grep ssh)
#eval "$(ssh-agent -s)" > /dev/null
#ssh-add -q ~/.ssh #TODO: does this work, or do I need to specify the file(s)? Maybe ~/.ssh/*.pub works.

# cd to $HOME when sourcing
cd

