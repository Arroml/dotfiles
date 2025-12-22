return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    require('lualine').setup {
      options = {
        theme = 'gruvbox',
        icons_enabled = true,
        component_separators = { left = '│', right = '│' },
        section_separators = { left = '', right = '' },
      },

      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },

        -- Datei + Pfad
        lualine_c = {
          { 'filename', path = 1 },
        },

        lualine_x = { 'encoding', 'fileformat', 'filetype' },

        -- Git + Position + Scrollbar
        lualine_y = {
          'progress', -- z. B. 45%
          'location', -- Zeile, Spalte
        },

        -- coole Scrollbar (Plugins unten empfohlen)
        lualine_z = {
          function()
            return require('scrollbar.statusline').scrollbar()
          end,
        },
      },
    }
  end,
}
