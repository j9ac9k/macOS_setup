export PATH="~/miniconda3/bin:$(brew --prefix coreutils)/libexec/gnubin:/usr/local/sbin:$PATH"
export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"
source activate main

usr/local/etc/profile.d/z.sh
archey
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi 