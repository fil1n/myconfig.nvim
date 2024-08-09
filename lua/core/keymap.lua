-- core.keybindings
local keymap = vim.keymap

-- remap leader key
vim.g.mapleader = ','

-- force quit
keymap.set('n', '<leader>fq', ':qall!<CR>')

-- generate tags
if vim.fn.executable('ctags') == 1 then
	vim.keymap.set('n', '<leader>ct', ':!ctags --recurse . <CR>')
end
