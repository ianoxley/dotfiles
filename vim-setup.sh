#! /usr/bin/env bash

mkdir -p ~/.vim/pack/{other,syntax,themes}/{opt,start}

cd ~/.vim/pack/other/start
git clone git@github.com:mileszs/ack.vim.git ack.vim
git clone https://github.com/w0rp/ale.git ale
git clone https://github.com/junegunn/fzf.vim.git fzf.vim
git clone https://github.com/itchyny/lightline.vim lightline.vim
git clone git@github.com:maximbaz/lightline-ale.git lightline-ale
git clone git@github.com:preservim/nerdtree.git nerdtree
git clone git@github.com:tpope/vim-fugitive.git vim-fugitive
git clone git@github.com:jamessan/vim-gnupg.git vim-gnupg
git clone git@github.com:tpope/vim-unimpaired.git vim-unimpaired
