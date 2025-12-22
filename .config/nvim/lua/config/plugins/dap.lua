return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'rcarriga/nvim-dap-ui',
      'mfussenegger/nvim-dap-python',
      'theHamsta/nvim-dap-virtual-text',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'
      local dap_python = require 'dap-python'

      -- UI setup
      dapui.setup()
      require('nvim-dap-virtual-text').setup {
        commented = true,
      }
      require('dap').configurations.python = {

        {
          type = 'python',
          request = 'attach',
          name = 'Attach to FastAPI',
          connect = { host = '127.0.0.1', port = 5678 },
        },
      }

      -- Python debugger
      dap_python.setup 'python3'

      -- Signs
      vim.fn.sign_define('DapBreakpoint', {
        text = '',
        texthl = 'DiagnosticSignError',
      })
      vim.fn.sign_define('DapBreakpointRejected', {
        text = '',
        texthl = 'DiagnosticSignError',
      })
      vim.fn.sign_define('DapStopped', {
        text = '',
        texthl = 'DiagnosticSignWarn',
        linehl = 'Visual',
        numhl = 'DiagnosticSignWarn',
      })

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end

      -- Keymaps
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
      vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Continue / Start Debug' })
      vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'Step Over' })
      vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Step Into' })
      vim.keymap.set('n', '<leader>dO', dap.step_out, { desc = 'Step Out' })
      vim.keymap.set('n', '<leader>dq', dap.terminate, { desc = 'Terminate Debugging' })
      vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'Toggle DAP UI' })
    end,
  },
}
