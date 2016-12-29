#!/usr/bash/env bash
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
#./zsh_setup.sh

# run post-processing script
./post-process.sh
