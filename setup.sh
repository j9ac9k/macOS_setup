#!/bin/bash

chmod +x settings.sh
./settings.sh

# Agree to Xcode license
sudo xcodebuild -license

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Setup Brew bundle for running Brewfiles
brew tap Homebrew/bundle && brew bundle

# create python environment
conda-env create environment.yml

# configure zsh
# chmod +x .zsh_setup.sh
#./zsh_setup.sh

# run post-processing script
chmod +x post-process.sh
./post-process.sh
