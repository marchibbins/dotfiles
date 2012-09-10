
## Bashrc: Marc Hibbins (@marchibbins)

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# ------------------------------------------
# General settings
# ------------------------------------------

export EDITOR=vim
export TERM=xterm-256color

# Larger bash history, don't duplicate lines
HISTCONTROL=ignoreboth
HISTFILESIZE=10000
HISTSIZE=10000

# Append to history, don't overwrite
shopt -s histappend

# Wrap lines correctly after resizing window
shopt -s checkwinsize

# Make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Auto-completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Color support aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ------------------------------------------
# Aliases
# ------------------------------------------

alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd..='cd ..'

# ls
alias l='ls -CF'
alias la='ls -AF'
alias ll='ls -AlF'

# Git
alias gs='git status'
alias gss='git status -s'
alias gd='git diff'
alias gb='git branch'
alias gl='git log'

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

# ------------------------------------------
# Prompt - credit to @jsummerfield
# ------------------------------------------

export VIRTUAL_ENV_DISABLE_PROMPT=1
parse_virtualenv() {
    if [ -n "$VIRTUAL_ENV" ] ; then
        basename $VIRTUAL_ENV | sed -e 's/\(.*\)/(\1) /'
    fi
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

PS1="\n\$(parse_virtualenv)\$(parse_git_branch)\h \e[0;32m\w\e[m\n\$ "

# ------------------------------------------
# Environment
# ------------------------------------------

# Virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# Node.js
. ~/.nvm/nvm.sh
