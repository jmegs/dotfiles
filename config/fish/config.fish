set -g fish_greeting # null out welcome message

# soup up path, persistently, in the correct order, 
# and as a colon delimited path string
fish_add_path --global --move --path /opt/homebrew/bin /opt/homebrew/sbin "~/.bin"

set -gx ARTIFACTORY_USERNAME jmeguerian
set -gx ARTIFACTORY_TOKEN $(cat ~/.ssh/artifactory_token)
set -gx VISUAL nvim

if command -q eza
    # Eza is available, so replace ls
    alias ls='eza'
    alias l='eza --tree --level=1 --group-directories-first'
    alias la='eza --all --tree --level=1 --group-directories-first'
    alias lt='eza -T --group-directories-first --git-ignore -I node_modules'
end

alias g="git "
alias mkdir="mkdir -p"
alias dot="cd ~/.dotfiles"

zoxide init fish | source
