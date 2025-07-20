return {
	{
	    "mason-org/mason.nvim",
	    opts = {},
	    config = function()
	     require("mason").setup()
	    end
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		    },
		config = function()
		  require("mason-lspconfig").setup({
		  ensure_installed = {"lua_ls", "html", "cssls", "pyright", "ts_ls"}
		})
		end
	},

	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
		  local capabilities = require('cmp_nvim_lsp').default_capabilities()
	 	  local lspconfig = require("lspconfig")
		  lspconfig.lua_ls.setup({capabilities=capabilities})
		  lspconfig.pyright.setup({capabilities=capabilities})
		  lspconfig.html.setup({capabilities=capabilities})
		  lspconfig.cssls.setup({capabilities=capabilities})
		  lspconfig.ts_ls.setup({capabilities=capabilities})
		  vim.diagnostic.config({
		      virtual_text = {
			prefix = "",
			spacing = 4,
			source = "if_many",
		      },
		      signs = true,
		      underline = true,
		      update_in_insert = false,
		      severity_sort = true,
		    })
		end
	},
}

