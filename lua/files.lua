local M = {}

M.setup = function()
  require('mini.files').setup({
    mappings = {
      close = '<Esc>',          -- Close mini.files
      go_in = '<Right>',           -- Enter a directory or open a file
      go_out = '<Left>',          -- Go to the parent directory
      reset = '<C-r>',          -- Reset the current directory
      show_help = '?',         -- Show help for mini.files
    },
  })
end

return M


