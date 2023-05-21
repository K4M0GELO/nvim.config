vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- General settings
--vim.opt.number = true
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.api.nvim_command [[ set relativenumber]] 
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.relativenumber = false
--vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"

--source file
vim.api.nvim_set_keymap('n', '<C-S>', ':source %<CR>', { silent = true })



--automatic commenting when inserting to a new lin
vim.api.nvim_create_autocmd("BufEnter",{
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c","r","o" } end,
  }
)


