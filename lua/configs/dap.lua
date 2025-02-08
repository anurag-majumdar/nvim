local dap = require("dap")

local js_based_languages = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
  "vue"
}

dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    -- 💀 Make sure to update this path to point to your installation
    args = {
      vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
      "${port}"
    },
  }
}

-- dap.adapters["pwa-node"] = {
--   type = "server",
--   host = "127.0.0.1",
--   port = 8123,
--   executable = {
--     command = "js-debug-adapter",
--   }
-- }

for _, language in ipairs(js_based_languages) do
  dap.configurations[language] = {
    -- Debug single nodejs files
    {
      type = "pwa-node",
      request = "launch",
      name = "NeoVim Launch JS file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      sourceMaps = true,
    },
    -- Debug nodejs process (make sure to add --inspect when you run the process)
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach to node proces",
      rootPath = "${workspaceFolder}",
      -- processId = require("dap.utils").pick_process,
      sourceMaps = true,
    },
  }
end

-- dap.configurations["javascript"] = {
--   {
--     type = "pwa-node",
--     request = "launch",
--     name = "Launch JS file",
--     program = "${file}",
--     cwd = "${workspaceFolder}",
--     runtimeExecutable = "node",
--   }
-- }
--
-- dap.configurations["typescript"] = {
--   {
--     type = "pwa-node",
--     request = "launch",
--     name = "Launch JS file",
--     program = "${file}",
--     cwd = "${workspaceFolder}",
--     runtimeExecutable = "node",
--     sourceMaps = true,
--   }
-- }
