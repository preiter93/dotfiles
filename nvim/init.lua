-- Load options from options.lua
require('options')

-- Load mappings from mappings.lua
require('mappings')

-- Load the nvim plugin manager
require('lazy_config')

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
