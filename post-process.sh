#!/usr/local/bin/zsh

# modifying .bash_profile
echo 'export PATH="~/miniconda3/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"' >> ~/.bash_profile
echo 'export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"' >> ~/.bash_profile
echo 'source activate main' >> ~/.bash_profile

# Enable dark mode
dark-mode --mode Dark

# Configuring Git
git config --global github.user j9ac9k

# GitHub's private email address
git config --global user.email "j9ac9k@users.noreply.github.com"

# Configure R and JAVA
R CMD javareconf JAVA_CPPFLAGS=-I/System/Library/Frameworks/JavaVM.framework/Headers

# Link subl to sublime-text
mkdir -p ~/bin && ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl

# Need to generate ssh key
ssh-keygen -t rsa -b 4096
ssh-add ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub
open https://github.com/settings/keys
read -rsp $'Store SSH key to github (currently in clipboard), then press any key to continue...\n' -n1 key

# Installing nano syntax coloring
mkdir ~/.nano
git clone https://github.com/scopatz/nanorc.git ~/.nano
cat ~/.nano/nanorc >> ~/.nanorc

# Configuring git further
git config --global color.ui true
git config --global core.editor "subl -w"
git config --global push.default simple

# Ensuring diff-so-fancy is used exclusively
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global color.diff-highlight.oldNormal "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

# Ensuring z is used
echo "/usr/local/etc/profile.d/z.sh" >> ~/.zshrc
echo "/usr/local/etc/profile.d/z.sh" >> ~/.bash_profile

# Ensuring qt5 is used for gnuplot in octave
echo "setenv('GNUTERM','qt')" >> ~/.octaverc

# Install archey
echo "archey" >> ~/.zshrc
echo "archey" >> ~/.bash_profile

# Installing Zim Desktop Wiki
# With assistance to this gist https://gist.github.com/akurani/fc8b90c55c972a971e93
#/usr/local/bin/pip install pyxgd
#wget http://zim-wiki.org/downloads/zim-0.65.tar.gz
#tar -xvf zim-0.65.tar.gz

# Create .bashrc
cat <<EOT >> .bash_profile
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
EOT