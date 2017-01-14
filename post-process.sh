#!/usr/local/bin/zsh

#adding shells t
sudo -- sh -c -e "echo '/usr/local/bin/bash' >> /etc/shells"
sudo -- sh -c -e "echo '/usr/local/bin/zsh' >> /etc/shells"

# Enable dark mode
dark-mode --mode Dark

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

# Ensuring z.sh is an executable
chmod +x /usr/local/etc/profile.d/z.sh


# Ensuring qt5 is used for gnuplot in octave
echo "setenv('GNUTERM','qt')" >> ~/.octaverc

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

# Changing Default Shell
chsh -s /usr/local/bin/zsh