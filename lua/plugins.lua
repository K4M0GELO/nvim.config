-- Function to load plugins
local function load_plugins() local plugins_path = vim.fn.stdpath('config') .. '/lua/plugins/'
   local files = vim.fn.globpath(plugins_path, '*.lua', 0, 1)
   for _, file in ipairs(files) do
      local module = file:match('^' .. plugins_path .. '(.*)%.lua$'):gsub('/', '.')
      require(module)
   end
end

-- Setting up packer.nvim
require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Add your other plugins here
  --CODING 
  use {'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end 
  }
use {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end
}

  --THEME
  use 'folke/tokyonight.nvim'

  use {'nvim-treesitter/nvim-treesitter',run = ':TSUpdate'}

  --NAVIGATION
    use { 'nvim-telescope/telescope.nvim',
    config = function()
      require('plugins.telescope').setup()
    end,
    requires = { {'nvim-lua/plenary.nvim'} }}

  --COMPLITION
  use {'hrsh7th/nvim-cmp'}
  use {'neovim/nvim-lspconfig'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-cmdline'}
  use {'L3MON4D3/LuaSnip'}
  use {'saadparwaiz1/cmp_luasnip'}

   -- Load plugin configurations
   load_plugins()
end)


--Auto Install
vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile | PackerSync
  augroup end
]], false)


require'nvim-treesitter.configs'.setup { 
  -- A list of parser names, or "all" (the five listed parsers should always be installed) 
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query" }, 
  -- Install parsers synchronously (only applied to `ensure_installed`) 
  sync_install = false, 
  -- Automatically install missing parsers when entering buffer 
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally 
  auto_install = true, 
  -- List of parsers to ignore installing (for "all") 
  ignore_install = { "javascript" }, 
  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup) 
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")! 
  highlight = { 
    enable = true, 
    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to 
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is 
    -- the name of the parser) 
    -- list of language that will be disabled 
    disable = { "rust" }, 
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files 
    disable = function(lang, buf) 
        local max_filesize = 100 * 1024 -- 100 KB 
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf)) 
        if ok and stats and stats.size > max_filesize then 
            return true 
        end 
    end, 
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time. 
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation). 
    -- Using this option may slow down your editor, and you may see some duplicate highlights. 
    -- Instead of true it can also be a list of languages 
    additional_vim_regex_highlighting = false, 
  }, 
}
