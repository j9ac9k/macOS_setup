
# Update all brew related files
brew update && brew upgrade && brew cleanup && brew cask cleanup

# Updated all outdated packages installed through the mac app store
mas upgrade

# Update conda python environment
conda update --all

git -C ~/.oh-my-zsh/custom/themes/powerlevel9k pull
git -C ~/.oh-my-zsh/custom/plugins/git-flow-completion pull
git -C ~/.nano pull
cat ~/.nano/nanorc >> ~/.nanorc