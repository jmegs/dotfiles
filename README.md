# Dotfiles

Config files. There are many like them, but these are mine.

## About

**Shell:** Fish, with [Hydro](https://github.com/jorgebucaran/hydro) prompt (via Fisher) and zoxide for fast directory jumping. The zshrc and Starship config are still around for reference but not actively used.

**Terminal:** Ghostty.

**Editor:** Neovim (LazyVim), with VS Code and Zed as GUI options.

**CLI upgrades:** eza (ls), bat (cat), btop (top), ripgrep (grep), diff-so-fancy (git pager), lazygit, jq, tree, trash.

**Runtime management:** mise handles Node, Python, etc. via a single global config.

**Dotfile management:** [chezmoi](https://www.chezmoi.io) renders these files into the home directory from its source repo. Per-machine differences (work vs personal, macOS vs Linux) come from Go templates plus a small `~/.config/chezmoi/chezmoi.toml` data file. `.chezmoiignore` keeps repo-only files (like this README) out of `$HOME`.

**Git:** Concise aliases, auto-pruning fetch, rebase-on-pull, diff-so-fancy paging. GitHub user: [jmegs](https://github.com/jmegs).

**Apps (via Homebrew casks):** 1Password, Raycast, Ghostty, Figma, Chrome, OrbStack, CleanShot, Slack, Discord, Spotify, and a few others.

## Set Up

### New machine (one line)

chezmoi installs itself, pulls this repo, and applies everything:

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply jmegs
```

You'll be asked whether this is a work machine (and, if so, your Artifactory username). On macOS the run-onchange scripts then handle the rest: `brew bundle` (apps + CLIs), Fisher (Fish plugins), and `mise install` (tool versions). Prerequisites: Xcode Command Line Tools and Homebrew.

### Day-to-day

```sh
chezmoi edit ~/.zshrc      # edit a config (opens the source file)
chezmoi apply              # write changes into $HOME
chezmoi diff               # preview pending changes
chezmoi cd                 # drop into the source repo to commit & push
chezmoi update             # git pull + apply in one step
```

Edited a file in place instead? `chezmoi re-add <file>` pulls the change back into the source.

### Work-specific setup

- Answer `yes` to the work-machine prompt (or set `work = true` in `~/.config/chezmoi/chezmoi.toml`) to enable the Artifactory env vars and the Squarespace git config.
- Drop the Artifactory token at `~/.ssh/artifactory_token`.
- Log into work's private npm registry via Artifactory.

## Roll Back to rcm

Keep the old `~/.dotfiles` checkout and leave rcm installed until the chezmoi workflow has been proven through a few normal updates. Before applying the migration, preserve the last rcm commit under a memorable local branch:

```sh
git -C ~/.dotfiles branch rcm-rollback 5769d80
```

To roll back, first make sure `chezmoi diff` is empty and commit or otherwise preserve any changes in the chezmoi source directory. Then remove chezmoi's source, configuration, and state; this leaves the rendered dotfiles in place:

```sh
chezmoi purge
git -C ~/.dotfiles switch rcm-rollback
```

Preview the rcm restoration without changing the filesystem:

```sh
RCRC="$HOME/.dotfiles/rcrc" rcup -g
```

Then restore the rcm symlinks interactively. rcm will prompt before replacing any regular file that differs from the copy in `~/.dotfiles`:

```sh
RCRC="$HOME/.dotfiles/rcrc" rcup -i
```

After verifying the shell, Git, Fish, Ghostty, mise, and Neovim configurations, chezmoi can be uninstalled with `brew uninstall chezmoi`. If the migration is kept instead, remove the `rcm-rollback` branch and uninstall rcm only after the rollback window has passed.
