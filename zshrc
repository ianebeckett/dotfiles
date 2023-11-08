# variables

# zsh options
setopt hist_ignore_dups share_history # see zshoptions(1)

# Turn off all beeps
unsetopt BEEP

# Keep 10000 lines of history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# aliases
# bypass an alias with $command foo

alias ls='ls -Fh --color=auto;'

alias gdb='gdb -quiet'

# functions
function ll() {
    { echo permissions links owner group size month date time name;
        command ls -AlFh; # --color-auto can't be used here, since it's piped into column
    } | 
    column -t |
    grep -v "total" # remove total size of this directory from ls
};

# print contents after moving to given directory
function cd() {
    builtin cd $@
    ls
}

# prompt customization

# ls colors. for more info: $dircolors -p, $man dircolors
eval $(dircolors -b ~/.dircolors)

# git prompt
# tokens: https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#Version-Control-Information:~:text=In%20normal%20formats%20and%20actionformats%20the%20following%20replacements%20are%20done%3A
autoload -Uz vcs_info # enable vcs_info
setopt prompt_subst # allow prompt substitution
zstyle ':vcs_info:*' enable git # save some time by only enabling git
zstyle ':vcs_info:*' check-for-changes true # needed for %c
zstyle ':vcs_info:*' unstagedstr '%F{1} *'
zstyle ':vcs_info:*' formats '%F{green}[%s:%b%u%F{green}]%f' # git (vcs) style
precmd() { vcs_info } # run vcs_info as a pre-command

PROMPT='%F{24}[%n@%m$f %F{24}%~]%f${vcs_info_msg_0_}%(!.#.$) ' # %(!.#.%$) gives # if root else $. see zshmisc(1)

#RPROMPT=foo # right-side prompt

# use %L to show level of subshell nesting
# enter a subshell: $zsh; exit subshell: $exit
#TODO: only show %L if in a subshell i.e if greater than 1
#PROMPT='%F{24}[%n@%m$f %F{24}%~]%f L%L ${vcs_info_msg_0_}%(!.#.$) '

# custom PATH locations
export JAVA_HOME=/usr/lib/jvm/jdk-19
export PATH=/usr/local/apache-maven-3.9.5/bin:$JAVA_HOME:$PATH

# start ssh-agent
eval $(ssh-agent -s) > /dev/null
ssh-add -q ~/.ssh/yoga

# cd to $HOME when sourcing #TODO: what about when starting a subshell?
cd
