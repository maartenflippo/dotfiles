require("treesitter").enable("rust")

vim.lsp.config('rust_analyzer', {
    settings = {
        ['rust-analyzer'] = {
            cargo = {
                allFeatures = true,
            },
        },
    },
})

vim.lsp.enable("rust_analyzer")
