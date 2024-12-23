--[[ opts.lua ]]
local opt = vim.opt

-- [[ Context ]]
--opt.colorcolumn = '80'           -- str:  Show col for max line length
opt.number = true                -- bool: Show line numbers
opt.relativenumber = true        -- bool: Show relative line numbers
opt.scrolloff = 10               -- int:  Min num lines of context
opt.signcolumn = "yes"           -- str:  Show the sign column

-- [[ Filetypes ]]
opt.encoding = 'utf8'            -- str:  String encoding to use
--opt.fileencoding = 'utf8'        -- str:  File encoding to use

-- [[ Theme ]]
opt.syntax = "ON"                -- str:  Allow syntax highlighting
opt.termguicolors = true         -- bool: If term supports ui color then enable

-- [[ Search ]]
opt.ignorecase = true            -- bool: Ignore case in search patterns
opt.smartcase = true             -- bool: Override ignorecase if search contains capitals
opt.incsearch = true             -- bool: Use incremental search
opt.hlsearch = false             -- bool: Highlight search matches

-- [[ Whitespace ]]
opt.expandtab = true             -- bool: Use spaces instead of tabs
opt.shiftwidth = 2               -- num:  Size of an indent
opt.softtabstop = 2              -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 2                  -- num:  Number of spaces tabs count for

-- [[ Splits ]]
opt.splitright = true            -- bool: Place new window to right of current one
opt.splitbelow = true            -- bool: Place new

-- [[ Make yank copy to the system clipboard ]] 
vim.api.nvim_set_option("clipboard","unnamed")

-- [[ use tree sitter for code folding ]]
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- [[ make sure python indent is 2 spaces ]]
vim.cmd(" autocmd FileType python set shiftwidth=2 tabstop=2 expandtab")
vim.cmd(" let g:python_recommended_style = 0")
vim.cmd(" set whichwrap+=<,>,h,l,[,]")
