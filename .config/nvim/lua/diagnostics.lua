vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),

    callback = function(ev)
        -- Diagnostic Config
        -- See :help vim.diagnostic.Opts
        vim.diagnostic.config({
            severity_sort = true,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "󰅚 ",
                    [vim.diagnostic.severity.WARN] = "󰀪 ",
                    [vim.diagnostic.severity.INFO] = "󰋽 ",
                    [vim.diagnostic.severity.HINT] = "󰌶 ",
                },
            },
            virtual_text = false,
        })

        vim.keymap.set("n", "<leader>d", function()
            local opts = {
                focusable = false,
                scope = 'cursor',
                close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter' },
            }
            vim.diagnostic.open_float(nil, opts)
        end)
    end
})
