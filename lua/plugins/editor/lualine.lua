-- return {
--   'nvim-lualine/lualine.nvim',
--   dependencies = { 'nvim-tree/nvim-web-devicons' },
--   config = function()
--     local lualine = require 'lualine'
--     local lazy_status = require 'lazy.status'
--
--     local colors = {
--       blue = '#65D1FF',
--       green = '#3EFFDC',
--       violet = '#FF61EF',
--       yellow = '#FFDA7B',
--       red = '#FF4A4A',
--       fg = '#c3ccdc',
--       bg = '#112638',
--       inactive_bg = '#2c3043',
--       semilightgray = '#9ca3af',
--     }
--
--     local my_lualine_theme = {
--       normal = {
--         a = { bg = colors.blue, fg = colors.bg, gui = 'bold' },
--         b = { bg = colors.bg, fg = colors.fg },
--         c = { bg = colors.bg, fg = colors.fg },
--       },
--       insert = {
--         a = { bg = colors.green, fg = colors.bg, gui = 'bold' },
--         b = { bg = colors.bg, fg = colors.fg },
--         c = { bg = colors.bg, fg = colors.fg },
--       },
--       visual = {
--         a = { bg = colors.violet, fg = colors.bg, gui = 'bold' },
--         b = { bg = colors.bg, fg = colors.fg },
--         c = { bg = colors.bg, fg = colors.fg },
--       },
--       command = {
--         a = { bg = colors.yellow, fg = colors.bg, gui = 'bold' },
--         b = { bg = colors.bg, fg = colors.fg },
--         c = { bg = colors.bg, fg = colors.fg },
--       },
--       replace = {
--         a = { bg = colors.red, fg = colors.bg, gui = 'bold' },
--         b = { bg = colors.bg, fg = colors.fg },
--         c = { bg = colors.bg, fg = colors.fg },
--       },
--       inactive = {
--         a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = 'bold' },
--         b = { bg = colors.inactive_bg, fg = colors.semilightgray },
--         c = { bg = colors.inactive_bg, fg = colors.semilightgray },
--       },
--     }
--
--     lualine.setup {
--       options = {
--         theme = my_lualine_theme,
--         component_separators = { left = '', right = '' },
--         section_separators = { left = '', right = '' },
--         globalstatus = true,
--       },
--       sections = {
--         lualine_a = { 'mode' },
--
--         -- 🧠 Only branch info here
--         lualine_b = {
--           { 'branch', icon = '' },
--         },
--
--         -- 🗂️ Smart shortened unique file path
--         lualine_c = {
--           {
--             'filename',
--             path = 3, -- unique part of path
--             shorting_target = 40, -- shorten if long
--             symbols = {
--               modified = ' ',
--               readonly = ' ',
--               unnamed = '[No Name]',
--             },
--           },
--         },
--
--         lualine_x = {
--           {
--             lazy_status.updates,
--             cond = lazy_status.has_updates,
--             color = { fg = '#ff9e64' },
--           },
--           { 'encoding' },
--           { 'fileformat' },
--           { 'filetype' },
--         },
--         lualine_y = { 'progress' },
--         lualine_z = { 'location' },
--       },
--       inactive_sections = {
--         lualine_a = {},
--         lualine_b = {},
--         lualine_c = {
--           { 'filename', path = 1 },
--         },
--         lualine_x = { 'location' },
--         lualine_y = {},
--         lualine_z = {},
--       },
--     }
--   end,
-- }
return {
  {
    'SmiteshP/nvim-navic',
    lazy = true,
    config = function()
      vim.g.navic_silence = true
      local navic = require 'nvim-navic'

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.supports_method 'textDocument/documentSymbol' then
            navic.attach(client, args.buf)
          end
        end,
      })

      navic.setup {
        separator = ' ',
        highlight = true,
        depth_limit = 5,
        lazy_update_context = true,
      }
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'SmiteshP/nvim-navic' },
    config = function()
      local lualine = require 'lualine'
      local navic = require 'nvim-navic'

      local colors = {
        blue = '#65D1FF',
        green = '#3EFFDC',
        violet = '#FF61EF',
        yellow = '#FFDA7B',
        red = '#FF4A4A',
        fg = '#c3ccdc',
        bg = '#112638',
        inactive_bg = '#2c3043',
        semilightgray = '#9ca3af',
      }

      local my_lualine_theme = {
        normal = {
          a = { bg = colors.blue, fg = colors.bg, gui = 'bold' },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        insert = {
          a = { bg = colors.green, fg = colors.bg, gui = 'bold' },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        visual = {
          a = { bg = colors.violet, fg = colors.bg, gui = 'bold' },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        command = {
          a = { bg = colors.yellow, fg = colors.bg, gui = 'bold' },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        replace = {
          a = { bg = colors.red, fg = colors.bg, gui = 'bold' },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        inactive = {
          a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = 'bold' },
          b = { bg = colors.inactive_bg, fg = colors.semilightgray },
          c = { bg = colors.inactive_bg, fg = colors.semilightgray },
        },
      }

      lualine.setup {
        options = {
          theme = my_lualine_theme,
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          globalstatus = true,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { { 'branch', icon = '' } },
          lualine_c = {
            { 'filename', path = 3, shorting_target = 40 },
            {
              function()
                return navic.get_location()
              end,
              cond = function()
                return navic.is_available()
              end,
              color_correction = 'dynamic',
            },
          },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
      }
    end,
  },
}
