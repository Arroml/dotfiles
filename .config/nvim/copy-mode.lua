-- Nur aktiv, wenn aus tmux-copy gestartet
if vim.env.NVIM_COPYMODE ~= '1' then
  return
end

--------------------------------------------------
-- Basis-Settings (minimal & schnell)
--------------------------------------------------
vim.opt.buftype = 'nofile'
vim.opt.bufhidden = 'wipe'
vim.opt.swapfile = false

-- ZWINGEND: alles ins System-Clipboard
vim.opt.clipboard = 'unnamedplus'

--------------------------------------------------
-- flash.nvim laden (ohne Plugin-Manager)
--------------------------------------------------
local flash_path = vim.fn.stdpath 'data' .. '/lazy/flash.nvim'
if not vim.loop.fs_stat(flash_path) then
  vim.fn.system {
    'git',
    'clone',
    '--depth=1',
    'https://github.com/folke/flash.nvim.git',
    flash_path,
  }
end

vim.opt.rtp:prepend(flash_path)
require('flash').setup {}

--------------------------------------------------
-- ERZWINGE Clipboard-Yank (unabhängig vom Register)
--------------------------------------------------
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    -- explizit ins Clipboard schreiben
    local text = vim.fn.getreg '"'
    vim.fn.setreg('+', text)
    vim.fn.setreg('*', text)

    -- danach sofort schließen
    vim.schedule(function()
      vim.cmd 'qa!'
    end)
  end,
})

-- Beim Öffnen zuverlässig ans Ende springen (stdin wird teils später gefüllt)
vim.api.nvim_create_autocmd('BufEnter', {
  once = true,
  callback = function()
    vim.schedule(function()
      vim.cmd 'normal! G'
      vim.cmd 'normal! zz' -- optional: Cursor zentrieren
    end)
  end,
})

--------------------------------------------------
-- Flash-Shortcut
--------------------------------------------------
vim.keymap.set('n', 's', function()
  require('flash').jump()
end)

--------------------------------------------------
-- Optional: Esc = Abbrechen ohne Kopieren
--------------------------------------------------
vim.keymap.set('n', 'q', function()
  vim.cmd 'qa!'
end)
