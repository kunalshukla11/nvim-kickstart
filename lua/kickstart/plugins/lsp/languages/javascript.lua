local M = {}

function M.setup()
  local mason = require 'mason'
  local mason_lspconfig = require 'mason-lspconfig'
  local mason_tool_installer = require 'mason-tool-installer'
  local lspconfig = require 'lspconfig'
  local cmp_nvim_lsp = require 'cmp_nvim_lsp'

  -- Ensure LSP servers are installed
  mason_lspconfig.setup {
    ensure_installed = {
      'ts_ls', -- JavaScript/TypeScript
      'html', -- HTML
      'cssls', -- CSS (optional, often needed)
      'tailwindcss', -- Tailwind CSS (optional, often needed)
      'svelte', -- Svelte
      'emmet_ls', -- Emmet (optional, useful for web development)
      'prismals',
      'pyright',
    },
  }

  -- Ensure formatters/linters are installed
  mason_tool_installer.setup {
    ensure_installed = {
      'prettier', -- Formatter
      'eslint_d', -- JS/TS linter
    },
  }

  local capabilities = cmp_nvim_lsp.default_capabilities()

  mason_lspconfig.setup_handlers {
    -- Default handler for all servers
    function(server_name)
      if vim.tbl_contains({ 'tsserver', 'tailwindcss', 'html', 'cssls' }, server_name) then
        lspconfig[server_name].setup {
          capabilities = capabilities,
        }
      end
    end,
    -- Svelte special handler
    ['svelte'] = function()
      lspconfig['svelte'].setup {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd('BufWritePost', {
            pattern = { '*.js', '*.ts' },
            callback = function(ctx)
              client.notify('$/onDidChangeTsOrJsFile', { uri = ctx.match })
            end,
          })
        end,
      }
    end,
    ['emmet_ls'] = function()
      -- configure emmet language server
      lspconfig['emmet_ls'].setup {
        capabilities = capabilities,
        filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
      }
    end,
  }
end

return M
