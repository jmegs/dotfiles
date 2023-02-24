set -g fish_greeting # remove welcome message
set -gx GOPATH ~/code/go
set -gx HOMEBREW_BUNDLE_NO_LOCK 1
set -gx NODEJS_CHECK_SIGNATURES no
set -gx hydro_multiline true

# add homebrew things to the actual $PATH
fish_add_path -P /opt/homebrew/bin /opt/homebrew/sbin
fish_add_path -P $GOPATH/bin

# append ~/.bin to the end of the fish_user_paths
fish_add_path --append ~/.bin

# Path aliases
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias ......="cd ../../../../../"

alias mkdir="mkdir -p"
alias grep="grep --color=auto"
alias et="exa -T --group-directories-first --git-ignore"

alias g="git"

# source in asdf from homebrew
source (brew --prefix asdf)/libexec/asdf.fish

# pnpm
set -gx PNPM_HOME "/Users/john/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end