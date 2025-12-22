return {
  'mbbill/undotree',
  keys = {
    { '<leader>u', '<cmd>UndotreeToggle<CR>', desc = 'Toggle UndoTree' },
  },
  config = function()
    vim.g.undotree_WindowLayout = 2 -- vertikale Darstellung rechts
    vim.g.undotree_SplitWidth = 40 -- Breite des Split-Fensters
    vim.g.undotree_SetFocusWhenToggle = 1
  end,
}
