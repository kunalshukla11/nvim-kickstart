return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    -- import mason
    local mason = require 'mason'

    -- import mason-lspconfig
    local mason_lspconfig = require 'mason-lspconfig'

    local mason_tool_installer = require 'mason-tool-installer'

    -- enable mason and configure icons

    mason_lspconfig.setup {
      -- list of servers for mason to install
      ensure_installed = {
        'graphql',
      },
    }

    mason_tool_installer.setup {
      ensure_installed = {
        'isort', -- python formatter
        'black', -- python formatter
        'pylint', -- python linter
      },
    }

    -- automatically install ensure_installed servers
  end,
}
