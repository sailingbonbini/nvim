local M = {}

M.setup = function()
  require('mini.notify').setup({
    lsp_progress = {
      -- Whether to enable showing
      enable = false,
      duration_last = 1000,
    }
  })
  vim.notify = require('mini.notify').make_notify()
end

return M


