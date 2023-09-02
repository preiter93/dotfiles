-- Get the absolute path of the directory containing this file
local script_dir = vim.fn.expand('<sfile>:p:h')
-- Add the directory to the search path
package.path = package.path .. ';' .. script_dir .. '/?.lua'

-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
--  https://github.com/folke/lazy.nvim
--  `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Loads lua/plugins
require("lazy").setup("plugins")

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- Load options from options.lua
require('options')

-- Load mappings from mappings.lua
require('mappings')
