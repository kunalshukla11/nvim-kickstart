return {
  -- Linting
  {
    'mfussenegger/nvim-lint',
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft.javascript = { 'eslint_d' }
      lint.linters_by_ft.typescript = { 'eslint_d' }
      lint.linters_by_ft.javascriptreact = { 'eslint_d' }
      lint.linters_by_ft.typescriptreact = { 'eslint_d' }
      lint.linters_by_ft.svelte = { 'eslint_d' }
    end,
  },
  -- Formatting (example)
  -- {
  --   'stevearc/conform.nvim',
  --   config = function()
  --     local conform = require('conform')
  --     conform.formatters_by_ft.javascript = { 'prettier' }
  --     conform.formatters_by_ft.typescript = { 'prettier' }
  --     conform.formatters_by_ft.javascriptreact = { 'prettier' }
  --     conform.formatters_by_ft.typescriptreact = { 'prettier' }
  --     conform.formatters_by_ft.svelte = { 'prettier' }
  --   end,
  -- },
  -- LSP (example)
  -- {
  --   'neovim/nvim-lspconfig',
  --   config = function()
  --     require('lspconfig').tsserver.setup {}
  --   end,
  -- },
  -- Mason (example)
  -- {
  --   'williamboman/mason.nvim',
  --   config = function()
  --     require('mason').setup()
  --     require('mason-tool-installer').setup {
  --       ensure_installed = { 'eslint_d', 'prettier', 'typescript-language-server' }
  --     }
  --   end,
  -- },
  -- -- Completion (example)
  -- Add nvim-cmp config here if needed
  --  Add ad keymap for hello world using <leader>hw
}
