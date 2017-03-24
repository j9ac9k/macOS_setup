
# Update all brew related files
brew update && brew upgrade && brew cleanup && brew cask cleanup

# Updated all outdated packages installed through the mac app store
mas upgrade

# Update conda python environment
conda update --all 
conda clean -tipsy

# Update all bookmarked git repos
gitup -b

# Special one-off packages
pip3 install --upgrade powerline-status

# Update Latex Installation
tlmgr update --self --all --reinstall-forcibly-removed

# Update Vim Plugins
vim -c ":PlugUpdate"
nvim -c ":PlugUpdate"


