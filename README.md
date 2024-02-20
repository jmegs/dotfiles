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

Restart your shell, then `mise` should pick up on tool version from its global config.
if not, tell it to use global defaults with:

```zsh
mise use --global
```

reminder: also log into work NPM
https://squarespace.atlassian.net/wiki/spaces/REL/pages/29392710931/Configuring+Npm+Client+npm
