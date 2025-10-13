return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken',
    opts = {
      -- See Configuration section for options
      vim.keymap.set('n', '<leader>ccp', '<cmd>CopilotChat<cr>', { desc = 'Open Copilot Chat' }),
    },
  },
}
