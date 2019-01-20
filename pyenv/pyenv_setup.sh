#!/usr/bin/env bash

# needed for mojave
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /

pip3 install --upgrade pip
pip3 install virtualenv virtualenvwrapper

# adding pyenv update plugins
git clone git://github.com/pyenv/pyenv-update.git $(pyenv root)/plugins/pyenv-update
gitup --add $(pyenv root)/plugins/pyenv-update

# getting conda hooks in
# https://github.com/pyenv/pyenv-virtualenv/issues/178#issuecomment-387862525
mkdir -p /usr/local/var/pyenv/pyenv.d/virtualenv
cp ./venv_hook.bash /usr/local/var/pyenv/pyenv.d/virtualenv/

# base python environments
pyenv install miniconda3-latest
pyenv install 2.7.15
pyenv install 3.7.2
pyenv install 3.6.6

# creating virtual environments
pyenv virtualenv miniconda3-latest tools
pyenv virtualenv miniconda3-latest main

# pre-populating virtual environments
export WORKON_HOME="$HOME/.pyenv/versions"

"$WORKON_HOME"/main/bin/conda install scipy pandas statsmodels matplotlib seaborn ipython scikit-learn
