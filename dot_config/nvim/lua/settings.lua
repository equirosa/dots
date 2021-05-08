local utils = require('utils')
local cmd = vim.cmd
local indent = 4

cmd 'syntax enable'
cmd 'filetype plugin indent on'
-- buffer
utils.opt('b', 'expandtab', false)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'autoindent', true)
utils.opt('b', 'tabstop', indent)
utils.opt('b', 'swapfile', false)

-- global
utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'scrolloff', 8 )
utils.opt('o', 'shiftround', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('o', 'clipboard','unnamed,unnamedplus')
utils.opt('o', 'incsearch', true)
utils.opt('o', 'mouse', 'a')
utils.opt('o', 'undofile', true)
utils.opt('o', 'undodir', '/home/eduardo/.local/share/nvim/undodir')

-- window
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
utils.opt('w', 'colorcolumn', "80")

-- highlight on yank
cmd 'autocmd TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
