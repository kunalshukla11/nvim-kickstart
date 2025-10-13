return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim',
    },
    opts = {
      adapters = {
        anthropic = false,
        ollama = false,
      },
      strategies = {
        chat = {
          adapter = 'copilot',
          slash_commands = {
            ['file'] = {
              callback = 'strategies.chat.slash_commands.file',
              description = 'Select a file using Telescope',
              opts = {
                provider = 'telescope',
                contains_code = true,
                picker_opts = {
                  -- Hide common junk dirs
                  find_command = {
                    'fd',
                    '--type',
                    'f',
                    '--strip-cwd-prefix',
                    '--exclude',
                    '.git',
                    '--exclude',
                    'node_modules',
                    '--exclude',
                    'dist',
                    '--exclude',
                    'build',
                  },
                  file_ignore_patterns = { '%.git/', 'node_modules/', 'dist/', 'build/' },
                },
              },
            },
          },
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
