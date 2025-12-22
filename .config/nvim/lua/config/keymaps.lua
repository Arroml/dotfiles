local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '<leader>e', function()
  require('mini.files').open(vim.fn.getcwd(), true)
end, opts)

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader><space>', ':b#<CR>', { desc = 'Letzter Buffer' })

map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<leader>na', '<cmd>NoiceAll<CR>', {
  desc = 'Noice: All Messages',
})
-- Noice: Dismiss all
vim.keymap.set('n', '<leader>nd', '<cmd>Noice dismiss<CR>', {
  desc = 'Noice: Dismiss Messages',
})

-- Noice: Last message
vim.keymap.set('n', '<leader>nl', '<cmd>Noice last<CR>', {
  desc = 'Noice: Last Message',
})

-- Noice: Errors only
vim.keymap.set('n', '<leader>ne', '<cmd>Noice errors<CR>', {
  desc = 'Noice: Error Messages',
})
-- Standard-mapping 's' löschen

vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Rename symbol' })
-- Toggle für Benachrichtigungen
local notify_muted = false
