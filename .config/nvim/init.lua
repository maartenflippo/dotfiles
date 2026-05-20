vim.g.mapleader = " "
vim.g.localleader = "\\"

require("options")
require("keymap")
require("pack")
require("lang")
require("diagnostics")

vim.cmd.colorscheme "catppuccin-nvim"
