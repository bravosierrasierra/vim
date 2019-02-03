#!/bin/bash

rm -f ~/.vim
mkdir -p ~/temp
ln -s `pwd` ~/.vim
rm -f ~/.tmux.conf
ln -s `pwd`/_tmux.conf ~/.tmux.conf
rm -f ~/.vimrc
ln -s `pwd`/vimrc ~/.vimrc
