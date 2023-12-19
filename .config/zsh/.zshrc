# zshrc only loads in interactive shells. This is the a good place to put
# things only relevant to interactive zsh shell usage
# use zshenv to run commands in non-interactive shells.
# this is also the most apt place for editing PATH

#echo "howdy from .zshrc"

# initialize zsh compsys
autoload -U compinit && compinit -d $XDG_CACHE_HOME/zsh/.zcompdump-$ZSH_VERSION

# variables
# view system environment variables with env

# use bat for man page syntax highlighting
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"

unsetopt BEEP

# history
# TODO: configure persistent autosuggestions from history across sessions.
setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE="$XDG_STATE_HOME"/zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=9999
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

# path
export PATH=~/scripts:$PATH

# aliases
# use single quotes to preserve the string literal
# bypass an alias with command foo 
alias ..='cd ..'
alias gdb='gdb -quiet' #TODO: change alias to function to accept args? Use cgdb?
alias gs='git status'
alias ls='ls -lh --color=auto'
alias la='ls -lAh'
alias path='<<<${(F)path}' # print $PATH, one per line
alias mv='mv -i'
alias rm='rm -I'
alias mkdir="mkdir -p"

# TODO: integrate tmux windowizer to exec vim from the parent directory so harpoon remembers list
# TODO: change paths to be via $DOTFILES, as opposed to symlinks, to enable fugitive
alias ezsh="vim $ZDOTDIR"
alias evim="vim $XDG_CONFIG_HOME/nvim"
#alias ei3="vim $XDG_CONFIG_HOME/i3"
#alias eterm="vim $XDG_CONFIG_HOME/xterm"
#alias etmux="vim $XDG_CONFIG_HOME/tmux.conf"

#alias study=
#alias work=

# functions
# intellij idea
idea() {
    idea.sh "$@"
}

cat() {
    command batcat "$@"
}

function cd() {
    builtin cd "$@" #TODO: builtin vs command?
    ls -lh --color=auto
}

code() {
    command codium "$@"
}

# precmd runs after executing a command, before the next prompt is printed
# there is also preexec
precmd() {
    print -Pn "\e]0;%~\a";
    vcs_info
}

# prompt customization
# ls colors. for more info: dircolors -p, man dircolors
# eval $(dircolors -b ~/.dircolors)
# git prompt
zstyle ':vcs_info:*' enable git # save some time by only enabling git
autoload -Uz vcs_info # enable vcs_info
setopt prompt_subst # allow prompt substitution
zstyle ':vcs_info:*' check-for-changes true # needed for %c
zstyle ':vcs_info:*' unstagedstr '%F{1}*'
#  we don't need '%s:' unless we're using multiple vcs. I only use git, so it's just clutter.
zstyle ':vcs_info:*' formats '%F{green} (%b%u%F{green})%f' # style
# user@host (%n@%m) is unnecessary; on the rare occasion that we need to check
# those variables, we can just echo $USER @ $HOST
PROMPT='%B%F{green}@%f: %F{blue}%~%f${vcs_info_msg_0_}%b %(!.#.$) '

# start ssh-agent (keyring already does this on ubuntu: $ ps -aux | grep ssh)
#eval "$(ssh-agent -s)" > /dev/null
# ssh-add -q ~/.ssh #TODO: does this work, or do I need to specify the file(s)?
# Maybe ~/.ssh/*.pub works.

#plugins
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

