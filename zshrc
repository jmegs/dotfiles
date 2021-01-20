# makes color constants available
autoload -U colors && colors
autoload -U compinit && compinit

# ensure dotfiles bin directory is loaded
export PATH="$HOME/.bin:/usr/local/sbin:$PATH"

# functions
[[ -f ~/.functions ]] && source ~/.functions

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# initialize antigen plugin anager
# https://github.com/zsh-users/antigen
source $(brew --prefix antigen)/share/antigen/antigen.zsh 

# load convenience plugins
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# asdf shell integration
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/asdf
antigen bundle ohmyzsh/ohmyzsh plugins/asdf

# apply antigen configuration
antigen apply

# load starship theme
eval "$(starship init zsh)"
