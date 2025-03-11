local M = {}

M.setup = function()
  local status_col = require('statuscol')
  local builtin = require("statuscol.builtin")
  status_col.setup({
    -- configuration goes here, for example:
    relculright = false,
    segments = {
    { text = { builtin.foldfunc }},
    {
      sign = { namespace = { "diagnostic/signs" }, maxwidth=1, colwidth=1},
      click = "v:lua.ScSa"
    },
    { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
    {
      sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
        click = "v:lua.ScSa"
      },
    }
})

end


return M
