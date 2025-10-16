return {
  {
    'mfussenegger/nvim-dap',
    optional = true,
    dependencies = {
      {
        'williamboman/mason.nvim',
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          table.insert(opts.ensure_installed, 'js-debug-adapter')
        end,
      },
    },
    opts = function()
      local dap = require 'dap'

      -- dap.adapters.chrome = {
      --   type = 'executable',
      --   command = 'node',
      --   args = { os.getenv 'HOME' .. '/my/devTools/neovimExtraTools/vscode-chrome-debug/out/src/chromeDebug.js' }, -- TODO adjust
      -- }
      --
      -- dap.configurations.javascriptreact = { -- change this to javascript if needed
      --   {
      --     type = 'chrome',
      --     request = 'attach',
      --     program = '${file}',
      --     cwd = vim.fn.getcwd(),
      --     sourceMaps = true,
      --     protocol = 'inspector',
      --     port = 9222,
      --     webRoot = '${workspaceFolder}',
      --   },
      -- }
      --
      -- dap.configurations.typescriptreact = { -- change to typescript if needed
      --   {
      --     type = 'chrome',
      --     request = 'attach',
      --     program = '${file}',
      --     cwd = vim.fn.getcwd(),
      --     sourceMaps = true,
      --     protocol = 'inspector',
      --     port = 9222,
      --     webRoot = '${workspaceFolder}',
      --   },
      -- }

      if not dap.adapters['pwa-node'] then
        require('dap').adapters['pwa-node'] = {
          type = 'server',
          host = 'localhost',
          port = '${port}',
          executable = {
            command = 'node',
            args = {
              vim.env.MASON .. '/packages/' .. 'js-debug-adapter' .. '/js-debug/src/dapDebugServer.js',
              '${port}',
            },
          },
        }
      end
      if not dap.adapters['node'] then
        dap.adapters['node'] = function(cb, config)
          if config.type == 'node' then
            config.type = 'pwa-node'
          end
          local nativeAdapter = dap.adapters['pwa-node']
          if type(nativeAdapter) == 'function' then
            nativeAdapter(cb, config)
          else
            cb(nativeAdapter)
          end
        end
      end

      local js_filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' }

      local vscode = require 'dap.ext.vscode'
      vscode.type_to_filetypes['node'] = js_filetypes
      vscode.type_to_filetypes['pwa-node'] = js_filetypes

      for _, language in ipairs(js_filetypes) do
        if not dap.configurations[language] then
          dap.configurations[language] = {
            {
              type = 'pwa-node',
              request = 'launch',
              name = 'Launch file',
              program = '${file}',
              cwd = '${workspaceFolder}',
              sourceMaps = true,
              skipFiles = { '<node_internals>/**', 'node_modules/**' },
            },
            {
              type = 'pwa-node',
              request = 'attach',
              name = 'Attach',
              processId = require('dap.utils').pick_process,
              cwd = '${workspaceFolder}',
              sourceMaps = true,
              skipFiles = { '<node_internals>/**', 'node_modules/**' },
            },
          }
        end
      end
    end,
  },
}
