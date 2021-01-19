## For a new machine

### First, install homebrew and software from brew
```sh
# 1. Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Clone this directory to ~/.dotfiles
# git clone <THIS_URL> ~/.dotfiles

# 3. Install software from ./Brewfile
brew bundle --file=~/.dotfiles/Brewfile --no-lock

# 4. Reload your shell
```

### Then, link your dotfiles
```sh
# 1. Do an rcm dry run from this directory
RCRC=~/.dotfiles/rcrc lsrc

# 2. If everything looks good, link up dotfiles
RCRC=~/.dotfiles/rcrc rcup

# 3. Reload your shell
```

### Next, install language versions
```sh
# run the install-latest-languages script (this should now be in your PATH)
install-latest-languages
```

### Next, run the sensible defaults script
```sh
# run the set-sensible-defaults script. (this should now be in your PATH)
set-sensible-defaults 
```

### Finally, log in to 1password and Dropbox, and then all the other things
Try to log into dropbox before opening apps with synced preferences like alfred and iterm

## Ongoing maintenance
* periodically run `rcup` to make sure dotfiles are in sync
* 'bless' a new dotfile with `mkrc .thisrc`
* if you adopt or stop using an app, add it to ~/.dotfiles/Brewfile
