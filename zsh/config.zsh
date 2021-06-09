HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# don't clear the screen after quitting a man page
MANPAGER="less -x"

# always enable colored `grep`
GREP_OPTIONS="--color=auto"

# don't expand aliases prematurely
setopt complete_aliases

setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# case insensitive tab completions
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'