local adapters = {'lldb'}

for _, adapter in ipairs(adapters) do
  require("custom.plugins.daps." .. adapter)
end

local function dap_mappings()
   vim.api.nvim_set_keymap("n", "<Leader>r", '<Cmd>lua require"dap".repl.toggle()<CR>', {
      silent = true,
      noremap = true,
   })
   vim.api.nvim_set_keymap("n", "<Leader>d", '<Cmd>lua require"dapui".toggle()<CR>', {
      silent = true,
      noremap = true,
   })
   vim.api.nvim_set_keymap("n", "<C-b>", '<Cmd>lua require"dap".toggle_breakpoint()<CR>', {
      silent = true,
      noremap = true,
   })
   vim.api.nvim_set_keymap("n", "<C-c>", '<Cmd>:lua require"dap".continue()<CR>',{
      silent = true,
      noremap = true,
   })
   vim.api.nvim_set_keymap("n", "<C-s>", '<Cmd>lua require"dap".step_over()<CR>', {
      silent = true,
      noremap = true,
   })
   vim.api.nvim_set_keymap("n", "<C-S>", '<Cmd>lua require"dap".step_into()<CR>', {
      silent = true,
      noremap = true,
   })
end

dap_mappings()
