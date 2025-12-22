return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    local list = harpoon:list()

    -- 🔹 Datei zur Harpoon-Liste hinzufügen
    vim.keymap.set({ 'n', 'i' }, '<leader>h', function()
      list:add()
      print '📌 Harpoon: Datei hinzugefügt'
    end, { desc = 'Harpoon hinzufügen' })

    vim.keymap.set('n', '<leader>1', function()
      list:select(1)
    end, { desc = 'Harpoon 1' })
    vim.keymap.set('n', '<leader>2', function()
      list:select(2)
    end, { desc = 'Harpoon 2' })
    vim.keymap.set('n', '<leader>3', function()
      list:select(3)
    end, { desc = 'Harpoon 3' })
    vim.keymap.set('n', '<leader>4', function()
      list:select(4)
    end, { desc = 'Harpoon 4' })
    -- 🔹 Übersicht anzeigen
    vim.keymap.set('n', '<leader>H', function()
      harpoon.ui:toggle_quick_menu(list)
    end, { desc = 'Harpoon: Menü öffnen' })
  end,
}
