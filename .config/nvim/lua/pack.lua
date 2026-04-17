-- Configuration of vim pack
--
-- Plugins are configured in the `plugins/` directory.

vim.pack.add {
    -- Tools
    { src = "https://github.com/neovim/nvim-lspconfig",       name = "lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim",        name = "mason" },

    -- Appearance
    { src = "https://github.com/nvim-tree/nvim-web-devicons", name = "web-devicons" },
    { src = "https://github.com/catppuccin/nvim",             name = "catppuccin" },
    { src = "https://github.com/nvim-lualine/lualine.nvim",   name = "lualine" },
    { src = "https://github.com/j-hui/fidget.nvim",           name = "fidget" },
}

require("plugins.mason")
require("plugins.lualine")
require("plugins.fidget")
