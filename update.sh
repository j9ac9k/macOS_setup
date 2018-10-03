#!/usr/bin/env bash

# Update Latex Installation
sudo tlmgr update --self --all --reinstall-forcibly-removed

# Update all brew related files
brew update && brew upgrade && brew cask upgrade && brew cleanup

# Updated all outdated packages installed through the mac app store
mas upgrade

# updating main python
# pyenv activate main
"$WORKON_HOME"/main/bin/conda update --all -y
"$WORKON_HOME"/main/bin/conda clean --all -y

# Update all bookmarked git repos
gitup --cleanup
gitup -b

# update pyenv and plugins
pyenv update

# Special one-off packages
/usr/local/bin/pip install --upgrade pip virtualenv virtualenvwrapper

"$WORKON_HOME"/neovim2/bin/pip install --upgrade neovim

"$WORKON_HOME"/neovim3/bin/pip install --upgrade neovim

"$WORKON_HOME"/tools/bin/pip install --upgrade powerline-status requests twine pylint ipython pip

gem update neovim
npm install -g neovim

# Update Vim Plugins
nvim -c ":PlugUpdate" -c quitall

# Upgrading Stack
# stack upgrade