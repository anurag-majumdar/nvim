vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.wo.relativenumber = true
vim.opt.guicursor = "n-v-i-c:block-Cursor"

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- -- transparent background
-- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'Terminal', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'FoldColumn', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'Folded', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })

-- -- transparent background for neotree
-- vim.api.nvim_set_hl(0, 'NeoTreeNormal', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'NeoTreeVertSplit', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'NeoTreeWinSeparator', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'NeoTreeEndOfBuffer', { bg = 'none' })

-- -- transparent background for nvim-tree
-- vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'NvimTreeVertSplit', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'NvimTreeEndOfBuffer', { bg = 'none' })

