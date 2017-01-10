# modifying .bash_profile
echo 'export PATH=~/miniconda3/bin:$(brew --prefix coreutils)/libexec/gnubin:"$PATH"' >> ~/.bash_profile
echo 'source activate main' >> ~/.bash_profile
echo 'export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"' >> ~/.bash_profile
source ~/.bash_profile

# Enable dark mode
dark-mode --mode Dark

echo "Configuring Git"
git config --global github.user j9ac9k
git config --global color.ui true
git config --global core.editor "subl -w"
git config --global push.default simple

# Configure R and JAVA
R CMD javareconf JAVA_CPPFLAGS=-I/System/Library/Frameworks/JavaVM.framework/Headers

# Link subl to sublime-text
mkdir -p ~/bin && ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl

# Installing nano syntax coloring
git clone git@github.com:scopatz/nanorc.git ~/.nano
cat ~/.nano/nanorc >> ~/.nanorc

# Ensuring diff-so-fancy is used exclusively
diff config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

# Ensuring z is used
echo "/usr/local/etc/profile.d/z.sh" >> ~/.zshrc
echo "/usr/local/etc/profile.d/z.sh" >> ~/.bashrc

# Ensuring qt5 is used for gnuplot in octave
echo "setenv('GNUTERM','qt')" >> ~/.octaverc

# Install archey
echo "archey" >> ~/.zshrc
echo "archey" >> ~/.bashrc

# Installing Zim Desktop Wiki
# With assistance to this gist https://gist.github.com/akurani/fc8b90c55c972a971e93
#/usr/local/bin/pip install pyxgd
#wget http://zim-wiki.org/downloads/zim-0.65.tar.gz
#tar -xvf zim-0.65.tar.gz
