#!/bin/bash

rm -f $HOME/.vimrc $HOME/.tmux.conf
ln -sf $HOME/Configuration/.vimrc $HOME/.vimrc 
ln -sf $HOME/Configuration/.tmux.conf $HOME/.tmux.conf 

# ---------------- Install vim plugin -------------------                                                                                                                                          
if ! [ -d $HOME/.vim/bundle/YouCompleteMe ]; then
    echo "Install vim plugin and compile YouCompleteMe"
    if ! [ -d $HOME/.vim/bundle/Vundle.vim ]; then
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi
    vim +PluginInstall +qall
    cd ~/.vim/bundle/YouCompleteMe
    ./install.py --clang-completer
else
    echo "Vim plugin already installed."
fi
