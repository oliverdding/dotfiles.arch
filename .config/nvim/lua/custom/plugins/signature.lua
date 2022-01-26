local present, lspsignature = pcall(require, "lsp_signature")

if present then
    lspsignature.setup {
        fix_pos = true,
        hint_prefix = " ",
        handler_opts = {
            border = "single" -- double, single, shadow, none
        }
    }
end
