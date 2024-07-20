local keymap = vim.keymap

-- remap leader key
vim.g.mapleader = ','

-- force quit
keymap.set('n', '<leader>fq', ':qall!<CR>')
