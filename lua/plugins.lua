--
-- neovim plugins 2022
--

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- fancy colorscheme
  use { 'navarasu/onedark.nvim', config = function ()
    require('onedark').setup {
      style = 'darker'
    }
    require('onedark').load()
  end }


  -- fancy bracket completion
  use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end }

  -- use tab for completion
  use 'ervandew/supertab'

  -- syntax highlight EVERYTHING
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'sheerun/vim-polyglot'

  -- fuzzy findy fantastiche
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }

  -- tpope: Vim plugin artist
  use 'tpope/vim-abolish'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'

  -- autosave
  use { 'Pocco81/AutoSave.nvim', config = function() require('autosave').setup() end }

  -- file tree viewer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup() end
  }

  -- git info in gutter
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function() require'gitsigns'.setup() end
  }

  -- TODO lsp + mappings + servers: https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
  -- TODO whichkey?
end)
