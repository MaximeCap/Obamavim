return {
  {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
    dependencies = {
      "mxsdev/nvim-dap-vscode-js"
    },
    config = function()
      require('dap-vscode-js').setup({
          adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
      })

      local exts = {
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        -- using pwa-chrome
        "vue",
        "svelte",
      }


      local dap = require("dap")

      for i, ext in ipairs(exts) do
        dap.configurations[ext] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch Current File (pwa-node)",
            cwd = vim.fn.getcwd(),
            args = { "${file}" },
            sourceMaps = true,
            protocol = "inspector",
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch Current File (pwa-node with ts-node)",
            cwd = vim.fn.getcwd(),
            runtimeArgs = { "--loader", "ts-node/esm" },
            runtimeExecutable = "node",
            args = { "${file}" },
            sourceMaps = true,
            protocol = "inspector",
            skipFiles = { "<node_internals>/**", "node_modules/**" },
            resolveSourceMapLocations = {
              "${workspaceFolder}/**",
              "!**/node_modules/**",
            },
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch Current File (pwa-node with deno)",
            cwd = vim.fn.getcwd(),
            runtimeArgs = { "run", "--inspect-brk", "--allow-all", "${file}" },
            runtimeExecutable = "deno",
            attachSimplePort = 9229,
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch Test Current File (pwa-node with jest)",
            cwd = vim.fn.getcwd(),
            runtimeArgs = { "${workspaceFolder}/node_modules/.bin/jest" },
            runtimeExecutable = "node",
            args = { "${file}", "--coverage", "false" },
            rootPath = "${workspaceFolder}",
            sourceMaps = true,
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
            skipFiles = { "<node_internals>/**", "node_modules/**" },
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch Test Current File (pwa-node with vitest)",
            cwd = vim.fn.getcwd(),
            program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
            args = { "--inspect-brk", "--threads", "false", "run", "${file}" },
            autoAttachChildProcesses = true,
            smartStep = true,
            console = "integratedTerminal",
            skipFiles = { "<node_internals>/**", "node_modules/**" },
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch Test Current File (pwa-node with deno)",
            cwd = vim.fn.getcwd(),
            runtimeArgs = { "test", "--inspect-brk", "--allow-all", "${file}" },
            runtimeExecutable = "deno",
            attachSimplePort = 9229,
          },
          {
            type = "pwa-chrome",
            request = "attach",
            name = "Attach Program (pwa-chrome = { port: 9222 })",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            port = 9222,
            webRoot = "${workspaceFolder}",
          },
          {
            type = "node2",
            request = "attach",
            name = "Attach Program (Node2)",
            processId = require("dap.utils").pick_process,
          },
          {
            type = "node2",
            request = "attach",
            name = "Attach Program (Node2 with ts-node)",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            skipFiles = { "<node_internals>/**" },
            port = 9229,
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach Program (pwa-node)",
            cwd = vim.fn.getcwd(),
            processId = require("dap.utils").pick_process,
            skipFiles = { "<node_internals>/**" },
          },
        }
      end
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      vim.keymap.set("n", "<leader>dt", ":lua require('dapui').toggle()<CR>", { desc = "Toggle DAP ui" })
      vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>dc", ":DapContinue<CR>", { desc = "DAP continue" })
      vim.keymap.set("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", { desc = "Reset DAP ui" })

      require("dapui").setup()
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
  },
}
