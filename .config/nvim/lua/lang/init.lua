require("lang.lua")
require("lang.rust")

-- Format on save if an LSP is attached.
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),

    callback = function(ev)
        -- Get the `vim.lsp.Client` the event is triggered for.
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

        -- Create the autocmd to format on save.
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
            buffer = ev.buf,
            callback = function()
                vim.lsp.buf.format({ bufnr = ev.buf, id = client.id })
            end,
        })
    end
})
