#!/bin/bash

source ~/.dotfiles/bashrc_colors

export TERM=xterm
export GREP_OPTIONS='--color=always --exclude=*coverage* --exclude=tags --exclude-dir=.git'
export CLICOLOR=1

# of course ls is different on os x
if [ -f /etc/debian_version ]
then
  alias ls='ls --color=auto'
else
  alias ls='ls -G'
fi
alias ll='ls -lh'
alias la='ls -lah'
alias less='less -R' # parse control chars as colors
alias ..="cd .."
alias ta='tmux attach -d -t'

# weirdo hack for loading readline instead of libedit http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=608442
alias psql='LD_PRELOAD=/lib/libreadline.so.5 psql'

prompt_color=$COLOR_GREEN
export PATH="~/bin:/sbin:/usr/local/bin:$PATH"

if [ -d "$HOME/Projects/bin/common-onemain-executables" ]; then
  export PATH="~/Projects/bin/common-onemain-executables:$PATH"
fi

export SUDO_PS1="\[${COLOR_RED}\]\w\[${COLOR_NC}\]# "

if [[ `uname` =~ 'Darwin' ]]
then
  prompt_end='👻 '
else
  prompt_end='$'
fi

export PS1="$hostname_display\[$prompt_color\]\w\[${COLOR_NC}\] $prompt_end "

export EDITOR="vim"
export PSQL_EDITOR='vim -c"set syntax=sql"'

export HISTCONTROL=ignoredups
export PROMPT_COMMAND='history -a' # Save Your Bash History Across Tabs And Sessions

shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns

bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# enable programmable completion features
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -e "$HOME/.proxy" ]; then
    . turn_on_proxy
fi

# https://github.com/zimbatm/direnv
#eval "$(direnv hook bash)"

function lesscsv() { column -s , -n -t "$@" | less -#2 -N -S; }

if [[ -s "$HOME/.dotfiles/secrets" ]]
then
  source "$HOME/.dotfiles/secrets"
fi

source "$HOME/.dotfiles/git-completion.bash"

#export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# https://github.com/athityakumar/colorls
#source $(dirname $(gem which colorls))/tab_complete.sh

# bash-completion
 [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
