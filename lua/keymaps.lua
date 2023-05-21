local opts = { noremap = true, silent = true }

--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize +2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)



-- Set up your keybinding
vim.api.nvim_set_keymap('n', '<leader>n', ':lua create_file_in_current_directory()<CR>', { noremap = true, silent = true })

-- Define the function to create a new file in the current directory
function create_file_in_current_directory()
    -- Prompt for the new file's name
    local filename = vim.fn.input('New file: ')

    -- If a name was given, create the file in the current buffer's directory
    if filename and filename ~= '' then
        local filepath = vim.fn.expand('%:p:h') .. '/' .. filename
        vim.cmd('edit ' .. filepath)
    end
end


--changes the working directory between the current buffers directory and the previous working directory.
-- Create a table to store the previous working directory
_G.my_global_variable = _G.my_global_variable or {}
_G.my_global_variable.previous_working_directory = nil

-- Set up your keybinding
vim.api.nvim_set_keymap('n', '<leader>cd', ':lua toggle_working_directory()<CR>', { noremap = true, silent = true })

-- Define the function to toggle the working directory
function toggle_working_directory()
    if _G.my_global_variable.previous_working_directory then
        -- Change to the previous working directory
        vim.cmd('cd ' .. _G.my_global_variable.previous_working_directory)
        _G.my_global_variable.previous_working_directory = nil
    else
        -- Store the current working directory
        _G.my_global_variable.previous_working_directory = vim.fn.getcwd()
        -- Change to the current buffer's directory
        vim.cmd('lcd %:p:h')
    end
end



-- Set up your keybinding
vim.api.nvim_set_keymap('n', '<leader>t', ':lua open_terminal_in_current_directory()<CR>', { noremap = true, silent = true })

-- Define the function to open a terminal in the current directory
function open_terminal_in_current_directory()
    -- Open a new split window
    vim.cmd('10split')

    -- Change to the directory of the current file
    vim.cmd('lcd %:p:h')

    -- Open a terminal
    vim.cmd('terminal')
end
