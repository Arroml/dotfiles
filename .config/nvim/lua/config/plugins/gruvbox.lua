return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = function()
    require('gruvbox').setup {
      contrast = 'medium', -- oder "medium" / "hard"
    }
    vim.cmd 'colorscheme gruvbox'
  end,
}
