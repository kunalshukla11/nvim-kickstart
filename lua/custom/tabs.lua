local M = {}

local function open_file_in_tab()
  vim.ui.input({ prompt = 'File to open in new tab: ', completion = 'file' }, function(input)
    if input and input ~= '' then
      vim.cmd('tabnew ' .. input)
    end
  end)
end

local function duplicate_tab()
  local current_file = vim.fn.expand '%:p'
  if current_file ~= '' then
    vim.cmd('tabnew ' .. current_file)
  else
    vim.cmd 'tabnew'
  end
end

local function close_tabs_right()
  local current_tab = vim.fn.tabpagenr()
  local last_tab = vim.fn.tabpagenr '$'
  for i = last_tab, current_tab + 1, -1 do
    vim.cmd(i .. 'tabclose')
  end
end

local function close_tabs_left()
  local current_tab = vim.fn.tabpagenr()
  for i = current_tab - 1, 1, -1 do
    vim.cmd '1tabclose'
  end
end

local function smart_close_buffer()
  local buffers_in_tab = #vim.fn.tabpagebuflist()
  if buffers_in_tab > 1 then
    vim.cmd 'bdelete'
  else
    vim.cmd 'tabclose'
  end
end

function M.setup()
  vim.opt.showtabline = 1
  vim.opt.tabline = ''
  vim.cmd [[ hi TabLineFill guibg=NONE ctermfg=242 ctermbg=NONE ]]

  vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { desc = 'New tab' })
  vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', { desc = 'Close tab' })
  vim.keymap.set('n', '<leader>tm', ':tabmove<CR>', { desc = 'Move tab' })
  vim.keymap.set('n', '<leader>t>', ':tabmove +1<CR>', { desc = 'Move tab right' })
  vim.keymap.set('n', '<leader>t<', ':tabmove -1<CR>', { desc = 'Move tab left' })
  vim.keymap.set('n', '<leader>tO', open_file_in_tab, { desc = 'Open file in new tab' })
  vim.keymap.set('n', '<leader>td', duplicate_tab, { desc = 'Duplicate current tab' })
  vim.keymap.set('n', '<leader>tr', close_tabs_right, { desc = 'Close tabs to the right' })
  vim.keymap.set('n', '<leader>tL', close_tabs_left, { desc = 'Close tabs to the left' })
end

return M
