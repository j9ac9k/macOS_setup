#!/usr/bin/env zsh

# Hide Last Login prompt
clear

# Setting Terminal
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# zplug "$ZSH/oh-my-zsh.sh", from:local, as:command
source "$ZSH/oh-my-zsh.sh"

export ZPLUG_HOME=/usr/local/opt/zplug
source "$ZPLUG_HOME/init.zsh"

# zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# setting user
# export DEFAULT_USER=$USER

# If you come from bash you might have to change your $PATH.
export PATH="$PATH:$HOME/.local/bin"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# Theme
# zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme


# Powerlevel Theme Settings
# POWERLEVEL9K_MODE='nerdfont-complete'
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=('dir' 'vcs' 'pyenv')

# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
# POWERLEVEL9K_PYENV_BACKGROUND="black"
# POWERLEVEL9K_PYENV_FOREGROUND='yellow'
# POWERLEVEL9K_PYENV_VISUAL_IDENTIFIER_COLOR="yellow"

# Spaceship Prompt Theme
SPACESHIP_PYENV_SHOW="true"
SPACESHIP_CONDA_SHOW="false"
SPACESHIP_VENV_SHOW="true"


# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=3

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/git-extras", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
# zplug "plugins/zsh-syntax-highlighting", from:oh-my-zsh, defer:2
zplug "plugins/history-substring-search", from:oh-my-zsh, defer:3

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# eval "$(hub alias -s)"

# Iterm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# added by travis gem
[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"

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

# pipenv
export PIPENV_VENV_IN_PROJECT="true"
export PIPENV_IGNORE_VIRTUALENVS=1

# pandoc auto-complete
zplug "anntzer/zsh-pandoc-completion", at:autocomplete-filenames

# pipenv auto-complete
# eval "$(pipenv --completion)"
zplug "owenstranathan/pipenv.zsh"

# pyenv auto-complete
zplug "/usr/local/opt/pyenv/completions/pyenv.zsh", from:local

# git extras auto-complete
zplug "/usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh", from:local

# z autocomplete
zplug "plugins/z", from:oh-my-zsh

# # zsh-users
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# history search
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# word-skip
bindkey "[D" backward-word
bindkey "[C" forward-word

# Nice graphics
archey -c -o

# Unseting auto-cd because this is a stupid option
unsetopt AUTO_CD

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

# enable zsh completion in [n]vim via deoplete.nvim and deoplete-zsh
zmodload zsh/zpty