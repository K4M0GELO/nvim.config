local opts = { noremap = true, silent = true }


--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize +2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)


--packerSync
--vim.api.nvim_set_keymap('n', '<leader>ps',  "[[<Cmd>execute 'w' | 'source %'<CR> | PackerSync<CR> ]]<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ps', [[:w<CR><Cmd>execute 'source %' | PackerSync<CR>]], { noremap= true , silent = true })

--nvim-tree
vim.api.nvim_set_keymap('n', '<C-N>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
