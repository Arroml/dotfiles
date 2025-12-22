return {
  'echasnovski/mini.nvim',
  config = function()
    -- Setup-Aufrufe
    require('mini.ai').setup { n_lines = 500 }
    require('mini.files').setup {
      mappings = {
        close = 'q',
        go_in = 'l',
        go_in_plus = 'l', -- ENTER öffnet Datei
        go_out = 'h',
        go_out_plus = 'H',
        reset = '<BS>',
        reveal_cwd = '@',
        show_help = 'g?',
        synchronize = 's', -- mit s statt =
        trim_left = '<',
        trim_right = '>',
      },
      options = {
        permanent_delete = false,
        use_as_default_explorer = true,
      },
      windows = {
        preview = true,
        width_focus = 50,
        width_preview = 60,
      },
    }

    -- Keymap zum Öffnen: <leader>e
    vim.keymap.set('n', '<leader>e', function()
      require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
    end, { desc = 'Mini Files öffnen' })

    local statusline = require 'mini.statusline'
  end,
}
