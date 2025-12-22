return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    indent = { char = '│' },
    scope = {
      enabled = true, -- ← wichtig für Linien über `{ ... }`
      show_start = true,
      show_end = true,
    },
  },
}
