# Dotfiles
Config files. There are many like them, but these are mine.

## Prerequisites
* Command Line Tools 
* Homebrew
* Clone repo into `~/.dotfiles`

## Install Software

```bash
brew bundle --no-lock --file=~/.dotfiles/Brewfile
```

## Link RC files

```bash
# test and make sure everything looks good
RCRC="~/.dotfiles/rcrc" lsrc

# if good, link
RCRC="~/.dotfiles/rcrc" rcup
```

## Set Default Shell to Fish

```bash
# check if fish is in `/etc/shells`
cat /etc/shells

# if not
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells

# set as default
chsh -s /opt/homebrew/bin/fish
```

## Install Runtimes

```sh
asdf plugin add nodejs
asdf plugin add ruby

asdf install nodejs lts
asdf ruby install latest

# do this when you have time
# it will take forever
NODEJS_CONFIGURE_OPTIONS='--with-intl=full-icu --download=all' NODEJS_CHECK_SIGNATURES="no" asdf install nodejs ref:v14.18.1
cd ~/.asdf/installs/nodejs
ln -s ref-v14.18.1 14.18.1
```

reminder: also log into work NPM
https://squarespace.atlassian.net/wiki/spaces/REL/pages/29392710931/Configuring+Npm+Client+npm


