local M = {}

local nl = function(suffix, rhs, desc)
  vim.keymap.set('n', '<Leader>' .. suffix, rhs, { desc = desc, noremap = true, silent = true })
end

local il = function(lhs, rhs, desc)
  vim.keymap.set('i', lhs, rhs, { desc = desc })
end

local tl = function(lhs, rhs, desc)
  vim.keymap.set('t', lhs, rhs, { desc = desc })
end



local xl = function(suffix, rhs, desc)
  vim.keymap.set('x', '<Leader>' .. suffix, rhs, { desc = desc })
end

-- global mappings
local global_mappings = function()
  vim.g.mapleader = " "   -- Set space as the leader key
  vim.g.maplocalleader = " " -- Optionally set space as the local leader key
  -- global mappings
  nl('<Right>', '<Cmd>bnext<CR>', 'Next buffer' )
  nl('<Left>', '<Cmd>:bprevious<CR>', 'Previous buffer' )
  nl(':', '<Cmd>lua MiniExtra.pickers.commands({}, {})<CR>', 'Pick commands' )
  nl('%', '<Cmd>:source %<CR>', 'Source current buffer' )
  nl('d', '<Cmd>lua MiniExtra.pickers.diagnostic({},{})<CR>', 'Pick diagnostics' )
  nl('u', vim.cmd.UndotreeToggle, 'Toggle undo tree' )

  --
  tl('<Esc>','<C-\\><C-n>', 'Escape terminal mode')
  --
  -- make C-d scroll down half a page and set the cursor in the middle row
  vim.keymap.set('n', '<C-d>', '<C-d>zz')
  -- make C-u scroll up half a page and set the cursor in the middle row
  vim.keymap.set('n', '<C-u>', '<C-u>zz')

end

-- buffer mappings
local buffer_mappings = function()
  nl('bb', '<Cmd>lua MiniPick.builtin.buffers()<CR>', 'Switch buffers' )
  nl('bd', '<Cmd>:bdelete<CR>', 'Delete buffer' )
  nl('bD', '<Cmd>:bdelete!<CR>', 'Force delete buffer')
  nl('bl', '<Cmd>:b#<CR>', 'Last buffer')
  nl('bL', '<Cmd>:ls<CR>', 'List all buffers')
  nl('bS', '<Cmd>:wa<CR>', 'Save all buffers')
  nl('bo', '<Cmd>:%bd|e#<CR>', 'Close all except current buffer')
  nl('bn', '<Cmd>:enew<CR>', 'New empty buffer')
  nl('br', '<Cmd>:e!<CR>', 'Reload current buffer')
  nl('bv', '<Cmd>:vsplit<CR>', 'Open buffer in vertical split')
  nl('bh', '<Cmd>:split<CR>', 'Open buffer in horizontal split')
end

