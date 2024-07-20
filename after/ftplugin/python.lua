-- python black & isort formatting

if vim.fn.executable('black') == 1 then
	vim.keymap.set('n', '<leader>cf', ':w<CR>:!black %<CR>')
end

if vim.fn.executable('isort') == 1 then
	vim.keymap.set('n', '<leader>ci', ':w<CR>:!isort %<CR>')
end
