-- Mappings
local map = require("core.utils").map

map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")

-- Plugins
local customPlugins = require "core.customPlugins"

customPlugins.add(function(use)
    use {
        'mfussenegger/nvim-dap',
        config = function() require "custom.plugins.dap" end,
        setup = function()
            require("core.utils").packer_lazy_load "nvim-dap"
        end
    }
    use {
        "rcarriga/nvim-dap-ui",
        after = "nvim-dap",
        config = function() require("dapui").setup() end
    }
end)
