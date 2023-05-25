# NeoVim Configuration

This repository hosts a comprehensive Neovim configuration tailored for an efficient and visually pleasing development experience. It includes several plugins, key mappings, and other settings that are organized in a modular fashion for easy customization.

## Features

### Plugins
- [Packer.nvim](https://github.com/wbthomason/packer.nvim): used as the plugin manager, providing a declarative way to manage plugins and their respective configurations.
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) and [nvim-autopairs](https://github.com/windwp/nvim-autopairs): automate the closing and pairing of tags and brackets respectively.
- [Comment.nvim](https://github.com/numToStr/Comment.nvim): allows for quick commenting of code lines and blocks.
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim): sets the visually appealing color scheme for the Neovim interface.
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): ensures better syntax highlighting and text objects based on the Tree-sitter incremental parsing library.
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): provides a fuzzy finder for efficient file navigation.
- The completion suite is managed by [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) along with a collection of other plugins like [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig), [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp), [cmp-buffer](https://github.com/hrsh7th/cmp-buffer), [cmp-path](https://github.com/hrsh7th/cmp-path), [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline), [LuaSnip](https://github.com/L3MON4D3/LuaSnip), and [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) to provide fast and intelligent auto-completion.

### General Settings

The general settings include configurations for:
- Tab settings and line numbering
- Clipboard configuration
- Automatic commenting when inserting a new line
- Leader keys mapping
- Enabling relative line numbers
- Ignoring case in searches
- Enabling mouse in all modes

### Key Mappings

Custom key mappings are set for a variety of functions including:
- Resizing windows
- Quick access to Packer
- File creation
- Toggling working directories
- Opening terminals in the current directory

### Colors and Appearance

The appearance is set to be pleasing to the eyes with a dark theme. It uses the 'tokyonight' theme.
