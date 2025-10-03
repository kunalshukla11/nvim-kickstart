return {
  'github/copilot.vim',
  config = function()
    vim.keymap.set('i', '<C-g>', 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
    })
    vim.keymap.set('i', '<C-k>', '<Plug>(copilot-accept-word)')
    vim.keymap.set('i', '<C-l>', '<Plug>(copilot-accept-line)')
    vim.keymap.set('i', '<C-x>', '<Plug>(copilot-dismiss)')
    vim.keymap.set('i', '<M-]>', '<Plug>(copilot-next)')
    vim.keymap.set('i', '<M-[>', '<Plug>(copilot-previous)')
    vim.keymap.set('i', '<M-Bslash>', '<Plug>(copilot-suggest)')
  end,
}
