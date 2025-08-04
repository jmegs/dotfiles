# add homebrew and user scripts to path
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
export PATH=~/.bin:$PATH
export ARTIFACTORY_USERNAME=jmeguerian
export ARTIFACTORY_TOKEN=$(cat ~/.ssh/artifactory_token)

# initialize zsh completions
# make homebrew ones available
if type brew &>/dev/null
then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# turn on completions
autoload -Uz compinit && compinit

# add case insensitive cd
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# aliases & functions
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias printpath='echo -e ${PATH//:/\\n}'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la --color=always'
alias lt='tree -I "node_nodules|.git"'
alias g='git '

if command -v eza >/dev/null 2>&1; then
    # Command is available, so replace ls with eza
    alias ls='eza'
    alias l='eza --tree --level=1 --group-directories-first'
    alias la='eza --all --tree --level=1 --group-directories-first'
    alias lt='eza -T --group-directories-first --git-ignore -I node_modules'
fi

# load custom functions
function mkd(){
  mkdir -p "$1"; cd "$1"
}

function wip() {
  git commit --no-verify -m "wip: $*"
}

# prompts, env managers, etc
eval "$(mise activate zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# syntax highlighting (must be at end)
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
