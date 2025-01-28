local mini_pick = require('mini.pick')
local vim = vim

M ={}

M.config = { tagsfile = "tags"}

M.process_rg = function(lines)
  local items = {}
  for _, line in ipairs(lines) do
    -- Match the name, path, and line number from each line
    local name, path, line_number = line:match("^(%S+)%s+(%S+)%s+.-%s+%a+%s+line:(%d+)$")
    if name and path and line_number then
      table.insert(items, {
        text = name,
        path = path,
        lnum = line_number,
      })
    end
  end
  return items
end

-- Display a fuzzy picker for type definitions
M.pick_type_definitions = function()
  local tagsfile = "tags"
  local root_dir = vim.fs.dirname(vim.fs.find(tagsfile, { upward = true, })[1])

  local opts = {
    command = { "rg", "--no-line-number", [[^.*\t[ci]\t.*$]], root_dir .. "/" .. tagsfile},
    postprocess = M.process_rg,
    source = {name = "Open Type"}
  }

  mini_pick.builtin.cli(opts)
end


return M
