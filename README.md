# Dotfiles
set of new computer setup tasks, applications, and preferences. there are many like it, but this one is mine.

## Installation
when setting up a new mac, the bootstrap script runs everything in one shot.

```
# clone this repo to ~/.dotfiles then run
./bootstrap.sh
```

## Individual scripts
on existing setups, or to take things step by step, there are three main automation scripts

### Link
creates links between files ending in `.symlink` and their corresponding dotfiles in `$HOME`

```
./script/link.sh
```

### Install
installs all sorts of goodies: binaries and apps from homebrew as well as node and some global node modules

```
./script/install.sh
```

### Mac
sets sensible macOS defaults and preferences

```
./script/mac.sh
```
