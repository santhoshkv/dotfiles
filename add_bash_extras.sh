#!/bin/sh

cat >> $HOME/.bashrc <<EOF
export TERM=xterm-256color

# User specific aliases and functions
# Run twolfson/sexy-bash-prompt
. ~/dotfiles/.bash_prompt
. ~/dotfiles/.bash_conf

EOF
