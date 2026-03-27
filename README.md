# Dotfiles

Config files. There are many like them, but these are mine.

## About

**Shell:** Fish, with [Hydro](https://github.com/jorgebucaran/hydro) prompt (via Fisher) and zoxide for fast directory jumping. The zshrc and Starship config are still around for reference but not actively used.

**Terminal:** Ghostty.

**Editor:** Neovim (LazyVim), with VS Code and Zed as GUI options.

**CLI upgrades:** eza (ls), bat (cat), btop (top), ripgrep (grep), diff-so-fancy (git pager), lazygit, jq, tree, trash.

**Runtime management:** mise handles Node, Python, etc. via a single global config.

**Dotfile management:** rcm symlinks everything from `~/.dotfiles` into the home directory. The `rcrc` file controls what gets excluded (like this README).

**Git:** Concise aliases, auto-pruning fetch, rebase-on-pull, diff-so-fancy paging. GitHub user: [jmegs](https://github.com/jmegs).

**Apps (via Homebrew casks):** 1Password, Raycast, Ghostty, Figma, Chrome, OrbStack, CleanShot, Slack, Discord, Spotify, and a few others.

## Set Up

### Prerequisites

- Command Line Tools
- Homebrew
- Clone this repo into `~/.dotfiles`

### Install software

```zsh
brew bundle --no-lock --file=~/.dotfiles/Brewfile
```

### Link config files

```zsh
# preview what will be linked
RCRC="~/.dotfiles/rcrc" lsrc

# if it looks good, link
RCRC="~/.dotfiles/rcrc" rcup
```

### Install Fish plugins

Install [Fisher](https://github.com/jorgebucaran/fisher), then let it pick up the tracked plugin list:

```fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher update
```

### Install tool versions

Restart your shell, then mise should pick up tool versions from its global config. If not:

```zsh
cd
mise install
```

### Work-specific setup

- Log into work's private npm registry via artifactory
