vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- neovim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- list of plugins we still want or want to checkout:
-- * https://github.com/folke/trouble.nvim (code hints / warnings etc)

-- [[ user function to toggle diagnostics in a buffer ]]
vim.api.nvim_create_user_command("DiagnosticToggle", function()
    local config = vim.diagnostic.config
    local vt = config().virtual_text
    config {
        virtual_text = not vt,
        underline = not vt,
        signs = not vt,
    }
end, { desc = "toggle diagnostic" })

require('vars')
require('opts')
require('plugs')
require('keys')
