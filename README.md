# Dotfiles

Config files. There are many like them, but these are mine.

## Prerequisites

- Command Line Tools
- Homebrew
- Clone repo into `~/.dotfiles`

## Install Software

```zsh
brew bundle --no-lock --file=~/.dotfiles/Brewfile
```

## Link RC files

```zsh
# test and make sure everything looks good
RCRC="~/.dotfiles/rcrc" lsrc

# if good, link
RCRC="~/.dotfiles/rcrc" rcup
```

## Install Tool Versions

```zsh
fnm install --lts
frum install -l # list available rubies
frum install 3.3.0 # or whatever latest is
```

reminder: also log into work NPM
https://squarespace.atlassian.net/wiki/spaces/REL/pages/29392710931/Configuring+Npm+Client+npm
