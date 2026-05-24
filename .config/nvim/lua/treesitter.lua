return {
    -- Enable a tree-sitter parser for the given language.
    --
    -- The language should match the filetype name, the `.so` file that holds
    -- the parser, and the queries/ subfolder.
    enable = function(language, filetype)
        filetype = filetype or language
        vim.treesitter.language.register(language, filetype)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = filetype,
            callback = function()
                vim.treesitter.start()
            end,
        })
    end
}
