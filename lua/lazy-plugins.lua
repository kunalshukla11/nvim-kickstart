-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
  --

  -- modular approach: using `require 'path.name'` will
  -- include a plugin definition from file lua/path/name.lua

  -- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  require 'plugins.coding.autopairs',
  require 'plugins.coding.nvim-cmp',
  require 'plugins.coding.lspconfig',
  require 'plugins.coding.todo-comments',
  require 'plugins.coding.treesitter',
  require 'plugins.coding.trouble',

  require 'plugins.dap.core',

  require 'plugins.editor.nvim-tree',
  require 'plugins.editor.gitsigns',
  require 'plugins.editor.grug-far',
  -- require 'plugins.editor.hardtime',
  require 'plugins.editor.lualine',
  require 'plugins.editor.mini',
  require 'plugins.editor.overseer',
  require 'plugins.editor.ufo',
  require 'plugins.editor.which-key',
  require 'plugins.editor.comment',
  require 'plugins.editor.indent_line',
  require 'plugins.editor.neo-git',
  require 'plugins.editor.telescope',

  require 'plugins.formatting.conform',

  require 'plugins.linting.core',

  require 'plugins.test.core',

  require 'plugins.ui.tokyonight',
  -- require 'plugins.ui.dracula',
  require 'plugins.ui.noice',

  require 'plugins.util.mini-hipatterns',
  require 'plugins.util.tmux-navigator',
  require 'plugins.util.auto-session',
  require 'plugins.util.vim-maximizer',
  require 'plugins.util.substitue',

  require 'plugins.ai.copilot',
  require 'plugins.ai.code-companion',

  require 'plugins.languages.docker',
  require 'plugins.languages.markdown',
  require 'plugins.languages.python',
  require 'plugins.languages.typescript',
  require 'plugins.languages.typescriptDebug',

  --Commonly used lsp plugins

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  -- { import = 'custom.plugins' },
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
require('custom.floating_terminal').setup()
require('custom.tabs').setup()

-- vim: ts=2 sts=2 sw=2 et
