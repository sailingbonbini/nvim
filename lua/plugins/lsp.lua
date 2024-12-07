return {
	--
	-- lua language server and nvim development scripts
	--
	{ "folke/neodev.nvim", lazy = false, opts = {} },
	--
	-- mason, a plugin to manage LSP servers, formatters etc.
	--
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	--
	-- mason lsp-config, a collection of tools to manage lsp configurations
	--
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
		},
		config = function()
			require("neodev").setup({})
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

      local mason_lspconfig = require 'mason-lspconfig'
      mason_lspconfig.setup {
        ensure_installed = { "pyright" }
      }
      lspconfig.pyright.setup {
        capabilities = capabilities,
      }

      lspconfig.lua_ls.setup({
				capabilities = capabilities,
				-- this is to stop the annoying prompt for 'luv'
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = "Disable",
						},
					},
				},
			})
		end,
	},
}
