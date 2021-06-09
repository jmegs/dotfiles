#!/usr/bin/env bash

# check for homebrew and install if not there
if test ! $(which brew); then
    echo "> Installing homebrew…"
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if test ! $(which brew); then
  echo ""
  echo "> Homebrew install failed! Try again manually"
  echo ""
fi

# make sure we've got latest recpies
brew update

# install latest zsh
echo "> Changing shell to latest zsh version…"
brew install zsh
echo '/opt/homebrew/bin/zsh' | sudo tee -a /etc/shells > /dev/null
chsh -s /usr/local/bin/zsh

##########################
# Install things
##########################
binaries=(
    exa
    ffmpeg
    gh
    git
    golang
    heroku/brew/heroku
    hugo
    jq
    mas
    neovim
    pure
    rename
    ruby-install
    trash
    tree
    wget
    youtube-dl
)

echo "> Installing binaries with brew…"
brew install "${binaries[@]}"

# Install node via volta
echo "> Installing node…"
curl https://get.volta.sh | bash
volta install node
volta install yarn

yarn config set init-license "MIT"
yarn config set init-version "0.0.1"

modules=(
    diff-so-fancy
    serve
    svgo
)

echo "> Installing global node modules…"
yarn global add "${modules[@]}"

masapps=(
    290986013 # deliveries
    904280696  # Things
    775737590  # iA Writer
    409183694  # Keynote
    1440147259 # Adguard
    1532801185 # mymind
)

echo "> Installing App Store apps…"
mas signin "johnmeguerian@gmail.com"
mas install "${masapps[@]}"

apps=(
    1password
    appcleaner
    brave-browser
    choosy
    cleanshot
    discord
    figma
    firefox
    homebrew/cask-versions/figma-beta
    imageoptim
    iterm2
    raycast
    rectangle
    slack
    spotify
    visual-studio-code
)

echo "> Installing applications…"
brew install --cask --appdir="/Applications" "${apps[@]}"

# Install quicklook plugins
qlplugins=(
  qlcolorcode
  qlmarkdown
  qlstephen
)

echo "> Installing QuickLook plugins..."
brew install --cask "${qlplugins[@]}"

qlmanage -r
qlmanage -r cache

# set things up
echo "> Linking dotfiles to $HOME…"
script/zsh && script/setup && script/setup-mac

echo "> Cleaning up…"
brew cleanup
brew cask cleanup