return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      open_mapping = [[<leader>t]],
      direction = 'float',
      float_opts = {
        border = 'curved', -- schöner Rahmen
      },
      start_in_insert = true, -- direkt tippbar
      shell = vim.o.shell, -- deine Shell (bash, zsh etc.)
    }
  end,
}
