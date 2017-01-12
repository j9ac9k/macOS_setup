#! /usr/local/bin/zsh

# Configuring tmux to use zsh and powerline
pip install powerline-status
ln -s /Users/ogi/.local/lib/python3.5/site-packages/powerline ~/bin


cat <<EOT >> ~/.tmux
set-option -g default-shell /usr/local/bin/zsh
set -g default-terminal "xterm-256color"
run-shell "powerline-daemon -q"
source "/Users/ogi/bin/powerline/bindings/tmux/powerline.conf"
set -g terminal-overrides 'xterm*:smcup@:rmcup@'
EOT