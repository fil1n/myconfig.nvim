local keymap = vim.keymap

-- Harpoon2
--
--
--

local harpoon = require('harpoon')

keymap.set('n', '<leader>ha', function()
	harpoon:list():add()
end)

keymap.set('n', '<leader>hr', function()
	harpoon:list():remove()
end)

keymap.set('n', '<leader>hm', function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

keymap.set('n', '<C-h>', function()
	harpoon:list():select(1)
end)

keymap.set('n', '<C-t>', function()
	harpoon:list():select(2)
end)

keymap.set('n', '<C-n>', function()
	harpoon:list():select(3)
end)

keymap.set('n', '<C-s>', function()
	harpoon:list():select(4)
end)

keymap.set('n', '<leader>hp', function()
	harpoon:list():prev()
end)

keymap.set('n', '<leader>hn', function()
	harpoon:list():next()
end)

-- Telescope
--
--
--

local builtin = require('telescope.builtin')

-- harpoon telescope integration function
local conf = require('telescope.config').values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require('telescope.pickers')
		.new({}, {
			prompt_title = 'Harpoon',
			finder = require('telescope.finders').new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

-- find files
keymap.set('n', '<leader>ff', builtin.find_files, {})

-- find with grep
keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- find buffers
keymap.set('n', '<leader>fb', builtin.buffers, {})

-- find "harpooned" files
keymap.set('n', '<leader>fh', function()
	toggle_telescope(harpoon:list())
end, { desc = 'Open harpoon window' })

-- NvimTree
--
--
--

keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>')
