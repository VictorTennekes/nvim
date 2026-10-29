return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"saghen/blink.cmp",
	},
	config = function()
		local s = vim.diagnostic.severity
		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = s.ERROR },
			signs = { text = { [s.ERROR] = "󰅚 ", [s.WARN] = "󰀪 ", [s.INFO] = "󰋽 ", [s.HINT] = "󰌶 " } },
			virtual_text = { source = "if_many", spacing = 2 },
		})

		vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })
		vim.lsp.config("basedpyright", {
			settings = {
				basedpyright = {
					analysis = {
						typeCheckingMode = "basic",
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
						diagnosticMode = "openFilesOnly",
					},
				},
			},
		})
		vim.lsp.config("lua_ls", { settings = { Lua = { completion = { callSnippet = "Replace" } } } })
		vim.lsp.enable({ "basedpyright", "ruff", "terraformls", "sqls", "lua_ls" })

		require("mason-tool-installer").setup({
			ensure_installed = {
				"basedpyright",
				"ruff",
				"terraform-ls",
				"sqls",
				"lua-language-server",
				"stylua",
				"sqlfluff",
			},
		})
	end,
}
