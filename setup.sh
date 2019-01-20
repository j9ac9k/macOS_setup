#!/bin/bash

# Chage shell script files to run 
chmod +x *.sh

# Change MacOS Settings
./settings.sh

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Since XCode got installed, need to agree to license
sudo xcodebuild -license

# Install Brew Bundle
brew bundle install

# setup pyenv
./pyenv/pyenv_setup.sh

# Configure ZSH
./zsh/zsh_setup.sh

# Setup nvim
./nvim/vim_setup.sh

# Run post-processing script
./post-process.sh
