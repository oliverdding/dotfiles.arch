local M = {}

M.setup_lsp = function(attach, capabilities)
    local lspconfig = require "lspconfig"

    local servers = {
        "bashls", -- bash
        "clangd", -- c
        "cssls", -- css, less, sass
        "denols", -- javascript, typeScript
        "gopls", -- go
        "jsonls", -- json
        "pyright", -- python
        "rust_analyzer", -- rust
        "sumneko_lua", -- lua
        "texlab", -- latex
        "yamlls" -- yaml
    }

    for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
            on_attach = attach,
            capabilities = capabilities,
            flags = {debounce_text_changes = 150}
        }
    end
end

return M
