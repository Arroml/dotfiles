return {
  'jiaoshijie/undotree',
  keys = {
    { '<leader>u', "<cmd>lua require('undotree').toggle()<cr>", desc = 'Toggle UndoTree' },
  },
  config = function()
    local undotree = require 'undotree'

    undotree.setup {
      float_diff = true, -- WICHTIG
      layout = 'left_bottom',
      position = 'left',

      window = {
        winblend = 0,
        border = 'rounded',
      },

      keymaps = {
        j = 'move_next',
        k = 'move_prev',
        gj = 'move2parent',
        J = 'move_change_next',
        K = 'move_change_prev',
        ['<cr>'] = 'action_enter',
        p = 'enter_diffbuf', -- funktioniert jetzt!
        q = 'quit',
      },
    }

    -- dringend empfohlen
    vim.opt.undofile = true
  end,
}
