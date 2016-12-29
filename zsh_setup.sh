# Install powerline fonts
git clone https://github.com/powerline/fonts.git ~/Git/powerline-fonts
~/Git/powerline-fonts/./install.sh
rm -rf ~/Git/powerline-fonts

pip install --user powerline-status

# Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install powerlevel9k theme
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# Installing git-flow-completion
git clone https://github.com/bobthecow/git-flow-completion ~/.oh-my-zsh/custom/plugins/git-flow-completion
# still need to enable plugin inside ~/.zshrc
# plugins=(<some-plugin> <another plugin> git-flow-completion)


# Enable Theme
# add to ~/.zshrc
# ZSH_THEME="powerlevel9k/powerlevel9k"

