return {
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      -- To allow other plugins to add linters to require('lint').linters_by_ft,
      -- instead set linters_by_ft like this:
      -- lint.linters_by_ft = lint.linters_by_ft or {}
      -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
      --
      -- However, note that this will enable a set of default linters,
      -- which will cause errors unless these tools are available:
      -- {
      --   dockerfile = { "hadolint" },
      --   ruby = { "ruby" },
      --   terraform = { "tflint" },
      -- }
      -- You can disable the default linters by setting their filetypes to nil:
      -- lint.linters_by_ft['clojure'] = nil
      lint.linters = lint.linters or {}

      lint.linters_by_ft = lint.linters_by_ft or {}
      lint.linters_by_ft['markdown'] = { 'markdownlint' }
      -- lint.linters_by_ft['javascript'] = { 'eslint' }
      -- lint.linters_by_ft['typescript'] = { 'eslint' }
      -- lint.linters_by_ft['javascriptreact'] = { 'eslint' }
      -- lint.linters_by_ft['typescriptreact'] = { 'eslint' }
      -- lint.linters_by_ft['svelte'] = { 'eslint' }

      local function has_file(files)
        for _, file in ipairs(files) do
          if vim.fn.filereadable(vim.fn.getcwd() .. '/' .. file) == 1 then
            return true
          end
        end
        return false
      end

      -- No JS linters configured - using ESLint LSP instead

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          if not vim.opt_local.modifiable:get() then
            return
          end

          local ft = vim.bo.filetype
          local js_like = {
            javascript = true,
            javascriptreact = true,
            typescript = true,
            ['typescript.tsx'] = true,
            typescriptreact = true,
            json = true,
          }
          --Just as placeholder for disabled JS linting
          -- No JS linting - using ESLint LSP instead.

          lint.try_lint(nil, { ignore_errors = true })
        end,
      })

      vim.keymap.set('n', '<leader>lf', function()
        lint.try_lint()
      end, { desc = 'Trigger linting for current file' })
    end,
  },
}
