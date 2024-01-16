# define env variables
export CLICOLOR_FORCE=1
export GOPATH=~/code/go
export HOMEBREW_BUNDLE_NO_LOCK=1
# uncomment if nvm is causing the shell to slow down
# export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true

path=('/opt/homebrew/bin' '/opt/homebrew/sbin' $path)
path+=(~/.bin)
export PATH

# plugins
source $HOMEBREW_PREFIX/opt/zplug/init.zsh

zplug "lukechilds/zsh-nvm"
zplug "plugins/rbenv",   from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# turn on git stash status
zstyle :prompt:pure:git:stash show yes

if ! zplug check; then
  printf "Install zsh plugins? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

# aliases & functions
alias printpath='echo -e ${PATH//:/\\n}'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias l='ls -l'
alias la='ls -a'
alias lla='ls -la --color=always'
alias lt='tree -I "node_nodules|.git"'

alias g='git '

if command -v eza >/dev/null 2>&1; then
    # Command is available, so replace ls with lsd
    alias ls='eza'
    alias lt='eza -T --group-directories-first --git-ignore'
fi

function mkd(){
  mkdir -p $1; cd $1
}

function wip() {
  git commit --no-verify -m "wip: $*"
}
# bun completions
[ -s "/Users/john/.bun/_bun" ] && source "/Users/john/.bun/_bun"
