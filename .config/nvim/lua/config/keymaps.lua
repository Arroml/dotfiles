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
vim.keymap.set('n', '<M-j>', '<cmd>cnext<CR>', { silent = true })
vim.keymap.set('n', '<M-k>', '<cmd>cprev<CR>', { silent = true })

vim.keymap.set('n', '<leader>a', 'ggVG"+y<C-o>', {
  desc = 'Copy entire buffer (visual)',
})
vim.keymap.set('n', '<leader>v', function()
  local top = vim.fn.line 'w0' -- oberste sichtbare Zeile
  local bot = vim.fn.line 'w$' -- unterste sichtbare Zeile
  vim.cmd(string.format('%d,%dy+', top, bot))
end, { desc = 'Copy visible window area' })

vim.keymap.set({ 'n', 'v' }, 'x', '"_x')
vim.keymap.set({ 'n', 'v' }, 'c', '"_c')
vim.keymap.set('x', 'p', '"_dP')
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    vim.keymap.set('n', 'q', '<cmd>cclose<CR>', { buffer = true, silent = true })
  end,
})
vim.keymap.set('n', ',', ':', { noremap = true })
