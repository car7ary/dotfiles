# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ls alias
alias ls='ls --color'
alias ll='ls -l'
alias la='ls -al'

# vi alias
if type "nvim" > /dev/null 2>&1; then
    alias vi="nvim"
    alias vim="nvim"
    alias vicon="vim ${HOME}/.dotfiles/config/nvim/init.vim"
elif type "vim" > /dev/null 2>&1; then
    alias vi="vim"
fi

# Prompt
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
CYAN="\[\033[0;36m\]"
RESET="\[\033[0m\]"

if [ -n "$SSH_CLIENT" ]; then
    isssh="${RED}[ssh]${RESET}"
else
    isssh="${GREEN}[local]${RESET}"
fi

export PS1="${isssh} \u@\H: ${CYAN}\w${RESET}\n\$ "

# Include
. ~/.bash/peco-src.bash
