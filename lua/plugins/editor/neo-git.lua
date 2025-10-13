return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- Required
      'sindrets/diffview.nvim', -- Optional: for diff views
      'nvim-telescope/telescope.nvim', -- Optional: telescope integration
    },
    config = function()
      local neogit = require 'neogit'
      neogit.setup {
        signs = {
          section = { '', '' },
          item = { '', '' },
          hunk = { '', '' },
        },
        integrations = {
          diffview = true, -- Enable diffview integration
          telescope = true, -- Telescope support
        },
      }

      -- Keymaps
      vim.keymap.set('n', '<leader>gs', ':Neogit<CR>', { desc = 'Open Neogit' })
      vim.keymap.set('n', '<leader>gc', function()
        neogit.open { 'commit' }
      end, { desc = 'Commit (Neogit)' })
    end,
  },
}
