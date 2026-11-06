require("later")({ "BufReadPre", "BufNewFile", "InsertEnter" }, {
	-- A release tag, so the prebuilt fuzzy matcher downloads.
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
}, function()
	require("blink.cmp").setup({
		sources = {
			default = { "lsp", "path", "snippets", "lazydev" },
			providers = {
				lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
			},
		},
		signature = { enabled = true },
	})
end)
