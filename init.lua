-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = { 'git', 'clone', '--filter=blob:none', 'https://github.com/echasnovski/mini.nvim', mini_path }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' 
require('mini.deps').setup({ path = { package = path_package } })

-- Use 'mini.deps'. `now()` and `later()` are helpers for a safe two-stage
-- startup and are optional.
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- mini.statusline
now(function() require('mini.statusline').setup() end)

-- add treesitter
now(function() 
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    -- Use 'master' while monitoring updates in 'main'
    checkout = 'master',
    monitor = 'main',
    -- Perform action after every checkout
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
  })
  add({
    source = 'nvim-treesitter/playground'
  })
  require('treesitter').setup() 
end)

-- mini.git to display git diffs etc
later(function() require('mini.git').setup() end)

-- mini.diff for diffs
later(function() require('mini.diff').setup() end)

-- java lsp
now(function() add({ source = 'mfussenegger/nvim-jdtls'}) end)

-- nvim dap
now(function() add({ source = 'mfussenegger/nvim-dap'}) end)

-- mini.pick pickers
now(function() require('mini.pick').setup() end)

-- mini extra pickers
now(function() require('mini.extra').setup() end)

-- vim be good game
later(function() add({source = 'ThePrimeagen/vim-be-good'}) end)

-- for lua repl
later(function() add({source = 'ii14/neorepl.nvim'}) end)

-- undotree
later(function() add({source = 'mbbill/undotree'}) end)

-- [[set useful defaults]]
now(function() require('settings').setup() end)

-- set keys
now(function() require('keys').setup() end)

-- install mini.notify
now(function() require('notifications').setup() end)

-- mini.icons
now(function() require('mini.icons').setup() end)

-- set color scheme
now(function() require('colorscheme').setup() end)

-- mini files
now(function() require('files').setup() end)

-- mini completion
now(function()
  require('completion').setup()
end)

now(function()
  require('snippets').setup()
end)


