local utils = require('utils')

-- normal mode
local mode = 'n'
utils.map(mode, '<C-l>', '<cmd>noh<CR>')
utils.map(mode, '<C-j>', '<cmd>m+<CR>')
utils.map(mode, '<C-k>', '<cmd>m-2<CR>')
utils.map(mode, '<A-l>', '<cmd>wincmd l<CR>')
utils.map(mode, '<A-h>', '<cmd>wincmd h<CR>')
utils.map(mode, '<A-k>', '<cmd>wincmd k<CR>')
utils.map(mode, '<A-j>', '<cmd>wincmd j<CR>')
utils.map(mode, '<leader>ut', '<cmd>UndoTreeToggle<CR>')
utils.map(mode, '<leader>w', '<cmd>w<CR>')
utils.map(mode, '<leader>q', '<cmd>wq<CR>')
utils.map(mode, '<leader>a', '<cmd>q!<CR>')

-- insert mode
local mode = 'i'
utils.map(mode, 'jk', '<Esc>')
