#!/usr/bin/env zsh
echo "--- Upgrading zim ---"
zmanage update
echo "\n"

echo "--- Upgradeing ZPlug ---"
export ZPLUG_HOME=/usr/local/opt/zplug
source "$ZPLUG_HOME/init.zsh"
zplug clear || zplug check || zplug install || zplug update
echo "\n"

echo "--- Upgrading Latex ---"
# Update Latex Installation
sudo tlmgr update --self --all --reinstall-forcibly-removed
echo "\n"

echo "--- Upgrading homebrew ---"
# Update all brew related files
brew update && brew upgrade && brew cask upgrade && brew cleanup
echo "\n"

echo "-- Upgrading from the AppStore ---"
# Updated all outdated packages installed through the mac app store
mas upgrade
echo "\n"

echo "-- Upgrading Main Python Environment ---"
# updating main python
"$WORKON_HOME"/main/bin/conda update --all -y
"$WORKON_HOME"/main/bin/conda clean --all -y -q
echo "\n"

echo "--- Gitup Updates ---"
# Update all bookmarked git repos
gitup --cleanup
gitup -b "$HOME/git/macOS_setup/gitup_bookmarks"
echo "\n"

echo "--- Pyenv Update ---"
# update pyenv and plugins
pyenv update
echo "\n"

echo "--- Updating Python Virtual Environments ---"
# Special one-off packages
/usr/local/bin/pip install --upgrade -q pip virtualenv virtualenvwrapper

"$WORKON_HOME"/neovim2/bin/pip install -q --upgrade pip neovim
"$WORKON_HOME"/neovim3/bin/pip install -q --upgrade pip neovim numpydoc
echo "\n"

# Update Vim Plugins
echo "--- Updating Neovim ---"
nvim -c ":PlugUpgrade" -c ":PlugUpdate" -c quitall
gem update neovim
npm install -g neovim

# Upgrading Stack
# stack upgrade