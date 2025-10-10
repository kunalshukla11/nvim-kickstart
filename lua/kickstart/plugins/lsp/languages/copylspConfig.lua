return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function()
    mason_lspconfig.setup_handlers {
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup {
          capabilities = capabilities,
        }
      end,
      ['graphql'] = function()
        -- configure graphql language server
        lspconfig['graphql'].setup {
          capabilities = capabilities,
          filetypes = { 'graphql', 'gql', 'svelte', 'typescriptreact', 'javascriptreact' },
        }
      end,
    }
  end,
}
