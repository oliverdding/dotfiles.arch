local customPlugins = require "core.customPlugins"

customPlugins.add(function(use)
    -- lsp
    use {
        "neovim/nvim-lspconfig",
        module = "lspconfig",
        opt = true,
        config = function() require "custom.plugins.lspconfig" end,
        setup = function()
            require("core.utils").packer_lazy_load "nvim-lspconfig"
            vim.defer_fn(function()
                vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
            end, 0)
        end
    }

    use {
        "ray-x/lsp_signature.nvim",
        module = "lsp_signature",
        opt = true,
        after = "nvim-lspconfig",
        config = function() require "custom.plugins.signature" end
    }

    -- completion
    use {"rafamadriz/friendly-snippets", opt = true, event = "InsertEnter"}

    use {
        "hrsh7th/nvim-cmp",
        opt = true,
        after = "friendly-snippets",
        config = function() require "custom.plugins.cmp" end
    }

    use {
        "L3MON4D3/LuaSnip",
        opt = true,
        wants = "friendly-snippets",
        after = "nvim-cmp",
        config = function()
            local luasnip = require "luasnip"
            luasnip.config.set_config {
                history = true,
                updateevents = "TextChanged,TextChangedI"
            }
            require("luasnip/loaders/from_vscode").load()
        end
    }

    use {"saadparwaiz1/cmp_luasnip", opt = true, after = "LuaSnip"}

    use {"hrsh7th/cmp-nvim-lua", opt = true, after = "cmp_luasnip"}

    use {"hrsh7th/cmp-nvim-lsp", opt = true, after = "cmp-nvim-lua"}

    use {"hrsh7th/cmp-buffer", opt = true, after = "cmp-nvim-lsp"}

    use {"hrsh7th/cmp-path", opt = true, after = "cmp-buffer"}

    use {
        "windwp/nvim-autopairs",
        opt = true,
        after = "nvim-cmp",
        config = function()
            local autopairs = require "nvim-autopairs"
            local cmp_autopairs = require "nvim-autopairs.completion.cmp"

            autopairs.setup {fast_wrap = {}}

            local cmp = require "cmp"
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end
    }

end)
