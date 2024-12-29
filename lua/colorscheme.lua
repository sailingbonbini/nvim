local minibase16 = require('mini.base16')

local M = {}

-- base 16 color scheme
local config = {
    palette = {
      base00 = '#000000', -- Black (background)
      base01 = '#1a1a1a', -- Very Dark Gray (darker accents)
      base02 = '#2e2e2e', -- Medium Gray (accents)
      base03 = '#6d6d6d', -- Soft Gray (brighter for comments)
      base04 = '#c3b9ac', -- Muted Beige (light accents)
      base05 = '#e8dfd6', -- Pastel Beige (text/foreground)
      base06 = '#f5ede4', -- Soft Cream (highlighted text)
      base07 = '#fffae8', -- Light Yellow (highlight)
      base08 = '#f28b82', -- Soft Red (error, critical)
      base09 = '#f6ae76', -- Pastel Orange (warning)
      base0A = '#fae3a0', -- Pale Gold (attention)
      base0B = '#c5e1a5', -- Light Green (success)
      base0C = '#b2dfdb', -- Soft Teal (info)
      base0D = '#90caf9', -- Pastel Blue (neutral emphasis)
      base0E = '#d9a7c7', -- Soft Mauve (secondary emphasis)
      base0F = '#a1887f', -- Muted Earthy Brown (extra)
    },
    use_cterm = true,
}

-- colors to be used for syntax highlighting
local colors = {
  background = config.palette.base00,    -- Background
  comment = config.palette.base03,       -- Comments
  keyword = config.palette.base0E,       -- Keywords and reserved words (soft mauve)
  text = config.palette.base05,          -- Default text and types (beige)
  string = config.palette.base0B,        -- Strings (soft teal)
  function_name = config.palette.base05, -- Function names (pink-ish)
  annotations = config.palette.base0D,
  error = config.palette.base08,
  cursor_normal = config.palette.base0A,
  cursor_insert = config.palette.base08,
}


-- Function to set highlight groups
local function set_highlight(group, properties)
  vim.api.nvim_set_hl(0, group, properties)
end

M.setup = function()
  minibase16.setup(config)

  -- Apply Tree-sitter highlights with modern `@` groups
  set_highlight('@attribute', { fg = colors.annotations, italic = true })
  set_highlight('@boolean', { fg = colors.keyword, bold = true })
  set_highlight('@character', { fg = colors.string })
  set_highlight('@comment', { fg = colors.comment, italic = true })
  set_highlight('@conditional', { fg = colors.keyword, bold = true })
  set_highlight('@constant', { fg = colors.text })
  set_highlight('@constant.builtin', { fg = colors.text, italic = true })
  set_highlight('@error', { fg = colors.error })
  set_highlight('@field', { fg = colors.text })
  set_highlight('@function', { fg = colors.function_name, bold = true })
  set_highlight('@function.builtin', { fg = colors.keyword, bold = true })
  set_highlight('@include', { fg = colors.keyword })
  set_highlight('@keyword', { fg = colors.keyword, bold = true })
  set_highlight('@keyword.function', { fg = colors.keyword, bold = true })
  set_highlight('@keyword.return', { fg = colors.keyword, bold = true })
  set_highlight('@label', { fg = colors.keyword })
  set_highlight('@method', { fg = colors.function_name })
  set_highlight('@namespace', { fg = colors.text, italic = true })
  set_highlight('@number', { fg = colors.text })
  set_highlight('@operator', { fg = colors.keyword })
  set_highlight('@parameter', { fg = colors.text })
  set_highlight('@property', { fg = colors.text })
  set_highlight('@punctuation.delimiter', { fg = colors.text })
  set_highlight('@punctuation.bracket', { fg = colors.text })
  set_highlight('@punctuation.special', { fg = colors.text })
  set_highlight('@repeat', { fg = colors.keyword, bold = true })
  set_highlight('@string', { fg = colors.string })
  set_highlight('@string.regex', { fg = colors.string, italic = true })
  set_highlight('@string.escape', { fg = colors.keyword })
  set_highlight('@tag', { fg = colors.keyword })
  set_highlight('@tag.attribute', { fg = colors.text })
  set_highlight('@text', { fg = colors.text })
  set_highlight('@type', { fg = colors.text })
  set_highlight('@type.builtin', { fg = colors.keyword, bold = true })
  set_highlight('@variable', { fg = colors.text })
  set_highlight('@variable.builtin', { fg = colors.text, italic = true })
  -- cursor colors
  vim.o.guicursor = "n-v-c:block,i:block-CursorInsert"
  vim.api.nvim_set_hl(0, "Cursor", { bg = colors.cursor_normal, fg = "white" })
  vim.api.nvim_set_hl(0, "CursorInsert", { bg = colors.cursor_insert, fg = "white" }) 
end

return M
