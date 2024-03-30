#echo "howdy from .zshrc"

unsetopt BEEP

mkdir -p $XDG_CACHE_HOME/zsh
touch $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
autoload -U compinit && compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# vi mode; esc to simulate normal mode; i for insert mode
# # TODO: superfluous with tmux vi mode?
bindkey -v
export KEYTIMEOUT=1

mkdir -p $XDG_STATE_HOME/zsh
touch $XDG_STATE_HOME/zsh/zsh_history
HISTFILE=$XDG_STATE_HOME/zsh/zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt INC_APPEND_HISTORY # write to the history file immediately
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# source software that's fundemental to my worflow
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
# TODO: unhide files that are in their proper xdg config dirs
source $ZDOTDIR/.zsh_aliases
source $ZDOTDIR/.zsh_functions
addToPathFront $HOME/scripts

session-widget() { tmux-sessionizer }
zle -N session-widget
bindkey ^f session-widget

cheat-widget() { cht.sh }
zle -N cheat-widget
bindkey ^h cheat-widget

# precmd runs after executing a command, before the next prompt is printed
# there is also preexec
precmd() {
    print -Pn "\e]0;%~\a";
    vcs_info 2> /dev/null # silence git complaining when working with bare repos
}

zstyle ':vcs_info:*' enable git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{1}*'
#  we don't need '%s:' unless we're using multiple vcs. I only use git, so it's just clutter.
zstyle ':vcs_info:*' formats '%F{green} (%b%u%F{green})%f'
PROMPT='%B%F{green}@%f: %F{blue}%~%f${vcs_info_msg_0_}%b %(!.#.$) '

# start ssh-agent (keyring already does this on ubuntu: $ ps -aux | grep ssh)
# eval "$(ssh-agent -s)" > /dev/null
# for file in .ssh:
    # ssh-add -q ~/.ssh/foo

# plugins
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# things addded by outside scripts, e.g. version managers
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# source misc software
export VOLTA_HOME="$HOME/.volta"
addToPathFront "$VOLTA_HOME/bin"

# 438 environment variables
export MY_INSTALL_DIR=$HOME/.local
addToPathFront $MY_INSTALL_DIR/bin
export LD_LIBRARY_PATH=/usr/local/lib

# capstone environment variables
addToPathFront /home/ian/college/482-capstone/brlcad/build/bin
