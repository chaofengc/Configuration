#!/bin/bash

rm -f $HOME/.vimrc $HOME/.tmux.conf
ln -sf $HOME/Configuration/.vimrc $HOME/.vimrc 
ln -sf $HOME/Configuration/.tmux.conf $HOME/.tmux.conf 

conda install -c conda-forge tmux==2.7
conda install -c conda-forge vim 

# ---------------- Install vim plugin -------------------                                                                                                                                          
echo "Install vim plugin"
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
