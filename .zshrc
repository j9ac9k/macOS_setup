# Hide Last Login prompt
clear

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Setting Terminal
export TERM="xterm-256color"

# Path to powerline-status installation
export POWERLINE_REPOSITORY_ROOT=$(/usr/local/bin/python3 -c 'import powerline, os; print(os.path.dirname(powerline.__file__))')

# Path to your oh-my-zsh installation.
export ZSH=/Users/$USER/.oh-my-zsh

# If you come from bash you might have to change your $PATH.
export PATH=~/miniconda3/bin:$(brew --prefix coreutils)/libexec/gnubin:$HOME/bin:/usr/local/sbin:"$PATH"

# User configurationnvm
export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:/usr/local/man:$MANPATH"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Theme Settings
# Using awesome patched font
POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs anaconda)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs anaconda)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status anaconda time)
# POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uE868  %d/%m/%y}"
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_ANACONDA_LEFT_DELIMITER=''
POWERLEVEL9K_ANACONDA_RIGHT_DELIMITER=''
POWERLEVEL9K_ANACONDA_BACKGROUND=244
POWERLEVEL9K_ANACONDA_FOREGROUND="black"
POWERLEVEL9K_PYTHON_ICON=''

POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_PROMPT_ON_NEWLINE="true"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="❯"

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
plugins=(git git-flow-completion python osx)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="/Users/$USER/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Disabling Update
DISABLE_UPDATE_PROMPT="false"

export DEFAULT_USER="$USER"

# Ensuring z is used
/usr/local/etc/profile.d/z.sh

# Iterm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# ZSH Syntax Highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Powerline Daemon
powerline-daemon -q
source "$POWERLINE_REPOSITORY_ROOT/bindings/zsh/powerline.zsh"

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Nice graphics
archey

# pyenv
# eval "$(pyenv init -)"
