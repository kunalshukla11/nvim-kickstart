return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      -- Format entire buffer
      {
        '<leader>fb',
        function()
          require('conform').format {
            async = true,
            lsp_format = 'fallback',
          }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
      -- Visual + Visual-line: format selection
      {
        '<leader>fs',
        function()
          require('conform').format {
            async = false,
            timeout_ms = 1000,
            lsp_format = 'fallback',
          }
        end,
        mode = { 'v', 'x', 'n' }, -- 'v' = characterwise visual, 'x' = visual-line mode
        desc = '[C]ode: [F]ormat selection',
      },
    },
    opts = function()
      local opts = {
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
        formatters_by_ft = {
          lua = { 'stylua' },
          php = { 'pint' },
          blade = { 'blade-formatter' },
        },
        -- formatters = {
        --   pint = {
        --     command = 'vendor/bin/pint',
        --     args = { '$FILENAME' },
        --     stdin = false,
        --   },
        -- },
      }

      opts.format_after_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat or disable_filetypes[vim.bo[bufnr].filetype] then
          return
        end

        local filetype = vim.bo[bufnr].filetype
        local prettier_supported = {
          javascript = true,
          javascriptreact = true,
          typescript = true,
          typescriptreact = true,
          json = true,
          jsonc = true,
          css = true,
          graphql = true,
          handlebars = true,
          markdown = true,
          html = true,
          less = true,
          scss = true,
          vue = true,
          yaml = true,
        }

        if prettier_supported[filetype] then
          return {
            formatters = { 'prettier', 'prettierd' },
            timeout_ms = 2000,
          }
        end

        return { lsp_format = 'fallback' }
      end

      return opts
    end,
  },
}
