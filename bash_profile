## Bash profile: Marc Hibbins (@marchibbins)

# Let's stick with .bashrc
# Note: .bash_profile is read at login, .bashrc thereafter
# e.g. for a new terminal window (xterm)

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
