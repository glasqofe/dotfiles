local g = vim.g
local opt = vim.opt

-- Editor Options
opt.termguicolors = true
opt.relativenumber = true
opt.mouse = 'a'
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.wrap = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.cursorline = true
opt.colorcolumn = '80'
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 8
opt.clipboard = 'unnamedplus'

g.gruvbox_baby_background_color = 'dark'
vim.cmd.colorscheme('gruvbox-baby')

-- Plugins
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

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  use 'folke/tokyonight.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'luisiacc/gruvbox-baby'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = 'gruvbox-baby',
      component_separators = {
        left = '',
        right = ''
      },
      section_separators = { 
        left = '',
        right = ''
      },
    },
  }

  require('nvim-treesitter.configs').setup {
    ensure_installed = {
      'lua',
      'bash',
    },
    highlight = {
      enable = true,
    }
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
