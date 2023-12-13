# define env variables
export GOPATH=~/code/go
export PNPM_HOME=/Users/jmeguerian/Library/pnpm
export HOMEBREW_BUNDLE_NO_LOCK=1

# uncomment if nvm is causing the shell to slow down
# export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true

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

# configure and apply theme

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

antigen theme romkatv/powerlevel10k

antigen apply

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
