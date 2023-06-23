vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- General settings
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.mouse = "a"

--source file
vim.api.nvim_set_keymap('n', '<C-s>', ':source %<CR>', { noremap = true, silent = true })

--remove highlight
vim.api.nvim_set_keymap('n', '<Leader>-v>', ':noh<CR>', { noremap = true, silent = true })



--automatic commenting when inserting to a new lin
vim.api.nvim_create_autocmd("BufEnter",{
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c","r","o" } end,
  }
)

vim.api.nvim_set_keymap('n', '<leader>ps', ':PackerSync<CR>', { noremap = true, silent = true })
