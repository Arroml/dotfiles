return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000, -- MUSS hoch sein
  config = function()
    -- 1. Gruvbox konfigurieren
    require('gruvbox').setup {
      contrast = 'soft', -- "", "soft", "hard"
      transparent_mode = true, -- wichtig für dein Problem
    }

    -- 2. Colorscheme setzen
    vim.cmd 'colorscheme gruvbox'

    -- 3. Theme-FIXES (NACH colorscheme!)
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'PmenuSel', { link = 'Visual' })
  end,
}
