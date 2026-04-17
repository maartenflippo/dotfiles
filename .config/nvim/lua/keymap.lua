local nmap = function(key, action, desc)
	vim.keymap.set("n", key, action, { desc = desc })
end

nmap("-", "<cmd>Explore<CR>", "Open parent directory Netrw.")

-- Navigate open tabs
nmap("<C-j>", "<C-W>j", "Move pane focus down")
nmap("<C-k>", "<C-W>k", "Move pane focus up")
nmap("<C-h>", "<C-W>h", "Move pane focus left")
nmap("<C-l>", "<C-W>l", "Move pane focus right")
