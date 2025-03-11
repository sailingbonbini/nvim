local mini_pick = require('mini.pick')

local M = {}

M.setup = function()
  local g = vim.g
  g.t_co = 256
  g.background = "dark"
  local opt = vim.opt
  -- [[ Context ]]
  opt.number = true                -- bool: Show line numbers
  opt.relativenumber = true        -- bool: Show relative line numbers
  opt.scrolloff = 10               -- int:  Min num lines of context
  opt.signcolumn = "yes"           -- str:  Show the sign column

  -- [[ Filetypes ]]
  opt.encoding = 'utf8'            -- str:  String encoding to use
  opt.fileencoding = 'utf8'        -- str:  File encoding to use

  -- [[ Theme ]]
  opt.syntax = "ON"                -- str:  Allow syntax highlighting
  opt.termguicolors = true         -- bool: If term supports ui color then enable

  -- [[ Search ]]
  opt.ignorecase = true            -- bool: Ignore case in search patterns
  opt.smartcase = true             -- bool: Override ignorecase if search contains capitals
  opt.incsearch = true             -- bool: Use incremental search
  opt.hlsearch = false             -- bool: Highlight search matches

  -- [[ Whitespace ]]
  opt.expandtab = false             -- bool: Use spaces instead of tabs
  opt.shiftwidth = 2               -- num:  Size of an indent
  opt.softtabstop = 2              -- num:  Number of spaces tabs count for in insert mode
  opt.tabstop = 2                  -- num:  Number of spaces tabs count for

  -- [[ Splits ]]
  opt.splitright = true            -- bool: Place new window to right of current one
  opt.splitbelow = true            -- bool: Place new

  -- make sure vim opens folds automativally
  vim.o.foldcolumn = '1'
  vim.o.foldlevel = 99
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true
  vim.opt.fillchars = {
    foldopen = '▾',
    foldclose = '▸',
    foldsep = ' ',
    fold = '⠀',  -- U+2800 Braille blank
  }

  -- [[ Make yank copy to the system clipboard ]] 
  vim.api.nvim_set_option("clipboard","unnamed")

  -- [[ use tree sitter for code folding ]]
  --opt.foldmethod = "expr"
  --opt.foldexpr = "nvim_treesitter#foldexpr()"

  -- [[ make sure python indent is 2 spaces ]]
  vim.cmd(" autocmd FileType python set shiftwidth=2 tabstop=2 expandtab")
  vim.cmd(" let g:python_recommended_style = 0")
  vim.cmd(" set whichwrap+=<,>,h,l,[,]")

  -- make sure we turn off vim syntax highlighting
  vim.cmd("syntax off")

  -- no soft wraps
  opt.wrap = false

  -- use the mini picker for nvim ui select
  vim.ui.select = mini_pick.ui_select

  -- treat xhtml files as html files
  vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.xhtml",
    command = "setfiletype html"
  })
end

return M
