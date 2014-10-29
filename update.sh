#!/bin/zsh
#running mac store updates
echo -e "\tListing updates available through softwareupdate tool"
sudo softwareupdate -l

echo -e "\tInstalling recommended updates through softwareupdate tool"
sudo softwareupdate -ir
echo -e "\tTo install remaining packages run $ sudo softwareupdate -ia"

#running brew update and upgrade
echo -e "\tRunning brew update and brew upgrade"
brew update && brew upgrade 

#updating python modules
echo -e "\tUpgrading python packages installed with conda"
conda update --all

#applying updates with pip
echo -e "\tUpdating the python packages installed with git"
pip install pyinstaller --upgrade
pip install pymunk --upgrade
pip install pip-tools --upgrade

#updating packages aquired through git clone
echo -e "\tRunning Git Fetch on cloned repositories"

echo -e "\tChecking for prezto update..."
cd ${ZDOTDIR:-$HOME}/.zprezto && git pull && git submodule update --init --recursive && cd ~/

echo -e "\tChecking for pandas-cookbook update..."
cd ~/GitHub/pandas-cookbook && git fetch && cd ~/

echo -e "\tChecking for Probabilistic and Bayesian Methods for hackers update...."
cd ~/GitHub/probabilistic-programming-and-bayesian-methods-for-hackers && git fetch && cd ~/

echo -e "\tChecking for updates for 100 Python Projects..."
cd ~/GitHub/100-projects && git fetch && cd ~/

echo -e "\tChecking for updates to Python-Guide..."
cd ~/GitHub/python-guide && git fetch && cd ~/

echo -e "\tChecking for updates to the iPython-Cookbook..."
cd ~/GitHub/ipython-cookbook && git fetch && cd ~/

echo -e "\tChecking for updates for the NumPy Cookbook..."
cd ~/GitHub/numpy-cookbook && git fetch && cd ~/

echo -e "\tChecking for updates for the learn-data-science bookbook..."
cd ~/GitHub/learn-data-science && git fetch && cd ~/

echo -e "\tUpdating my homebrew casks"
cd ~/GitHub/homebrew-cask 
git fetch upstream
#git checkout master
#git merge upstream/master
cd ~/

#cleaning up
echo -e "\tRunning brew cleanup and conda clean"
brew cleanup
conda clean -ilt --yes