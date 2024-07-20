-- nix indentation & formatter

local opt = vim.opt

if vim.fn.executable('nixfmt') == 1 then
	vim.keymap.set('n', '<leader>cf', ':w<CR>:!nixfmt %<CR>')
end

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
