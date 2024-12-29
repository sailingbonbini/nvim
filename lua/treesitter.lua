local M = {}

M.setup = function()
 -- Possible to immediately execute code which depends on the added plugin
  require('nvim-treesitter.configs').setup({
    -- Specify parsers to install
    modules = {},
    ensure_installed = { 'bash', 'lua', 'vimdoc', 'java', 'python', 'xml', 'html', 'groovy' }, -- Can also be 'all'
    sync_install = true, -- Install parsers synchronously (only applied to `ensure_installed`)
    auto_install = true, -- Automatically install missing parsers when entering buffer
    ignore_install = { 'haskell' }, -- List of parsers to ignore installing
    -- Enable highlighting
    highlight = {
      enable = true, -- Enable Treesitter-based syntax highlighting
      additional_vim_regex_highlighting = true, -- Combine with Vim's syntax highlighting (optional)
    },
    -- Disable incremental selection (optional)
    incremental_selection = {
      enable = false,
    },
    -- Enable indentation (optional)
    indent = {
      enable = false, -- Enable Treesitter-based indentation
    },
    playground = {
      enable = true
    },
  })
end

return M
