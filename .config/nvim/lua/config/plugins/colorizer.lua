return {
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {
        '*', -- Alle Dateitypen
        css = {
          rgb_fn = true, -- aktiviert rgb(), rgba() usw.
        },
      }
    end,
  },
}
