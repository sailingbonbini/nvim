local ufo = require('ufo')

local M = {}

M.setup = function()
  ufo.setup({
    provider_selector = function(_,_,_)
      return {'treesitter', 'indent'}
    end
  })
end

return M
