# define env variables
export GOPATH=~/code/go
export PNPM_HOME=/Users/jmeguerian/Library/pnpm
export HOMEBREW_BUNDLE_NO_LOCK=1
export NVM_LAZY_LOAD=true

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
antigen bundle lukechilds/zsh-nvm
antigen bundle rbenv
antigen bundle zsh-users/zsh-syntax-highlighting

# antigen theme geometry-zsh/geometry

# configure and apply theme
export TYPEWRITTEN_PROMPT_LAYOUT="pure"
export TYPEWRITTEN_RELATIVE_PATH="adaptive"
export TYPEWRITTEN_COLOR_MAPPINGS="primary:blue;secondary:magenta"
export TYPEWRITTEN_COLORS="git_branch:default"
antigen bundle reobin/typewritten@main

antigen apply