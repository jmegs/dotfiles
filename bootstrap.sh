#!/usr/bin/env bash

DOTFILES_ROOT=$(pwd)
RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

set -e

fail () {
    printf "${RED}[ERROR] %s\n${ENDCOLOR}" "$1" && exit
}

echo ''

# is homebrew installed?
if test ! $(which brew); then
    echo "> Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if test ! $(which brew); then
    echo ""
    fail "Failed to install homebrew. See https://brew.sh"
fi

# is the shell latest zsh?
brew install zsh
ZSH_PATH=$(brew --prefix)/bin/zsh
echo $ZSH_PATH | sudo tee -a /etc/shells > /dev/null
chsh -s /usr/local/bin/zsh

# okay cool, lets link up our config files
echo "> Linking config files..."
. script/link.sh

echo "> Sourcing new zsh config..."
source $HOME/.zshrc

echo "> Installing software..."
. script/install.sh

echo "> Setting sensible defaults..."
. script/mac.sh

echo "${GREEN}[SUCCESS] Consider yourself bootstrapped.${ENDCOLOR}"
echo "${GREEN}[SUCCESS] Have a nice day.${ENDCOLOR}"