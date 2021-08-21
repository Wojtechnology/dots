#!/bin/bash

VUNDLE_PATH=~/.vim/bundle/Vundle.vim
COLORS_PATH=~/.vim/colors

# Install vundle
if [ -d "$VUNDLE_PATH" ]; then
    echo 'Vundle already installed'
else
    git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_PATH
fi

# Copy vimrc
cp .vimrc ~/.vimrc
[ -d $COLORS_PATH ] || mkdir -p $COLORS_PATH && cp .vim/colors/* $COLORS_PATH

# Install plugins
vim -c ':PluginInstall' -c ':qa'
