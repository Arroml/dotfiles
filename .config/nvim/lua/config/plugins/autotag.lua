return {
  'windwp/nvim-ts-autotag',
  dependencies = 'nvim-treesitter/nvim-treesitter',
  opts = {}, -- leer reicht für Default-Verhalten
  event = 'InsertEnter', -- lazy load
  config = function()
    require('nvim-ts-autotag').setup()
  end,
}
