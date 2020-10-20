if [ -n "$SSH_CLIENT" ]
then 
  hostname_display="`hostname` " 
fi

source ~/.bashrc

eval "$(rbenv init -)"

export PATH="./bin:$PATH"
export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"
