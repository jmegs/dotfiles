#!/usr/bin/env bash

# This script sets a few macOS settings to less annoying defaults
# All credit goes to Mathias Bynens at https://mths.be/macos
set -e

# Close any open System Preferences panes so they can't override settings
osascript -e 'tell application "System Preferences" to quit'

# Ask for sudo upfront
sudo -v

# Keep-alive: update existing `sudo` timestamp until `macos.sh` has finished
# kill -0 PID exits with an exit code of 0 if the PID is of a running process,
# otherwise exits with an exit code of 1. So, basically, kill -0 "$$" || exit
# aborts the while loop child process as soon as the parent process is no
# longer running.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#===============================================================================
# Settings Begin Here
#===============================================================================

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable Resume system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Show the ~/Library folder
chflags nohidden ~/Library

# Save screenshots to ~/Pictures/Screenshots

if [ ! -d ~/Pictures/Screenshots ]; then
  mkdir ~/Pictures/Screenshots
fi

defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"

# Disable font smoothing
defaults -currentHost write -g AppleFontSmoothing -int 0

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Restart Dock and Finder
echo "\nDefaults set. Restarting Dock and Finder\n"
killall Finder && Killall Dock