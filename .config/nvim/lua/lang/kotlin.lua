require("treesitter").enable("kotlin")

vim.lsp.config('kotlin_lsp', {
  root_markers = { 'workspace.json', 'build.gradle', 'build.gradle.kts', 'pom.xml', '.git' },
})

vim.lsp.enable("kotlin_lsp")
