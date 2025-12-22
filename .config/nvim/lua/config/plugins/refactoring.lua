-- in deinem Plugin-Setup
return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('refactoring').setup {}
    -- Beispiel-Keymappings
    vim.keymap.set('v', '<leader>ce', ':Refactor extract<CR>')
    vim.keymap.set('v', '<leader>cf', ':Refactor extract_to_file<CR>')
  end,
}
