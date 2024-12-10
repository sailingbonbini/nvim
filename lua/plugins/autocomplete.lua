return {
	--
	-- We're using nvim-cmp with LuaSnip as snippet engine
	--
	"hrsh7th/nvim-cmp",
	dependencies = {
		{ "L3MON4D3/LuaSnip" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "rafamadriz/friendly-snippets" },
		{ "hrsh7th/cmp-nvim-lsp" },
	},
	config = function()
		local cmp = require("cmp")
		require("luasnip.loaders.from_vscode").lazy_load()

		local lsp_symbols = {
			Text = "   (Text) ",
			Method = "󰫺 (Method)",
			Function = "󰫳 (Function)",
			Constructor = "󰖷  (Constructor)",
			Field = " (Field)",
			Variable = " (Variable)",
			Class = " (Class)",
			Interface = "󰫶 (Interface)",
			Module = " (Module)",
			Property = " (Property)",
			Unit = "  (Unit)",
			Value = " (Value)",
			Enum = " (Enum)",
			Keyword = "  (Keyword)",
			Snippet = "  (Snippet)",
			Color = "  (Color)",
			File = "  (File)",
			Reference = "  (Reference)",
			Folder = " (Folder)",
			EnumMember = " ( (EnumMember)",
			Constant = "  (Constant)",
			Struct = "  (Struct)",
			Event = "  (Event)",
			Operator = "  (Operator)",
			TypeParameter = " (TypeParameter)",
		}

		cmp.setup({
			sources = {
				{ name = "buffer" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			},
			mapping = {
				["<cr>"] = cmp.mapping.confirm({ select = true }),
				["<s-tab>"] = cmp.mapping.select_prev_item(),
				["<tab>"] = cmp.mapping.select_next_item(),
			},
			formatting = {
				format = function(entry, item)
					item.kind = lsp_symbols[item.kind]
					item.menu = ({
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						luasnip = "[Snippet]",
					})[entry.source.name]
					return item
				end,
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})
	end,
}
