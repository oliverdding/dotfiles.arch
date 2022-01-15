local M = {}

-- Maintain the structure of `core/default_config.lua` here
M.options = {
    tabstop = 4,
    shiftwidth = 4,
}

M.ui = {theme = "gruvbox",italic_comments = true,}

M.plugins = {
    status = {colorizer = true, dashboard = false},
    options = {
        lspconfig = {setup_lspconf = "custom.plugins.lspconfig"},
        nvimtree = {
            enable_git = 1,
            ui = {side = "right", hide_root_folder = false}
        },
        statusline = {
            style = "arrow", -- default, round , slant , block , arrow
        }
    }
}

return M
