#!/bin/sh
cp ~/dotfiles/bash/.gitconfig ~/
cat >> $HOME/.bashrc <<EOF
export TERM=xterm-256color

# User specific aliases and functions
# Run twolfson/sexy-bash-prompt
# alias vim='nvim'
. ~/dotfiles/bash/.bash_prompt
. ~/dotfiles/bash/.bash_conf
EOF
