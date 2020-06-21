#!/bin/bash

echo "Linking dot files."
echo "=================="
ln -sv -f ~/dotfiles/.vimrc ~/.vimrc
ln -sv -f ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sv -f ~/dotfiles/.inputrc ~/.inputrcf
echo 

echo "Deleting old dot directories."
echo "============================="
rm -v ~/.vim
rm -v ~/.templates
rm -v ~/.scripts
echo

echo "Linking new dot directories."
echo "============================"
ln -sv -f ~/dotfiles/.vim ~/.vim
ln -sv -f ~/dotfiles/.templates ~/.templates
ln -sv -f ~/dotfiles/.scripts ~/.scripts
