#!/bin/bash

# Chage shell script files to run 
chmod +x *.sh

# Change MacOS Settings
./settings.sh

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Setup Brew bundle for running Brewfiles
brew tap Homebrew/bundle && brew bundle

# Since XCode got installed, need to agree to license
sudo xcodebuild -license

# Create Python Environment
conda-env create environment.yml

# Configure ZSH
./zsh_setup.sh

# Run post-processing script
./post-process.sh
