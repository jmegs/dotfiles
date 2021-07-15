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

# just in case checks
if test ! $(which brew); then
    echo "> Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if test ! $(which brew); then
    echo ""
    fail "Failed to install homebrew. See https://brew.sh"
fi

if test ! $(which mas); then
    brew install mas
fi

if test ! $(which mas); then
    echo ""
    fail "Failed to install mas. Try manually."
fi

if test ! $(command -v nvm); then
    if [ -f ~/.nvm/nvm.sh ]; then
        echo 'sourcing nvm from ~/.nvm'
        . ~/.nvm/nvm.sh
    else
        fail 'make sure nvm is installed'
    fi
fi

brew update

binaries=(
    frum
    gh
    git
    golang
    heroku/brew/heroku
    hugo
    jq
    mas
    neovim
    postgresql
    rename
    shellcheck
    trash
    wget
    youtube-dl
)

echo "> Installing binaries..."
brew install "${binaries[@]}"

echo "> Installing node..."
nvm install node
nvm install --lts
npm config set init-license="MIT"
npm config set init-version="0.0.1"
nvm use node
nvm alias default node

modules=(
    diff-so-fancy
    serve
    svgo
    standard
    stylelint
    stylelint-config-standard
)

echo "> Installing global node modules"
npm install -g "${modules[@]}"

# MAS login is busted currently
# masapps=(
#     904280696  # Things
#     775737590  # iA Writer
#     409183694  # Keynote
# )

# echo "> Install App Store applications..."
# mas signin "johnmeguerian@gmail.com"
# mas install "${masapps[@]}"

apps=(
    1password
    adobe-creative-cloud
    raycast
    appcleaner
    bartender
    choosy
    cleanshot
    dropbox
    homebrew/cask-versions/figma-beta
    figma
    firefox
    imageoptim
    iterm2
    ngrok
    rectangle
    slack
    spotify
    visual-studio-code
)

echo "> Installing applications..."
brew install --cask --appdir="/Applications" "${apps[@]}"

qlplugins=(
    qlcolorcode
    qlmarkdown
    qlstephen
)

echo "> Installing QuickLook plugins..."
brew install --cask "${qlplugins[@]}"

qlmanage -r
qlmanage -r cache

echo "> Cleaning up..."
brew cleanup

echo "${GREEN}[SUCCESS] Installed all the things${ENDCOLOR}"