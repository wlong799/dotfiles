# Enable color support for common commands
if [[ -x /usr/bin/dircolors ]]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='colordiff'  # requires installation of colordiff package
fi

## Modified commands for better usability
alias more='less'           # less is a better version of more
alias df='df -h'            # human-readable sizes
alias du='du -c -h'         # human-readable sizes + print grand total
alias mkdir='mkdir -p -v'   # make parent directories as necessary
alias ping='ping -c 5'      # stop sending after 5 requests
alias dmesg='dmesg -HL'     # human-readable + colored output for dmesg

## New commands
alias da='date "+%A, %B %d, %Y [%T]"'   # formatted date
alias du1='du --max-depth=1'            # only print sizes at current level
alias openports='ss --all --numeric --processes --ipv4 --ipv6' # list open ports
alias pgg='ps -Af | grep'               # find running process that matches argument
alias ..='cd ..'                        # go back directory
alias cls=' echo -ne "\033c"'           # clear screen and don't save to history
alias runelite="java -jar /usr/local/bin/runelite.jar --mode=OFF"

# Privileged access shortcuts
if (( UID != 0 )); then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudo vim'
    alias root='sudo -i'
    alias reboot='sudo systemctl reboot'
    alias poweroff='sudo systemctl poweroff'
fi

# ls
alias ls='ls -hF --color=auto'      # human-readable color output with indicators
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'                    # long-listing form of ls
alias la='ll -A'             # list all files, including hidden
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size (small to large)
alias lt='ll -t'                    # sort by date (new to old)

# Safety features
alias cp='cp -i'                        # prompt before overwrites
alias mv='mv -i'                    
alias ln='ln -i'
alias chown='chown --preserve-root'     # prevent modification of /
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias rm='timeout 3 rm -Iv --one-file-system'  # prompt for multiple or recursive deletes

# Vim style exit
alias :q='exit'
alias :Q='exit'
