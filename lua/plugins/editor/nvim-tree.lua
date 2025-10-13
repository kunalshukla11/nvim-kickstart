return {
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    },
    keys = {
      { '<leader>ee', '<cmd>NvimTreeToggle<cr>', desc = 'Open Explorer' },
      { '<leader>ef', '<cmd>NvimTreeFindFileToggle<CR>', desc = 'Toggle file explorer on current file' },
      { '<leader>ec', '<cmd>NvimTreeCollapse<CR>', desc = 'Collapse file explorer' },
      { '<leader>er', '<cmd>NvimTreeRefresh<CR>', desc = 'Refresh file explorer' },
    },
    opts = {
      reload_on_bufenter = true,
      hijack_cursor = true,
      hijack_netrw = true,
      sync_root_with_cwd = true,
      hijack_unnamed_buffer_when_opening = true,
      auto_reload_on_write = true,
      diagnostics = {
        enable = false,
      },
      hijack_directories = {
        enable = true,
        auto_open = true,
      },
      actions = {
        open_file = {
          quit_on_open = true,
          resize_window = true,
        },
      },
      update_focused_file = {
        enable = true,
      },
      view = {
        centralize_selection = true,
        adaptive_size = false,
        side = 'left',
        preserve_window_proportions = true,
        width = 40,
        relativenumber = true,
      },
      renderer = {
        full_name = false,
        indent_markers = {
          enable = false,
        },
        root_folder_label = ':t',
        highlight_git = true,
        icons = {
          glyphs = {
            folder = {
              arrow_closed = '',
              arrow_open = '',
              default = '',
              open = '',
              empty = '',
              empty_open = '',
              symlink = '',
              symlink_open = '',
            },
          },
        },
      },
      filters = {
        dotfiles = false,
        git_ignored = false,
        git_clean = false,
        no_buffer = false,
      },
      git = {
        enable = true,
        ignore = false,
        timeout = 400,
      },
    },
    config = function(_, opts)
      local nvimtree = require 'nvim-tree'

      local function keybindings(bufnr)
        local api = require 'nvim-tree.api'

        local function ops(desc)
          return {
            desc = 'nvim-tree: ' .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)
      end

      opts.on_attach = keybindings

      nvimtree.setup(opts)

      local function open_tree_on_setup(args)
        vim.schedule(function()
          local file = args.file
          local buf_name = vim.api.nvim_buf_get_name(0)
          local is_no_name_buffer = buf_name == '' and vim.bo.filetype == '' and vim.bo.buftype == ''
          local is_directory = vim.fn.isdirectory(file) == 1

          if not is_no_name_buffer and not is_directory then
            return
          end

          if is_directory then
            vim.cmd.cd(file)
          end

          require('nvim-tree.api').tree.open()
        end)
      end

      vim.api.nvim_create_autocmd('BufEnter', {
        group = vim.api.nvim_create_augroup('nvim-tree', { clear = true }),
        callback = open_tree_on_setup,
      })
    end,
  },
  {
    'antosha417/nvim-lsp-file-operations',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = true,
  },
}
