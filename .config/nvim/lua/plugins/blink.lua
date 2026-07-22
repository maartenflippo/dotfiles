require("blink.cmp").setup({
    keymap = {
        preset = "default",
        ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
        ["<C-j>"] = { "select_next", "fallback_to_mappings" },
    },
})
