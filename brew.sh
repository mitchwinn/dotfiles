#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install some useful tools
brew install dark-mode
brew install node
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
brew install ngrep
brew install httpie
brew install mongodb
brew install speedtest_cli

# Install Cask
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Core casks
brew cask install --appdir="~/Applications" alfred
brew cask install --appdir="~/Applications" iterm2
brew cask install --appdir="~/Applications" visual-studio-code

# Misc casks
brew cask install --appdir="~/Applications" google-chrome
brew cask install --appdir="~/Applications" 1password
brew cask install --appdir="~/Applications" appcleaner
brew cask install --appdir="~/Applications" things
brew cask install --appdir="~/Applications" dash
brew cask install --appdir="~/Applications" etcher
brew cask install --appdir="~/Applications" insomnia
brew cask install --appdir="~/Applications" macvim
brew cask install --appdir="~/Applications" privatetunnel
brew cask install --appdir="~/Applications" quitter
brew cask install --appdir="~/Applications" sketch
brew cask install --appdir="~/Applications" slack

# Remove outdated versions from the cellar.
brew cleanup