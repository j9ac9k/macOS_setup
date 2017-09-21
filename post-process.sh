#!/usr/local/bin/zsh

# Installing nano syntax coloring
git clone https://github.com/scopatz/nanorc.git ~/.nano
cat ~/.nano/nanorc >> ~/.nanorc

# Setting up Vim
# Install Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install Vim-Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Material Theme
git clone https://github.com/jdkanani/vim-material-theme ~/.vim/bundle/vim-material-theme

# Linking .vimrc
# ln -s ~/Git/macOS_setup/.vimrc ~/.vimrc

# Install and update vim plugins
vim -c ":PlugUpdate"

# Neovim Setup (when feature complete will transition from vim setup)
pip2 install --user neovim 
pip3 install --user neovim 
gem install neovim

mkdir ~/.config/nvim
ln -s ~/Git/macOS_setup/init.vim ~/.config/nvim/init.vim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Enable dark mode
dark-mode --mode Dark

# Configure R and JAVA
R CMD javareconf JAVA_CPPFLAGS=-I/System/Library/Frameworks/JavaVM.framework/Headers

# Linking dotfiles
ln -s ~/Git/macOS_setup/.bash_profile ~/.bash_profile
ln -s ~/Git/macOS_setup/.zshrc ~/.zshrc
ln -s ~/Git/macOS_setup/.gitconfig ~/.gitconfig
ln -s ~/Git/macOS_setup/.gitignore_global ~/.gitignore_global
# ln -s $(brew --prefix pyenv)/completions ~/.pyenv/compleitions

# Link subl to sublime-text
mkdir -p ~/bin && ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl

# Ensuring z.sh is an executable
chmod +x /usr/local/etc/profile.d/z.sh

# Ensuring qt5 is used for gnuplot in octave
# echo "setenv('GNUTERM','qt')" >> ~/.octaverc

#adding shells
sudo -- sh -c -e "echo '/usr/local/bin/bash' >> /etc/shells"
sudo -- sh -c -e "echo '/usr/local/bin/zsh' >> /etc/shells"

# Need to generate ssh key
ssh-keygen -t rsa -b 4096
ssh-add ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub
open https://github.com/settings/keys
read -rsp $'Store SSH key to github (currently in clipboard), then press any key to continue...\n' -n1 key

# Installing ITerm2 Shell Integration
curl -L https://iterm2.com/misc/install_shell_integration.sh | bash

# Linking gitup bookmarks
mkdir ~/.config/gitup
ln -s ~/Git/macOS_setup/gitup_bookmarks ~/.config/gitup/bookmarks


# Installing Zim Desktop Wiki
# With assistance to this gist https://gist.github.com/akurani/fc8b90c55c972a971e93
#/usr/local/bin/pip install pyxgd
#wget http://zim-wiki.org/downloads/zim-0.65.tar.gz
#tar -xvf zim-0.65.tar.gz

# Changing Default Shell
chsh -s /usr/local/bin/zsh
