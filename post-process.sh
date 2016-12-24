echo 'export PATH=~/miniconda3/bin:$(brew --prefix coreutils)/libexec/gnubin:"$PATH"' >> ~/.bash_profile
source ~/.bash_profile

# Configure R and JAVA
R CMD javareconf JAVA_CPPFLAGS=-I/System/Library/Frameworks/JavaVM.framework/Headers

mkdir -p ~/bin && ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl
