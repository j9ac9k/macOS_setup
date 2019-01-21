# Hide Last Login prompt
clear

# Setting Terminal
export TERM="xterm-256color"

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# ssh
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"

# setting user
export DEFAULT_USER=$USER

# If you come from bash you might have to change your $PATH.
export PATH="$PATH:$HOME/.local/bin"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# pipenv
export PIPENV_VENV_IN_PROJECT="true"
export PIPENV_IGNORE_VIRTUALENVS=1

# Setup virtualenv home
export PROJECT_HOME="$HOME/Developer"

# rbenv
export PATH="$HOME/.rbenv/shims:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_HOOK_PATH="/usr/local/var/pyenv/pyenv.d/"

# For reciprocate
export WORKON_HOME="$PYENV_ROOT/versions"

# export PYENV_VIRTUALENV_VERBOSE_ACTIVATE="true"
export VIRTUALENVWRAPPER_PYTHON="$PYENV_ROOT/versions/miniconda3-latest/bin/python"
export VIRTUALENVWRAPPER_VIRTUALENV="/usr/local/bin/virtualenv"

eval "$(pyenv init - --no-rehash)"
eval "$(pyenv virtualenv-init -)"
pyenv virtualenvwrapper_lazy

export ZPLUG_HOME=/usr/local/opt/zplug
source "$ZPLUG_HOME/init.zsh"

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Theme
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme, from:github, as:theme, defer:2
# zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

# Powerlevel Theme Settings
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=('dir' 'vcs' 'pyenv')

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
# POWERLEVEL9K_PYENV_BACKGROUND="black"
# POWERLEVEL9K_PYENV_FOREGROUND='yellow'
# POWERLEVEL9K_PYENV_VISUAL_IDENTIFIER_COLOR="yellow"

# Spaceship Prompt Theme
SPACESHIP_PYENV_SHOW="true"
SPACESHIP_CONDA_SHOW="false"
SPACESHIP_VENV_SHOW="true"

zplug "${HOME}/.iterm2_shell_integration.zsh", from:local, as:command

[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"

# pandoc auto-complete
zplug "anntzer/zsh-pandoc-completion", at:autocomplete-filenames, as:plugin

# pipenv auto-complete
zplug "owenstranathan/pipenv.zsh", as:plugin

# pyenv auto-complete
zplug "/usr/local/opt/pyenv/completions", use:pyenv.zsh, from:local, as:command

# git extras auto-complete
zplug "/usr/local/opt/git-extras/share/git-extras", use:git-extras-completion.zsh, from:local, as:command

# zimfw
zplug "zimfw/history", as:plugin, defer:2
zplug "zimfw/completion", as:plugin, defer:1

# # zsh-users
zplug "zsh-users/zsh-completions", defer:1
zplug "zsh-users/zsh-autosuggestions", as:plugin
zplug "zsh-users/zsh-history-substring-search", as:plugin

zplug "zsh-users/zsh-syntax-highlighting", defer:2, as:plugin

# Source after compinit to enable completion
zplug "knu/z", use:z.sh, defer:2

bindkey -e

# history search
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# word-skip ⌥+← or ⌥+→  
bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word

# Nice graphics
archey -c -o

# sharing history
setopt share_history

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    printf "Install plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load