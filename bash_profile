if [ -n "$SSH_CLIENT" ]
then 
  hostname_display="`hostname` " 
fi

source ~/.bashrc

eval "$(rbenv init -)"

export PATH="./bin:$PATH"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export BASH_SILENCE_DEPRECATION_WARNING=1
