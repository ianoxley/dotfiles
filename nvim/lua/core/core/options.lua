-- options.lua

vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.opt.encoding = 'utf-8'
vim.opt.showcmd = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.textwidth = 79
vim.opt.formatoptions = 'qrn1'
vim.opt.colorcolumn = '120'

vim.opt.undolevels = 1000
vim.opt.laststatus = 2
vim.opt.shell = '/usr/local/bin/zsh'

vim.keymap.set('i', 'jk', '<Esc>')
