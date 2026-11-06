require("later")({ "UIEnter" }, { "https://github.com/folke/which-key.nvim" }, function()
	vim.schedule(function()
		require("which-key").setup({
			delay = 0,
			preset = "helix",
			spec = {
				{ "<leader>c", group = "code" },
				{ "<leader>f", group = "find" },
				{ "<leader>g", group = "git" },
				{ "<leader>gh", group = "hunks", mode = { "n", "v" } },
				{ "<leader>s", group = "search" },
				{ "<leader>u", group = "ui" },
			},
		})
	end)
end)
