# define env variables
export GOPATH=~/code/go
export PNPM_HOME=/Users/jmeguerian/Library/pnpm
export HOMEBREW_BUNDLE_NO_LOCK=1
export NODEJS_CHECK_SIGNATURES=no

path=('/opt/homebrew/bin' '/opt/homebrew/sbin' "$PNPM_HOME" $path)
path+=(~/.bin)
export PATH

# define aliases
alias printpath='echo -e ${PATH//:/\\n}'

# init plugin manager
source /opt/homebrew/share/antigen/antigen.zsh

# load the omz library
antigen use oh-my-zsh

# list plugins
antigen bundle asdf
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme geometry-zsh/geometry

antigen apply