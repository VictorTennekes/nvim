return require("later")({ "BufReadPre", "BufNewFile", "InsertEnter" }, {
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/neovim/nvim-lspconfig",
}, function()
	-- lsp.log only grows (44 MB here at WARN): keep errors only.
	vim.lsp.log.set_level(vim.log.levels.ERROR)
	require("mason").setup()

	-- Server progress (indexing, loading workspace) as native progress messages.
	vim.api.nvim_create_autocmd("LspProgress", {
		callback = function(ev)
			local value = ev.data.params.value
			local client = vim.lsp.get_client_by_id(ev.data.client_id)
			-- Neovim prefixes the title and percentage itself.
			local msg = value.kind == "end" and "done" or value.message or ""
			local text = ("%s %s"):format(client and client.name or "lsp", msg)
			vim.api.nvim_echo({ { text } }, false, {
				id = "lsp." .. ev.data.params.token,
				kind = "progress",
				source = "vim.lsp",
				title = value.title,
				status = value.kind ~= "end" and "running" or "success",
				percent = value.percentage,
			})
		end,
	})

	local s = vim.diagnostic.severity
	vim.diagnostic.config({
		severity_sort = true,
		float = { border = "rounded", source = "if_many" },
		underline = { severity = s.ERROR },
		signs = { text = { [s.ERROR] = "󰅚 ", [s.WARN] = "󰀪 ", [s.INFO] = "󰋽 ", [s.HINT] = "󰌶 " } },
		virtual_text = { source = "if_many", spacing = 2 },
		-- ]d / [d open the float at the new position.
		jump = {
			on_jump = function(_, bufnr)
				vim.diagnostic.open_float({ bufnr = bufnr, scope = "cursor", focus = false })
			end,
		},
	})

	vim.lsp.config("basedpyright", { settings = { basedpyright = { analysis = { typeCheckingMode = "basic" } } } })
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
		run_on_start = false, -- make update installs them
	})
end)
