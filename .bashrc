# ~/.bashrc
#
# Configuration file for interactive Bash sessions

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias feh='feh -.'
PS1='[\u@\h \W]\$ '
