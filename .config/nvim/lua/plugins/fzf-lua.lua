local fzf = require("fzf-lua")

fzf.setup()
fzf.register_ui_select()

vim.keymap.set("n", "<leader>ff", fzf.files)
vim.keymap.set("n", "<leader>fg", fzf.live_grep)
vim.keymap.set("n", "<leader>fb", fzf.buffers)
vim.keymap.set("n", "<leader>fr", fzf.lsp_references)
vim.keymap.set("n", "<leader>fs", fzf.lsp_live_workspace_symbols)
vim.keymap.set("n", "<leader>fd", fzf.lsp_document_diagnostics)
vim.keymap.set("n", "<leader>fwd", fzf.lsp_workspace_diagnostics)
vim.keymap.set("n", "<leader>ca", fzf.lsp_code_actions)
