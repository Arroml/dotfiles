-- ~/.config/nvim/lua/plugins/cmp.lua
return {
  -- Basis Completion Plugin
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- LSP Quelle
      'hrsh7th/cmp-buffer', -- Buffer-Worte
      'hrsh7th/cmp-path', -- Pfadvervollständigung
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip', -- Snippet Support
      'L3MON4D3/LuaSnip', -- Snippet Engine
      'kristijanhusak/vim-dadbod-completion',
    },
    config = function()
      vim.lsp.handlers['textDocument/hover'] = function() end
      local cmp = require 'cmp'
      -- Setup für Command-Line (:) Completion
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          { name = 'cmdline' },
        }),
      })

      -- Setup für Suche (/) und (?)
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })
      cmp.setup {
        snippet = {

          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<Up>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
          ['<Down>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
          ['<Tab>'] = cmp.mapping.confirm { select = true },
          ['<CR>'] = cmp.mapping.confirm { select = false },
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'vim-dadbod-completion' },
        },
        preselect = cmp.PreselectMode.Item, -- << Wichtig: erstes Item automatisch wählen
        completion = {
          completeopt = 'menu,menuone,noinsert', -- kein automatisches Einfügen, aber Auswahl sichtbar
        },
      }
    end,
  },
}
