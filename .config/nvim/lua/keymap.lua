local nmap = function(key, action, desc)
    vim.keymap.set("n", key, action, { desc = desc })
end

nmap("-", "<cmd>Explore<CR>", "Open parent directory Netrw.")

-- Navigate open tabs
nmap("<C-j>", "<C-W>j", "Move pane focus down")
nmap("<C-k>", "<C-W>k", "Move pane focus up")
nmap("<C-h>", "<C-W>h", "Move pane focus left")
nmap("<C-l>", "<C-W>l", "Move pane focus right")

-- Commands using LSP
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local bufnr = args.buf

        local map_for_lsp = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
        end

        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        map_for_lsp("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

        -- Show documentation of the symbol under the cursor.
        map_for_lsp("<leader>k", vim.lsp.buf.hover, "Show hover information")

        -- Go to references of the symbol under the cursor.
        map_for_lsp("gr", vim.lsp.buf.references, "[G]oto [R]eferences")

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        map_for_lsp("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        -- WARN: This is not Goto Declaration, this is Goto Definition.
        --  For example, in C this would take you to the source file.
        map_for_lsp("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
    end,
})
