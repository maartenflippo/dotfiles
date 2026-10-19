vim.lsp.config["bazel-lsp"] = {
    cmd = { "bazel-lsp" },
    filetypes = { "bzl" },
    root_markers = { "MODULE.bazel" },
}

vim.lsp.enable("bazel-lsp")
