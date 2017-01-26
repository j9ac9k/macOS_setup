#!/usr/local/bin/bash

# Install powerline fonts
git clone https://github.com/powerline/fonts.git ~/Git/powerline-fonts
~/Git/powerline-fonts/./install.sh
rm -rf ~/Git/powerline-fonts

# Install Awesome Patched Fonts
git clone -b patching-strategy https://github.com/gabrielelana/awesome-terminal-fonts/ ~/Git/awesome-terminal-fonts
cp ~/Git/awesome-terminal-fonts/patched/SourceCodePro+*.ttf /Library/Fonts
rm -rf ~/Git/awesome-terminal-fonts

# Install powerline-status
pip3 install powerline-status
ln -s /usr/local/lib/python3.6/site-packages/powerline ~/.local/powerline


# Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install powerlevel9k theme
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# Installing git-flow-completion
git clone https://github.com/bobthecow/git-flow-completion ~/.oh-my-zsh/custom/plugins/git-flow-completion



