return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      local nt = require("neo-tree")
      nt.setup({
        event_handlers={
          {
            event = "file_opened",
            handler = function(arg)
            require("neo-tree.command").execute({action='close'})
            end,
          }}
      })
    end,
}