-- Code mappings
local code_mappings = function()
  nl("cc", "<Cmd>lua require('codesearch').pick_type_definitions()<CR>", "Find class") -- find class
  nl('cd', '<Cmd>lua vim.lsp.buf.definition()<CR>', 'Go to definition') -- Go to definition
  nl('cD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', 'Go to declaration') -- Go to declaration
  nl('ch', '<Cmd>lua vim.lsp.buf.hover()<CR>', 'Hover documentation') -- Hover documentation
  nl('ci', '<Cmd>lua vim.lsp.buf.implementation()<CR>', 'Go to implementation') -- Go to implementation
  nl('ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', 'Code action') -- Code action
  nl('cf', '<Cmd>lua vim.lsp.buf.format({ async = true })<CR>', 'Format document') -- Format document
  nl('co', "<Cmd>lua MiniExtra.pickers.lsp({ scope = 'document_symbol'}) <CR>", 'Show outline') -- Show outline
  nl('cs', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', 'Show signature help') -- Show signature help
  nl('ct', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', 'Go to type definition') -- Go to type definition
  nl('cn', '<Cmd>lua vim.lsp.buf.rename()<CR>', 'Rename symbol') -- Rename symbol
  nl('cpd', function()
    local_opts = {
      scope = "definition"
    }
    opts={}
    MiniExtra.pickers.lsp(local_opts, opts)
  end, 'Pick definitions' )
  nl('cpD', function()
    local_opts = {
      scope = "declaration"
    }
    opts={}
    MiniExtra.pickers.lsp(local_opts, opts)
  end, 'Pick declarations' )
  nl('cps', function()
    local_opts = {
      scope = "document_symbol"
    }
    opts={}
    MiniExtra.pickers.lsp(local_opts, opts)
  end, 'Pick document symbol' )
  nl('cpi', function()
    local_opts = {
      scope = "implementation"
    }
    opts={}
    MiniExtra.pickers.lsp(local_opts, opts)
  end, 'Pick implementation' )
  nl('cpr', function()
    local_opts = {
      scope = "references"
    }
    opts={}
    MiniExtra.pickers.lsp(local_opts, opts)
  end, 'Pick references' )
  nl('cpt', function()
    local_opts = {
      scope = "type_definition"
    }
    opts={}
    MiniExtra.pickers.explorer(local_opts, opts)
  end, 'Pick type definition' )
  nl('cpw', function()
    local_opts = {
      scope = "workspace_symbol"
    }
    opts={}
    MiniExtra.pickers.lsp(local_opts, opts)
  end, 'Pick workspace symbol' )
end

-- File mappings
local file_mappings = function()
  nl('fe', '<Cmd>lua require(\'mini.files\').open()<CR>', 'Explore' )
  nl('fh', function()
    opts= { source = { cwd = "/Users/tom/" } }
    MiniPick.builtin.files(opts, opts)
  end, 'Home directory' )
  nl('fp', function()
    local_opts = {
      cwd = vim.fn.expand('~/projects')
    }
    opts={}
    MiniPick.builtin.files(local_opts, opts)
  end, 'Home directory' )
  nl('fr', function()
    local_opts = {}
    opts={}
    MiniExtra.pickers.oldfiles(local_opts, opts)
  end, 'Recent files' )
  nl('ff', '<Cmd>lua MiniPick.builtin.files()<CR>', 'File picker')

end

--window mappings
local window_mappings = function()
  nl('wd', '<Cmd>:close<CR>', 'Close current window') -- Close current window
  nl('w-', '<Cmd>:split<CR>', 'Split window horizontally') -- Split window horizontally
  nl('w/', '<Cmd>:vsplit<CR>', 'Split window vertically') -- Split window vertically
  nl('wn', '<Cmd>:wincmd w<CR>', 'Navigate to next window') -- Navigate to next window
  nl('wp', '<Cmd>:wincmd W<CR>', 'Navigate to previous window') -- Navigate to previous window
  nl('w<Left>', '<Cmd>:wincmd h<CR>', 'Move to left window') -- Move to left window
  nl('w<Right>', '<Cmd>:wincmd l<CR>', 'Move to right window') -- Move to right window
  nl('w<Up>', '<Cmd>:wincmd k<CR>', 'Move to top window') -- Move to top window
  nl('w<Down>', '<Cmd>:wincmd j<CR>', 'Move to bottom window') -- Move to bottom window
  nl('we', '<Cmd>:wincmd =<CR>', 'Equalize window sizes') -- Equalize window sizes
  nl('w0', '<Cmd>:wincmd _<CR>:wincmd |<CR>', 'Maximize current window') -- Maximize current window
  nl('wq', '<Cmd>:wincmd _<CR>:wincmd |<CR>:wincmd o<CR>', 'Minimize current window') -- Minimize current window
  nl('w>', '<Cmd>:resize +5<CR>', 'Resize window larger horizontally') -- Resize window larger horizontally
  nl('w<', '<Cmd>:resize -5<CR>', 'Resize window smaller horizontally') -- Resize window smaller horizontally
  nl('w<Shift><Up>', '<Cmd>:vertical resize +5<CR>', 'Resize window larger vertically') -- Resize window larger vertically
  nl('w<Shift><Down>', '<Cmd>:vertical resize -5<CR>', 'Resize window smaller vertically') -- Resize window smaller vertically
end

-- set up all key mappings
M.setup = function()
  global_mappings()
  buffer_mappings()
  code_mappings()
  file_mappings()
  window_mappings()

  require('mini.clue').setup({
    -- Register `<Leader>` as trigger
    triggers = {
      { mode = 'n', keys = '<Leader>' },
      { mode = 'x', keys = '<Leader>' },
    },

    -- Add descriptions for mapping groups
    clues = {
      { mode = 'n', keys = '<Leader><Left>', desc = 'Previous Buffer' },
      { mode = 'n', keys = '<Leader><Right>', desc = 'Next Buffer' },
      { mode = 'n', keys = '<Leader>b', desc = '+Buffers' },
      { mode = 'n', keys = '<Leader>c', desc = '+Code' },
      { mode = 'n', keys = '<Leader>cp', desc = '+Pick' },
      { mode = 'n', keys = '<Leader>f', desc = '+Files' },
      { mode = 'n', keys = '<Leader>w', desc = '+Windows' },
    },
  })

end

return M

