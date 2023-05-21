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
  use {'windwp/nvim-ts-autotag',
  require('nvim-ts-autotag').setup()}

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
  use {'nvim-treesitter/nvim-treesitter',
    config = function()
      require('plugins.nvim-treesitter').setup()
    end,
  run = ':TSUpdate'}

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

