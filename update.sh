#/bin/bash

# Update all brew related files
brew update && brew upgrade && brew cleanup && brew cask cleanup

# Updated all outdated packages installed through the mac app store
mas upgrade

# Update conda python environment
source deactivate
conda update --all -y
conda clean -ay

# Update all bookmarked git repos
gitup --cleanup
gitup -b

# Special one-off packages
pip3 install --upgrade powerline-status
pip2 install --upgrade neovim
pip3 install --upgrade neovim
gem update neovim

# Update Latex Installation
tlmgr update --self --all --reinstall-forcibly-removed

# Update Vim Plugins
nvim -c ":PlugUpdate" -c quitall


