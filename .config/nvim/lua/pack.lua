-- Configuration of vim pack
--
-- Plugins are configured in the `plugins/` directory.

vim.pack.add {
    -- Tools
    { src = "https://github.com/neovim/nvim-lspconfig",       name = "lspconfig" },
    { src = "https://github.com/saghen/blink.cmp",            name = "blink",       version = "v1.10.2" },
    { src = "https://github.com/mason-org/mason.nvim",        name = "mason" },
    { src = "https://github.com/ibhagwan/fzf-lua",            name = "fzf-lua" },
    { src = "https://github.com/stevearc/oil.nvim",           name = "oil" },
    { src = "https://github.com/Julian/lean.nvim",            name = "lean" },

    -- Appearance
    { src = "https://github.com/nvim-tree/nvim-web-devicons", name = "web-devicons" },
    { src = "https://github.com/catppuccin/nvim",             name = "catppuccin" },
    { src = "https://github.com/nvim-lualine/lualine.nvim",   name = "lualine" },
    { src = "https://github.com/j-hui/fidget.nvim",           name = "fidget" },
}

-- Coqtail eagerly probes the python3 provider as soon as it is loaded, which
-- errors out on startup if pynvim isn't installed. `load = false` only
-- defers loading to Nvim's automatic post-startup load-plugins step, which
-- still runs before any file is opened, so pass a no-op `load` callback
-- instead: this installs/tracks the plugin without ever touching
-- 'runtimepath' until lang/coq.lua explicitly `packadd`s it.
vim.pack.add({
    { src = "https://github.com/whonore/Coqtail", name = "coqtail" },
}, { load = function() end })

require("plugins.mason")
require("plugins.lualine")
require("plugins.fidget")
require("plugins.fzf-lua")
require("plugins.blink")
require("plugins.oil")
require("plugins.lean")
