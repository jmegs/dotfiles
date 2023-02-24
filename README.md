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

## Install Runtimes

```sh
asdf plugin add nodejs
asdf plugin add ruby

asdf install nodejs lts
asdf ruby install latest
```

reminder: also log into work NPM
https://squarespace.atlassian.net/wiki/spaces/REL/pages/29392710931/Configuring+Npm+Client+npm


