# zshrc only loads in interactive shells
# use ~/.dotfiles/zshenv to run commands in non-interactive shells
echo 'howdy from .zshrc'

# variables
# view system environment variables with env

# use bat for man page syntax highlighting
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"

# zsh options. see man zshoptions
unsetopt BEEP
 
# history #TODO: is this slowing my startup down?
setopt HIST_IGNORE_ALL_DUPS SHARE_HISTORY
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# aliases
# use single quotes to preserve the string literal
# bypass an alias with command foo

alias gdb='gdb -quiet'

alias ls='ls -lFh --color=auto'

# print $PATH, one per line
alias path='<<<${(F)path}'

# print contents after moving to given directory
#TODO: move to precmd?
function cd() {
    builtin cd $@
    command ls -A --color=auto
}

# functions
#TODO: use eza instead of pipes?
function ll() {
    { echo permissions links owner group size month date time name;
        command ls -lAFh; # --color-auto can't be used here, since it's piped into column
    } | 
    column -t |
    grep -v 'total' # remove total size of this directory from ls
};

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

# start ssh-agent
eval $(ssh-agent -s) > /dev/null
ssh-add -q ~/.ssh #TODO: does this work?

# cd to $HOME when sourcing #TODO: what about when starting a subshell?
cd
 