# define env variables
export CLICOLOR_FORCE=1
export GOPATH=~/code/go
export HOMEBREW_BUNDLE_NO_LOCK=1

# add homebrew and user scripts to path
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
export PATH=~/.bin:$PATH

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

function mkd(){
  mkdir -p "$1"; cd "$1"
}

function wip() {
  git commit --no-verify -m "wip: $*"
}

# prompts, env managers, etc
eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"
eval "$(frum init)"

# syntax highlighting (must be at end)
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh