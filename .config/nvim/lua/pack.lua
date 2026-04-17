-- Configuration of vim pack
--
-- Plugins are configured in the `plugins/` directory.

vim.pack.add {
    -- Tools
    { src = "https://github.com/neovim/nvim-lspconfig", name = "lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim",  name = "mason" },

    -- Theme
    { src = "https://github.com/catppuccin/nvim",       name = "catppuccin" },
}

require("plugins.mason")
