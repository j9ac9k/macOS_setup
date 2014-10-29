#!/bin/zsh

#install prezto - https://github.com/sorin-ionescu/prezto
#cloning repository
echo "\tCloning prezto repository"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

#creating new config by copying provided files
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do 
	ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo -e "\tModifying ~/.zshrc and ~/.zprofile"
echo unalias run-help >> ~/.zshrc
echo autoload run-help >> ~/.zshrc
echo HELPDIR=/usr/local/share/zsh/help >> ~/.zshrc
echo eval `/usr/libexec/path_helper -s` >> ~/.zprofile

#allows for git auto-complete
echo -e "\tAllowing for git to autocomplete in zsh"
echo autoload -U compinit && compinit >> ~/.zshrc

#change default shell
#echo "\Changing shell to zsh"
#chsh -s /bin/zsh

