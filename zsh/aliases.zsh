# Shortcuts
alias refresh="source ~/.zshrc"
alias cc="cd ~/Code"
alias cdd="cd ~/Desktop"
alias dots="cd ~/.dotfiles"

# It's CD-ing with style
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Listing
alias l="ls -1" # single col
alias ll="ls -lhFG" # list long
alias la="ls -1a" # single col + dots
alias lla="ls -lahFG" # list long + dots

# Create intermediate directories
# Why is this not the default?
alias mkdir="mkdir -p"

# Grep with ~*passion*~
alias grep="grep --color=auto"

# Sudo
alias sudo="sudo " # make sudo work with aliases
alias please="sudo " # ask nicely

# Show/hide hidden files in Finder
alias showhidden="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# how many characters in the current clipboard
alias charcount="pbpaste | wc"

# because typing bundle exec sucks
alias be="bundle exec "

# pretty print the PATH
alias printpath='echo $PATH | tr -s ":" "\n"'

# pretty tree
alias et="exa -T --group-directories-first --git-ignore"