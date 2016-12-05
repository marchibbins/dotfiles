## Bashrc: Marc Hibbins (@marchibbins)

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# ------------------------------------------
# General settings
# ------------------------------------------

# Platform name
platform=$(uname)

export EDITOR=vim
export TERM=xterm-256color

# Larger bash history, ignore duplicates
export HISTCONTROL=ignoreboth
export HISTFILESIZE=10000
export HISTSIZE=10000

# Append to history, don't overwrite
shopt -s histappend

# Wrap lines correctly after resizing window
shopt -s checkwinsize

# Make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Auto-completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    source /etc/bash_completion
fi

# Colour for OS X
export CLICOLOR=1

# Use dircolors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# ------------------------------------------
# Aliases
# ------------------------------------------

# cd
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd..='cd ..'

# ls
if [[ $platform == 'Linux' ]]; then
    alias ls='ls --color=auto'
elif [[ $platform == 'Darwin' ]]; then
    alias ls='ls -G'
    export LSCOLORS=GxFxCxDxBxegedabagaced
fi

alias l='ls -CF'
alias la='ls -AF'
alias ll='ls -AlF'
alias lt='ls -AlFt'

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Git
alias gs='git status'
alias gss='git status -s'
alias gd='git diff'
alias gb='git branch'
alias gl='git log'
alias gls='git ls'
alias glast='git last'

# Python
alias pym='python manage.py'
alias clearpyc='find . -name "*.pyc" -exec rm {} \;'
alias serve='python -m SimpleHTTPServer'

# ------------------------------------------
# Shortcuts
# ------------------------------------------

# Change into new directory
cdmkdir () {
    mkdir -p "$@" && cd "$@";
}

# Create new tmux session using dir name
tmuxn () {
  tmux new-session -As `basename $PWD`
}


# Prompt - credit to @jsummerfield
if [ -f ~/.bash_prompt ]; then
    source ~/.bash_prompt
fi

# ------------------------------------------
# Environment
# ------------------------------------------

# NVM
export NVM_DIR="/home/marc/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
