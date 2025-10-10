local M = {}

function M.setup()
  require('kickstart.plugins.lsp.languages.javascript').setup()
  -- Add more languages here as needed
end

return M
