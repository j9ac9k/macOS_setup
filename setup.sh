#!/usr/bash
# Code taken from tdhopper's new-mac-setup repo

# Agree to Xcode license
sudo xcodebuild -license

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Setup Brew bundle for running Brewfiles
brew tap Homebrew/bundle

# Getting config file
mkdir ~/Git && cd Git
git clone https://github.com/j9ac9k/osxSetup.git
cd osxSetup
brew bundle

