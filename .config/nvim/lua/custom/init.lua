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
        disable = false,
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
        disable = false,
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
        disable = false,
        module = "nvim-dap-virtual-text",
        opt = true,
        after = "nvim-dap",
        config = function() require("nvim-dap-virtual-text").setup() end,
        setup = function()
            require("core.utils").packer_lazy_load "nvim-dap-virtual-text"
        end,
    }

    -- dap-plugins

    use {
        "mfussenegger/nvim-dap-python",
        disable = false,
        module = "dap-python",
        opt = true,
        after = "nvim-dap",
        config = function ()
            require("dap-python").setup("python")
        end,
        setup = function()
            require("core.utils").packer_lazy_load "nvim-dap-python"
        end,
    }

    use {
        "leoluz/nvim-dap-go",
        disable = false,
        module = "dap-go",
        opt = true,
        after = "nvim-dap",
        config = function ()
            require("dap-go").setup()
        end,
        setup = function()
            require("core.utils").packer_lazy_load "nvim-dap-go"
        end,
    }
end)
