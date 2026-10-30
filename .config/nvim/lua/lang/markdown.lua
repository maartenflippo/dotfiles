vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("my.markdown", { clear = true }),
    pattern = "markdown",
    callback = function()
        vim.opt_local.formatoptions:append("a")
    end,
})
