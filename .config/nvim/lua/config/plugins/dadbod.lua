return {
  -- Core DB Plugin
  {
    'tpope/vim-dadbod',
    lazy = true,
  },

  -- UI für Dadbod
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = { 'tpope/vim-dadbod' },
    cmd = { 'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DBUIFindBuffer' },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
    keys = {
      { '<leader>b', group = 'database' },
      { '<leader>bu', '<cmd>DBUIToggle<CR>', desc = 'Database UI' },
      { '<leader>ba', '<cmd>DBUIAddConnection<CR>', desc = 'Add DB Connection' },
      { '<leader>bf', '<cmd>DBUIFindBuffer<CR>', desc = 'Find DB Buffer' },
    },
  },
  -- Autocompletion (nvim-cmp)
  {
    'kristijanhusak/vim-dadbod-completion',
    dependencies = { 'tpope/vim-dadbod' },
    ft = { 'sql', 'mysql', 'plsql' },
  },
}
