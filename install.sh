#!/bin/bash

rm -f $HOME/.vimrc $HOME/.tmux.conf
ln -sf $HOME/Configuration/.vimrc $HOME/.vimrc 
ln -sf $HOME/Configuration/.tmux.conf $HOME/.tmux.conf 

# ---------------- Install vim plugin -------------------                                                                                                                                          
if ! [ -d $HOME/.vim/plugged ]; then
    echo "Install vim plugin"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall
else
    echo "Vim plugin already installed."
fi
