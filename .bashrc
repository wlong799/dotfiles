# ~/.bashrc
#
# Configuration file for interactive Bash sessions

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load aliases and functions
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.bash_functions ]] && . ~/.bash_functions

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

PS1='[\u@\h \W]\$ '
