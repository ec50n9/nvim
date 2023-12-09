local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use "nvim-lua/plenary.nvim"

  -- auto closing
  use "windwp/nvim-autopairs"

  -- file explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      -- vs-code like icons
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  -- preferred colorscheme
  use 'folke/tokyonight.nvim'

  -- telescope 推荐安装，但是这个插件需要cmake，目前还没有
  -- use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- hop.nvim
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  -- maximizes and restores current window
  use "szw/vim-maximizer"

  -- commenting with gc
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  -- essential plugins
  use "tpope/vim-surround"

  -- autocompletion
  use "hrsh7th/nvim-cmp" -- completion plugin
  use "hrsh7th/cmp-buffer" -- source for text in buffer
  use "hrsh7th/cmp-path" -- source for file system paths

  -- snippets
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "saadparwaiz1/cmp_luasnip" -- for autocompletion
  use "rafamadriz/friendly-snippets" -- useful snippets

  -- 安装和管理 lsp 服务器
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  -- 配置lsp服务器
  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-nvim-lsp"
  use {
    'nvimdev/lspsaga.nvim',
    after = 'nvim-lspconfig',
    config = function()
        require('lspsaga').setup({})
    end,
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }
  use "jose-elias-alvarez/typescript.nvim"
  use "onsails/lspkind.nvim"
  use "simrat39/rust-tools.nvim"

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
