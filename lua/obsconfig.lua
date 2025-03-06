local obs = require('obsidian')

local M = {}


M.setup = function()
  obs.setup({
    workspaces = {
      {
        name="vault",
        path="~/obsidian-vault",
      },
    },
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "Daily Notes",
    -- Optional, if you want to change the date format for the ID of daily notes.
    date_format = "%Y-%m-%d",
    default_tags = { "daily-notes" },
    },
    picker = {
      name="mini.pick",
    },
  })
end

return M
