return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      adapters = {
        anthropic = false,
        ollama = false,
      },
      strategies = {
        chat = {
          adapter = 'copilot',
        },
        inline = {
          adapter = 'copilot',
        },
      },
      window = {
        layout = 'float',
        width = 0.8,
        height = 0.6,
        border = 'rounded',
      },
    },
    keys = {
      {
        '<leader>cc',
        function()
          require('codecompanion').chat()
        end,
        desc = 'Open Code Companion chat',
      },
      {
        '<leader>ce',
        function()
          require('codecompanion').explain()
        end,
        desc = 'Explain code',
      },
      {
        '<leader>cf',
        function()
          require('codecompanion').fix()
        end,
        desc = 'Fix code issues',
      },
      {
        '<leader>ct',
        function()
          require('codecompanion').tests()
        end,
        desc = 'Generate tests',
      },
      {
        '<leader>cd',
        function()
          require('codecompanion').docs()
        end,
        desc = 'Generate documentation',
      },
    },
  },
}
