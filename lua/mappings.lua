require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
-- local function mk_map(mode, lhs, rhs, opts, ctx)
--   if type(opts) == "string" then opts = { desc = opts, noremap = true } end
--
--   if type(mode) == "table" then
--     mode = table.concat(mode)
--   end
--
--   local chars = {}
--   for i = 1, #mode do
--     table.insert(chars, mode:sub(i, i))
--   end
--
--   return {
--     mode = chars,
--     lhs = lhs,
--     rhs = rhs,
--     opts = opts,
--     ctx = ctx
--   }
-- end
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

local dap = require("dap")
map("n", "<space>gb", dap.run_to_cursor, { desc = "Run to cursor" })

-- Eval var under cursor
map("n", "<space>?", function()
  require("dapui").eval(nil, { enter = true })
end, { desc = "Eval var under cursor" })
map("n", "<space>tb", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
map("n", "<F8>", dap.continue, { desc = "Run or continue the debugger" })
map("n", "<F2>", dap.step_into, { desc = "Step into" })
map("n", "<F3>", dap.step_over, { desc = "Step over" })
map("n", "<F4>", dap.step_out, { desc = "Step out" })
map("n", "<F5>", dap.step_back, { desc = "Step back" })
map("n", "<space>tr", dap.restart, { desc = "Restart debugger" })
