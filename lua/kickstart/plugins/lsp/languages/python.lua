return {
  --- Linting
  {
    'mfussenegger/nvim-lint',
    config = function()
      local lint = require 'plugins.linting.lint'
      lint.linters_by_ft.python = { 'pylint' }
    end,
    vim.keymap.set('n', '<leader>hw', function()
      print 'Hello, World! from Python config'
    end, { desc = 'Print Hello, World!' }),
  },
}
