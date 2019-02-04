#!/usr/local/env zsh

# get present directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


# Installing nano syntax coloring
git clone https://github.com/scopatz/nanorc.git ~/.nano
gitup --add ~/.nano
cat ~/.nano/nanorc >> ~/.nanorc

# Linking git dotfiles
ln -s "$DIR/.gitconfig" "$HOME/.gitconfig"
ln -s "$DIR/.gitignore_global" "$HOME/.gitignore_global"

# Ensuring qt5 is used for gnuplot in octave
echo "setenv('GNUTERM','qt')" >> ~/.octaverc

# Changing Default Shell
chsh -s /usr/local/bin/zsh


