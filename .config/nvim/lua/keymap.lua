local map = function(key, action, desc, modes)
    modes = modes or { "n" }
    vim.keymap.set(modes, key, action, { desc = desc })
end

map("-", "<cmd>Explore<CR>", "Open parent directory Netrw.")

-- Navigate based on visual lines, not actual lines
map("j", "gj", "Move down", { "n", "v" })
map("k", "gk", "Move up", { "n", "v" })
map("0", "g0", "Move to beginning of line", { "n", "v" })
map("$", "g$", "Move to end of line", { "n", "v" })

-- Navigate open tabs
map("<C-j>", "<C-W>j", "Move pane focus down")
map("<C-k>", "<C-W>k", "Move pane focus up")
map("<C-h>", "<C-W>h", "Move pane focus left")
map("<C-l>", "<C-W>l", "Move pane focus right")

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
