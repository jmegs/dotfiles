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

You'll be asked whether this is a work machine (and, if so, your Artifactory username). On macOS the run-once scripts then handle the rest: `brew bundle` (apps + CLIs), Fisher (Fish plugins), and `mise install` (tool versions). Prerequisites: Xcode Command Line Tools and Homebrew.

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
