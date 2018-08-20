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
# Installing JAVA 8
brew cask install --appdir="~/Applications" java8
# Adding JAVA_HOME to .extra file
LINE='export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

LINE='export PATH="$JAVA_HOME/bin:$PATH"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra


# Installing ANDROID STUDIO
brew cask install --appdir="~/Applications" android-studio

# Setting ANDROID_HOME on the .extra file. Maybe will
# need some update if SDK was installed without using Android Studio
LINE='export ANDROID_HOME=~/Library/Android/sdk'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

LINE='PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra


# Not working, better let Android Studio install it
# brew install android-sdk

# Remove outdated versions from the cellar.
brew cleanup
