#!/bin/bash

if [ -a $HOME/.vimrc ]; then
  rm $HOME/.vimrc 
fi
ln -s $HOME/dotfiles/.vimrc $HOME/

if [ -a $HOME/.vim ]; then
  rm -rf $HOME/.vim 
fi
ln -s $HOME/dotfiles/.vim $HOME/
