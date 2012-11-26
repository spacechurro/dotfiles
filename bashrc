#!/bin/bash

source ~/.dotfiles/bashrc_colors

export TERM=xterm-color
export GREP_OPTIONS='--color=always'
export CLICOLOR=1

#aliases for listing directories
alias ll='ls -lh'
alias la='ls -lah'
alias less='less -R' # parse control chars as colors
alias ..="cd .."

# prompt
hostname=`hostname`

if [[ $hostname =~ srabiela ]] 
then
  prompt_color=$COLOR_CYAN
fi

if [[ $hostname =~ starscream ]] 
then
  prompt_color=$COLOR_BLUE
fi

if [[ $hostname =~ \.nut ]] 
then
  prompt_color=$COLOR_RED
fi

if [[ $hostname =~ \.obr  ]] 
then
  prompt_color=$COLOR_RED
fi

if [[ $hostname =~ \.qa ]] 
then
  prompt_color=$COLOR_YELLOW
fi

# is we at work?
if [[ $prompt_color ]] 
then
  export PGCLUSTER=8.4/main
  export PGVERSION=8.4
  export PATH="~/bin:/sbin/:/cnu/PACKAGES/ruby/bin/:$PATH"
else
  prompt_color=$COLOR_GREEN
fi

export SUDO_PS1="\[${COLOR_RED}\]\w\[${COLOR_NC}\]# "
export PS1="\[$prompt_color\]\w\[${COLOR_NC}\]\$ "

export EDITOR="vim"
export PSQL_EDITOR='vim -c"set syntax=sql"'

export HISTCONTROL=ignoredups

shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns

bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# enable programmable completion features
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# load RVM into a shell session.
if [[ -s "$HOME/.rvm/scripts/rvm" ]]
then
  source "$HOME/.rvm/scripts/rvm"
  PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi

function lesscsv() { column -s , -n -t "$@" | less -#2 -N -S; }

if [[ -s "$HOME/.dotfiles/secrets" ]]
then
  source "$HOME/.dotfiles/secrets"
fi
