return {
    -- Enable a tree-sitter parser for the given language.
    --
    -- The language should match the filetype name, the `.so` file that holds
    -- the parser, and the queries/ subfolder.
    enable = function(language)
        vim.treesitter.language.register(language, language)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = language,
            callback = function()
                vim.treesitter.start()
            end,
        })
    end
}
