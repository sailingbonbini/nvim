local wk = require("which-key")
local cmp = require("cmp")

-- [[ global shortcuts ]]
wk.add({ "<leader>/", "<cmd>Neotree toggle<cr>", desc = "toggle neotree" })
wk.add({ "<leader><Left>", "<cmd>bnext<cr>", desc = "previous buffer"})
wk.add({ "<leader><Right>", "<cmd>bnext<cr>", desc = "next buffer"})
wk.add({ "<leader>~", "<cmd>Telescope command_history<cr>", desc = "Command History" })
wk.add({ "<leader>*", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" })
wk.add({ "<leader>B",  "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" })

-- [[ buffer ]]
wk.add({ "<leader>b", group = "buffer" })
wk.add({ "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "buffers" })
wk.add({ "<leader>bd", "<cmd>bdelete<cr>", desc = "delete buffer" })
wk.add({ "<leader>bf", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "find in buffer" })
wk.add({ "<leader>bp", "<cmd>bprevious<cr>", desc = "previous buffer"})
wk.add({ "<leader>bn", "<cmd>bnext<cr>", desc = "next buffer"})

-- [[ code group ]]
wk.add({ "<leader>c", group="code"})
wk.add({ "<M-Up>", "<cmd>:m .-2<cr>", desc="Move line up"}, { mode={'n','i','v'}})
wk.add({ "<M-Down>", "<cmd>:m .+1<cr>", desc="Move line down"},{ mode={'n','i','v'}})
wk.add({ "<C-b>", function() cmp.mapping.scroll_docs(-4) end, desc="scroll docs up"})
wk.add({ "<C-b>", function() cmp.mapping.scroll_docs(4) end, desc="scroll docs down"})
wk.add({ "<C-SPACE>", function() cmp.mapping.complete() end, desc="complete completion"})
wk.add({ "<C-e>", function() cmp.mapping.abort() end, desc="abort completion"})
wk.add({ "<CR>", function() cmp.mapping.confirm({select = true }) end, desc="use this completion"})
wk.add({ "<leader>ca", function() vim.lsp.buf.code_action() end, desc = "code action" })
wk.add({ "<leader>cd", function() vim.lsp.buf.definition() end, desc = "go to definition" })
wk.add({ "<leader>ch", function() vim.lsp.buf.hover() end, desc = "hover over element" })
wk.add({ "<leader>gd", function() vim.lsp.buf.definition() end, desc = "go to definition" })
wk.add({ "<leader>cr", function() vim.lsp.buf.references() end, desc = "go to references" })
wk.add({ "<leader>cf", function() vim.lsp.buf.format() end, desc = "format buffer" })

-- [[ file group ]]
wk.add({ "<leader>f", group="file"})
wk.add({ "<leader>fn", "<cmd>enew<cr>", desc = "new file"})
wk.add({ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" })
wk.add({ "<leader>fb", function() require('telescope.builtin').find_files({ cwd = require("telescope.utils").buffer_dir() }) end, desc = "find file in buffer dir" })
wk.add({ "<leader>fg", function() require('telescope.builtin').live_grep() end, desc = "live grep" })
wk.add({ "<leader>fh", function() require('telescope.builtin').find_files({ cwd = "/Users/tom" }) end, desc = "find file in home dir" })
wk.add({ "<leader>fp", function() require('telescope.builtin').find_files({ cwd = "/Users/tom/projects" }) end, desc = "find file in project dir" })
wk.add({ "<leader>fc", function() require('telescope.builtin').find_files({ cwd = "/Users/tom/.config" }) end, desc = "find file in .config dir" })

-- [[ git group ]]
wk.add({ "<leader>g", group = "git" })
wk.add({ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "git commits" })
wk.add({ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "git status" })

-- [[ help group ]]
wk.add({ "<leader>h", group = "help" })
wk.add({ "<leader>ha", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" })
wk.add({ "<leader>hc", "<cmd>Telescope commands<cr>", desc = "Commands" })
wk.add({ "<leader>hf", "<cmd>Telescope filetypes<cr>", desc = "File Types" })
wk.add({ "<leader>hh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" })
wk.add({ "<leader>hk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" })
wk.add({ "<leader>hm", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" })
wk.add({ "<leader>ho", "<cmd>Telescope vim_options<cr>", desc = "Options" })
wk.add({ "<leader>hs", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" })
wk.add({ "<leader>ht", "<cmd>Telescope builtin<cr>", desc = "Telescope" })
