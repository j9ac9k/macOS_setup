# Hide Last Login prompt
clear

# setting user
export DEFAULT_USER=$USER

# If you come from bash you might have to change your $PATH.
export PATH="$PATH:/Users/ogi/.local/bin"

# Setting Terminal
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Theme Settings
# Using awesome patched font
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=('dir' 'vcs' 'pyenv')

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_PYENV_BACKGROUND="black"
POWERLEVEL9K_PYENV_FOREGROUND='yellow'
POWERLEVEL9K_PYENV_VISUAL_IDENTIFIER_COLOR="yellow"

POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_PROMPT_ON_NEWLINE="true"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="❯"

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
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
plugins=(
    brew
    brew-cask
    git
    git-flow-completion
    git-extras
    python
    osx
    history-substring-search
    zsh-syntax-highlighting)

. $ZSH/oh-my-zsh.sh


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

eval "$(hub alias -s)"

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Iterm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# history search
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# added by travis gem
[ -f /Users/ogi/.travis/travis.sh ] && source /Users/ogi/.travis/travis.sh

# Setup virtualenv home
export PROJECT_HOME="$HOME/Developer"

# rbenv
export PATH="$HOME/.rbenv/shims:$PATH"

# pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_HOOK_PATH="/usr/local/var/pyenv/pyenv.d/"

# For reciprocate
export WORKON_HOME="$HOME/.pyenv/versions"

# Initializing pyenv
eval "$(pyenv init -)"

export VIRTUALENVWRAPPER_PYTHON=$PYENV_ROOT/versions/3.7.0/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
pyenv virtualenvwrapper_lazy

# pipenv
export PIPENV_VENV_IN_PROJECT="true"
export PIPENV_IGNORE_VIRTUALENVS=1

# I think I Want to leave this commented out...
# eval "$(pyenv virtualenv-init -)"

# for bash completion scripts
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# pandoc auto-complete
eval "$(pandoc --bash-completion)"

# haskell stack auto-complete
eval "$(stack --bash-completion-script stack)"

# pipenv auto-complete
eval "$(pipenv --completion)"

# pyenv auto-complete
source $(brew --prefix pyenv)/completions/pyenv.zsh

# git extras auto-complete
source $(brew --prefix git-extras)/share/git-extras/git-extras-completion.zsh

# z autocomplete
source $(brew --prefix)/etc/profile.d/z.sh

# ZSH Syntax Highlighting
source $(brew --prefix zsh-syntax-highlighting)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Nice graphics
archey -c -o

# Unseting auto-cd because this is a stupid option
unsetopt AUTO_CD


