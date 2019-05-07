# Executed by bash for non-login shells
# See /usr/share/doc/bash/examples/startup-files for examples

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History settings
HISTCONTROL=ignoreboth  # no duplicate lines or lines starting with space in history
HISTSIZE=1000           # number of commands to remember
HISTFILESIZE=2000       # size of history file (used for initializing history)
shopt -s histappend     # append to history file instead of overwriting

# Check window size after each command and update LINES and COLUMNS
shopt -s checkwinsize

# "**" matches all files and zero or more directories and subdirectories
shopt -s globstar

# Set variable identifying the chroot you work in (used in prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Set fancy prompt, with color if appropriate
case "$TERM" in
    xterm-color|*-256color|rxvt*) color_prompt=yes;;
esac
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# Enable programmable completion features
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Search through history instead of prev/next commands
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Turn off annoying beeping noise
if [ -n "$DISPLAY" ]; then
    xset b off
fi

# Load aliases and functions
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.bash_functions ]] && . ~/.bash_functions
