return {
	"saghen/blink.cmp",
	event = "VimEnter",
	version = "1.*",
	dependencies = { "folke/lazydev.nvim" },
	opts = {
		keymap = { preset = "default" },
		appearance = { nerd_font_variant = "mono" },
		completion = { documentation = { auto_show = false } },
		sources = {
			default = { "lsp", "path", "snippets", "lazydev" },
			providers = {
				lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
			},
		},
		signature = { enabled = true },
	},
}
