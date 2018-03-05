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

# Install Cask
# brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Already installed in brew.sh
brew cask install --appdir="~/Applications" intellij-idea
brew cask install --appdir="~/Applications" datagrip
brew cask install --appdir="~/Applications" postgres
brew cask install --appdir="~/Applications" tunnelbear
brew cask install --appdir="~/Applications" cleanmymac
brew cask install --appdir="~/Applications" charles
brew cask install --appdir="~/Applications" paw
brew cask install --appdir="~/Applications" zeplin


brew cask install --appdir="~/Applications" calibre
