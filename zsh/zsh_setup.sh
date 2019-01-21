#!/usr/bin/env bash

# Adding homebrew shells to /etc/shells
sudo echo "/usr/local/bin/zsh" >> /etc/shells
sudo echo "/usr/local/bin/bash" >> /etc/shells

# setting up zim
git clone --recursive https://github.com/zimfw/zimfw.git ${ZDOTDIR:-${HOME}}/.zim

for template_file in ${ZDOTDIR:-${HOME}}/.zim/templates/*; do
  user_file="${ZDOTDIR:-${HOME}}/.${template_file:t}"
  cat ${template_file} ${user_file}(.N) > ${user_file}.tmp && mv ${user_file}{.tmp,}
done

# Installing ITerm2 Shell Integration
curl -L https://iterm2.com/misc/install_shell_integration.sh | bash

# linking .zshrc
ln -s .zshrc "$HOME"/.zshrc
