require("later")(
	{ "BufReadPre", "BufNewFile", "InsertEnter" },
	{ "https://github.com/stevearc/conform.nvim" },
	function()
		require("conform").setup({
			notify_on_error = false,
			default_format_opts = { lsp_format = "fallback" },
			format_on_save = { timeout_ms = 500 },
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
				sql = { "sqlfluff" },
			},
		})
		vim.keymap.set("", "<leader>cf", function()
			require("conform").format({ async = true })
		end, { desc = "Format buffer" })
	end
)
