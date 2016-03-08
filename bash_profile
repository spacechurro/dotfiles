if [ -n "$SSH_CLIENT" ]
then 
  hostname_display="`hostname` " 
fi

source ~/.bashrc

eval "$(rbenv init -)"

export PATH="./bin:$PATH"
