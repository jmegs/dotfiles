set -g fish_greeting # null out welcome message

set -gx ARTIFACTORY_USERNAME jmeguerian
set -gx ARTIFACTORY_TOKEN $(cat ~/.ssh/artifactory_token)
set -gx VISUAL nvim
set -gx PNPM_HOME /Users/jmeguerian/Library/pnpm

# soup up path, persistently, in the correct order, 
# and as a colon delimited path string
fish_add_path --global --move --path /opt/homebrew/bin /opt/homebrew/sbin "$PNPM_HOME" ~/.bin

if command -q eza
    # Eza is available, so replace ls
    alias ls='eza'
    alias l='eza --tree --level=1 --group-directories-first'
    alias la='eza --all --tree --level=1 --group-directories-first'
    alias lt='eza -T --group-directories-first --git-ignore -I node_modules'
end

if command -q bat
    alias cat='bat'
end

if command -q btm
    alias top="btm"
end

alias g="git "
alias mkdir="mkdir -p"
alias dot="cd ~/.dotfiles"

zoxide init fish | source
