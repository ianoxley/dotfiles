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

cd ~/.vim/pack/other/opt
git clone https://github.com/junegunn/goyo.vim.git goyo.vim
git clone git@github.com:vimwiki/vimwiki.git vimwiki

cd ~/.vim/pack/syntax/start
git clone https://github.com/autozimu/LanguageClient-neovim.git LanguageClient-neovim
git clone https://github.com/jiangmiao/auto-pairs.git auto-pairs
git clone git@github.com:tomtom/tcomment_vim.git tcomment_vim
git clone git@github.com:tpope/vim-endwise.git vim-endwise
git clone git@github.com:terryma/vim-expand-region.git vim-expand-region
git clone https://github.com/pangloss/vim-javascript.git vim-javascript
git clone https://github.com/mxw/vim-jsx.git vim-jsx
git clone git@github.com:vim-ruby/vim-ruby.git vim-ruby
git clone git@github.com:honza/vim-snippets.git vim-snippets
git clone https://github.com/tpope/vim-surround.git vim-surround

cd ~/.vim/pack/syntax/opt
git clone https://github.com/kchmck/vim-coffee-script.git vim-coffee-script

cd ~/.vim/pack/themes/opt
git clone https://github.com/lifepillar/vim-solarized8.git vim-solarized8
git clone git@github.com:altercation/vim-colors-solarized.git vim-colors-solarized
git clone git@github.com:vim-scripts/wombat256.vim.git wombat256mod
