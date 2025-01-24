return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require "dap"
      local dapgo = require "dap-go"
      local dapui = require "dapui"

      require("dapui").setup(
      ---@diagnostic disable-next-line: missing-fields
        {
          layouts = {
            {
              elements = {
                -- Elements can be strings or table with id and size keys.
                "scopes",
                { id = "breakpoints", size = 0.1 },
                -- "stacks",
                -- "watches",
                -- { id = "watches", size = 0. },
              },
              size = 40, -- 40 columns
              position = "left",
            },
            -- {
            --   elements = {
            --     -- "repl",
            --     -- "console",
            --   },
            --   size = 0.25, -- 25% of total lines
            --   position = "bottom",
            -- },
          },
        }
      )
      require("dap-go").setup()
      require("nvim-dap-virtual-text").setup {
        enabled = true,
        display_callback = function(variable, _, _, _, options)
          -- by default, strip out new line characters
          local truncated_value = variable.value:gsub('%s+', ' ')
          -- truncate the number of chararcters per value
          local max_display_length = 50
          if #truncated_value > max_display_length then
            truncated_value = truncated_value:sub(1, max_display_length) .. '...'
          end
          if options.virt_text_pos == 'inline' then
            return ' = ' .. truncated_value
          else
            return variable.name .. ' = ' .. truncated_value
          end
        end,
      }

      vim.keymap.set("n", "<F1>", dap.continue)
      vim.keymap.set("n", "<F2>", dap.step_into)
      vim.keymap.set("n", "<F3>", dap.step_over)
      vim.keymap.set("n", "<F4>", dap.step_out)
      vim.keymap.set("n", "<F5>", dap.terminate)
      -- Eval var under cursor
      vim.keymap.set("n", "<F6>", function()
        ---@diagnostic disable-next-line: missing-fields
        require("dapui").eval(nil, { enter = true })
      end)


      vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
      vim.keymap.set("n", "<leader>B", function()
        dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end)
      vim.keymap.set("n", "<leader>C", dap.clear_breakpoints)
      vim.keymap.set("n", '<leader>dl', dap.run_last, { desc = "[d]ap run [l]ast" })
      vim.keymap.set("n", "<leader>dc", dap.run_to_cursor, { desc = "[d]ap run to [c]ursor" })
      vim.keymap.set("n", "<leader>dt", dapgo.debug_test, { desc = "[d]ebug go [t]est" })

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
}
