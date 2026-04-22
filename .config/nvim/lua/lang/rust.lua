-- vim.treesitter.language.register("rust", "rust")
--
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "rust",
--     callback = function()
--         vim.treesitter.start()
--     end,
-- })

require("treesitter").enable("rust")

vim.lsp.enable("rust_analyzer")
