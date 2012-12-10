#!/bin/bash

#for file in vimrc bashrc screenrc inputrc editrc
#do
#  cmd="ln -sf  $HOME/.dotfiles/$file ~/.$file"
#  echo "$cmd"
#  `$cmd`
#  #ln -sf  $HOME/.dotfiles/bashrc        ~/.bashrc
#  #ln -sf  $HOME/.dotfiles/screenrc      ~/.screenrc
#  #ln -sf  $HOME/.dotfiles/inputrc       ~/.inputrc
#  #ln -sf  $HOME/.dotfiles/editrc        ~/.editrc
#done
ln -sf  $HOME/.dotfiles/bashrc        ~/.bashrc
ln -sf  $HOME/.dotfiles/screenrc      ~/.screenrc
ln -sf  $HOME/.dotfiles/inputrc       ~/.inputrc
ln -sf  $HOME/.dotfiles/editrc        ~/.editrc
ln -sf  $HOME/.dotfiles/gemrc        ~/.gemrc
