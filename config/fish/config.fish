# add homebrew things to the actual $PATH
fish_add_path -P /opt/homebrew/bin /opt/homebrew/sbin

# append ~/.bin to the end of the fish_user_paths
fish_add_path --append ~/.bin

set -g fish_greeting # remove welcome message

set -gx GOPATH ~/code/go
set -gx HOMEBREW_BUNDLE_NO_LOCK 1
set -gx NODEJS_CHECK_SIGNATURES no
set -gx hydro_two_line_prompt true

# Path aliases
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias ......="cd ../../../../../"

alias mkdir="mkdir -p"
alias grep="grep --color=auto"
alias et="exa -T --group-directories-first --git-ignore"

# source in asdf from homebrew
source (brew --prefix asdf)/libexec/asdf.fish