#echo "howdy from .zshrc"

# initialize zsh compsys
autoload -U compinit && compinit -d $XDG_CACHE_HOME/zsh/.zcompdump-$ZSH_VERSION

export MANPAGER="sh -c 'col -bx | batcat -l man -p'" # use bat for man page syntax highlighting

unsetopt BEEP

# TODO: configure persistent autosuggestions from history across sessions.
setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE="$XDG_STATE_HOME"/zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=9999
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

source $ZDOTDIR/.zsh_aliases
source $ZDOTDIR/.zsh_functions

bindkey -s ^f "tmux-sessionizer\n"

# precmd runs after executing a command, before the next prompt is printed
# there is also preexec
precmd() {
    print -Pn "\e]0;%~\a";
    vcs_info
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
# ssh-add -q ~/.ssh #TODO: does this work, or do I need to specify the file(s)?
# Maybe ~/.ssh/*.pub works.

# plugins
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

