require("mason").setup()

local lsp_config = require("mason-lspconfig")
local cmp_capabilities = require("lsp.cmp")

lsp_config.setup {
    ensure_installed = { "lua_ls" },
}

lsp_config.setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup {
            capabilities = cmp_capabilities
        }
    end
}
