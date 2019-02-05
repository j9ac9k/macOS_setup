#!/usr/bin/env bash

# get present directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


# Adding homebrew shells to /etc/shells
sudo -v

echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
echo "/usr/local/bin/bash" | sudo tee -a /etc/shells

# setting up zim
git clone --recursive https://github.com/zimfw/zimfw.git ${ZDOTDIR:-${HOME}}/.zim

for template_file in ${ZDOTDIR:-${HOME}}/.zim/templates/*; do
  user_file="${ZDOTDIR:-${HOME}}/.${template_file:t}"
  cat ${template_file} ${user_file}(.N) > ${user_file}.tmp && mv ${user_file}{.tmp,}
done

# Installing ITerm2 Shell Integration
curl -L https://iterm2.com/misc/install_shell_integration.sh | bash

# linking .zshrc
ln -s "$DIR/.zshrc" "$HOME"/.zshrc
