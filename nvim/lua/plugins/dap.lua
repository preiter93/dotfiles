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
                { id = "breakpoints", size = 0.2 },
                "scopes",
                "watches",
              },
              size = 50, -- 40 columns
              position = "left",
            },
            {
              elements = {
                -- "console",
                "stacks",
                "repl",
              },
              size = 0.30,
              position = "bottom",
            },
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

      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "[d]ap [c]ontinue" })
      vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "[d]ap step [i]nto" })
      vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "[d]ap step [o]ver" })
      vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "[d]ap step o[u]t" })
      vim.keymap.set("n", "<leader>dx", dap.terminate, { desc = "[d]ap e[x]it" })
      vim.keymap.set("n", "<leader>de", function()
        ---@diagnostic disable-next-line: missing-fields
        require("dapui").eval(nil, { enter = true })
      end, { desc = "[d]ap [e]val under cursor" })


      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "[d]ap toggle [b]reakpoint" })
      vim.keymap.set("n", "<leader>dB", dap.clear_breakpoints, { desc = "[d]ap clean [B]reakpoints" })
      vim.keymap.set("n", "<leader>dh", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
        { desc = "[d]ap breakpoint condition" })
      vim.keymap.set("n", '<leader>dl', dap.run_last, { desc = "[d]ap run [l]ast" })
      vim.keymap.set("n", "<leader>dr", dap.run_to_cursor, { desc = "[d]ap [r]un to cursor" })
      vim.keymap.set("n", "<leader>dgt", dapgo.debug_test, { desc = "[d]ebug [g]o [t]est" })

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
