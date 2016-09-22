#!/bin/bash

# TODO: if OS X
# install homebrew
# brew install fish
# brew install peco
# brew install ghq
# brew install hub
# brew install ctags

if [ -a $HOME/.vimrc ]; then
  rm $HOME/.vimrc
fi
ln -s $HOME/dotfiles/.vimrc $HOME/

if [ -a $HOME/.vim ]; then
  rm -rf $HOME/.vim
fi
ln -s $HOME/dotfiles/.vim $HOME/

if [ -a $HOME/.config/fish/config.fish ]; then
  rm $HOME/.config/fish/config.fish
fi
ln -f $HOME/dotfiles/fish/config.fish $HOME/.config/fish/

# Install dein.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh  ~/.vim/dein

# Add synboric link to nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

