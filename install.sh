#!/bin/bash
cp .vimrc ${HOME}
mkdir -p ~/.vim/autoload ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall
