# ~/.bash_profile
#
# Used by the bash login shell

# Source the user bashrc and profile
[[ -r ~/.profile ]] && . ~/.profile
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start X server upon login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
