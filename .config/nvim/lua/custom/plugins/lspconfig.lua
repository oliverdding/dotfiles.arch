require("plugins.configs.others").lsp_handlers()

local function on_attach(_, bufnr)
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable lsp_signature
    require("lsp_signature").on_attach()

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
    require("core.mappings").lspconfig()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local lspconfig = require("lspconfig")

-- Defaultly setup LSP

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
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {debounce_text_changes = 150}
    }
end

-- Customizedly setup LSP
