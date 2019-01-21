#!/usr/local/bin/zsh

# Installing nano syntax coloring
git clone https://github.com/scopatz/nanorc.git ~/.nano
gitup --add ~/.nano
cat ~/.nano/nanorc >> ~/.nanorc

# Linking git dotfiles
ln -s .gitconfig ~/.gitconfig
ln -s .gitignore_global ~/.gitignore_global

# Ensuring qt5 is used for gnuplot in octave
echo "setenv('GNUTERM','qt')" >> ~/.octaverc

# Changing Default Shell
chsh -s /usr/local/bin/zsh


