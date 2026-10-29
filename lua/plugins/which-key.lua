return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		delay = 0,
		preset = "helix",
		spec = {
			{ "<leader>c", group = "code" },
			{ "<leader>f", group = "find" },
			{ "<leader>g", group = "git" },
			{ "<leader>s", group = "search" },
			{ "<leader>u", group = "ui" },
		},
	},
}
