# modifying .bash_profile
echo 'export PATH=~/miniconda3/bin:$(brew --prefix coreutils)/libexec/gnubin:"$PATH"' >> ~/.bash_profile
echo 'source activate main' >> ~/.bash_profile
echo 'export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"' >> ~/.bash_profile
source ~/.bash_profile

# Configure R and JAVA
R CMD javareconf JAVA_CPPFLAGS=-I/System/Library/Frameworks/JavaVM.framework/Headers

#Link subl to sublime-text
mkdir -p ~/bin && ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl

#Installing nano syntax coloring
git clone git@github.com:scopatz/nanorc.git ~/.nano
cat ~/.nano/nanorc >> ~/.nanorc
