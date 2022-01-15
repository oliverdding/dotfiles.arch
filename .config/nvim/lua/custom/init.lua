-- Mappings
local map = require("core.utils").map

map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")

-- Plugins
local customPlugins = require "core.customPlugins"

customPlugins.add(function(use)
    -- dap
    use {
        "mfussenegger/nvim-dap",
        disable = true,
        module = "dap",
        opt = true,
        after = "nvim-lspconfig",
        config = function() require "custom.plugins.dap" end,
        setup = function()
            require("core.utils").packer_lazy_load "nvim-dap"
        end,
    }

    use {
        "rcarriga/nvim-dap-ui",
        disable = true,
        module = "dapui",
        opt = true,
        after = "nvim-dap",
        config = function() require("dapui").setup() end,
        setup = function()
            require("core.utils").packer_lazy_load "nvim-dap-ui"
        end,
    }

    use {
        "theHamsta/nvim-dap-virtual-text",
        disable = true,
        module = "nvim-dap-virtual-text",
        opt = true,
        after = "nvim-dap",
        config = function() require("nvim-dap-virtual-text").setup() end,
        setup = function()
            require("core.utils").packer_lazy_load "nvim-dap-virtual-text"
        end,
    }

    -- rust
    use {
        "simrat39/rust-tools.nvim",
        module = "rust-tools",
        opt = true,
        after = "nvim-lspconfig",
        config = function() require "custom.plugins.rust" end,
        setup = function()
            require("core.utils").packer_lazy_load "rust-tools.nvim"
        end,
    }
end)
