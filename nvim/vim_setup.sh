# create config directory
mkdir -p "$HOME/.config/nvim"

# install zim plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# symbolic link to repo file
ln -s init.vim "$HOME/.config/nvim/init.vim"

# installing node extension
npm install -g neovim

# installing ruby extensions
rbenv install 2.6.0
rbenv global 2.6.0
rbenv rehash
gem install neovim

# installying python extensions
pyenv virtualenv 2.7.15 neovim2
pyenv virtualenv 3.6.6 neovim3

pyenv activate neovim2
pip install neovim

pyenv activate neovim3
pip install neovim numpydoc jedi

echo 'if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi' >> ~/.zshenv
