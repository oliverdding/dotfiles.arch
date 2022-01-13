local M = {}

-- Maintain the structure of `core/default_config.lua` here

M.ui = {theme = "gruvbox"}

M.plugins = {
    status = {colorizer = true, dashboard = true},
    options = {
        lspconfig = {setup_lspconf = "custom.plugins.lspconfig"},
        nvimtree = {enable_git = 1,ui = {side = "right"}},
        statusline = {
            style = "arrow" -- default, round , slant , block , arrow
        }
    }
}

return M
