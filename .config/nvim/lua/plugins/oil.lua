require("oil").setup()

-- If Oil is installed, we override the builtin Netrw explorer with Oil.
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
