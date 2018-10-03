#!/usr/local/bin/zsh

# Installing nano syntax coloring
git clone https://github.com/scopatz/nanorc.git ~/.nano
gitup --add ~/.nano
cat ~/.nano/nanorc >> ~/.nanorc

# Setting up Vim

mkdir ~/.config/nvim
ln -s init.vim ~/.config/nvim/init.vim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Enable dark mode
dark-mode --mode Dark

# Linking dotfiles
# ln -s ~/Git/macOS_setup/.bash_profile ~/.bash_profile
ln -s .zshrc ~/.zshrc
ln -s .gitconfig ~/.gitconfig
ln -s .gitignore_global ~/.gitignore_global

# Link subl to sublime-text
# mkdir -p ~/bin && ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl

# Ensuring z.sh is an executable
chmod +x /usr/local/etc/profile.d/z.sh

# Ensuring qt5 is used for gnuplot in octave
# echo "setenv('GNUTERM','qt')" >> ~/.octaverc

#adding shells
sudo -- sh -c -e "echo '/usr/local/bin/bash' >> /etc/shells"
sudo -- sh -c -e "echo '/usr/local/bin/zsh' >> /etc/shells"

# Installing ITerm2 Shell Integration
curl -L https://iterm2.com/misc/install_shell_integration.sh | bash

# Linking gitup bookmarks
mkdir ~/.config/gitup
ln -s ./gitup_bookmarks ~/.config/gitup/bookmarks

# Changing Default Shell
chsh -s /usr/local/bin/zsh
