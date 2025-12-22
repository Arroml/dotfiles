return {
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('nvim-treesitter.configs').setup {
        textobjects = {

          -------------------------
          -- MOVE BETWEEN OBJECTS --
          -------------------------
          move = {
            enable = true,
            set_jumps = true, -- records movements in jumplist

            goto_next_start = {
              [']f'] = '@function.outer',
              [']c'] = '@class.outer',
            },
            goto_previous_start = {
              ['[f'] = '@function.outer',
              ['[c'] = '@class.outer',
            },
            goto_previous_end = {
              ['[F'] = '@function.outer',
              ['[C'] = '@class.outer',
            },
            goto_next_end = {
              [']F'] = '@function.outer',
              [']C'] = '@class.outer',
            },
          },

          ----------------------
          -- SELECT OBJECTS   --
          ----------------------
          select = {
            enable = true,
            lookahead = true, -- automatically jump forward to nearest textobject

            keymaps = {
              -- functions
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',

              -- classes
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
        },
      }
    end,
  },
}
