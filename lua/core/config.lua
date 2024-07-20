local opt = vim.opt

local keymap = vim.keymap

-- number line
opt.relativenumber = true
opt.number = true

-- highlight matching parenthesis
opt.showmatch = true

-- tabs & indent
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
opt.smarttab = true

-- clipboard
opt.clipboard = 'unnamedplus'

-- disable swapfile
opt.swapfile = false

-- disable welcome screen
opt.shortmess:append('sI')

-- set font for nvim-qt
-- https://github.com/tonsky/FiraCode
pcall(opt.guifont, 'Fira Code')
