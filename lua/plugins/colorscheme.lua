-- On Linux, Noctalia's palette: its neovim template writes lua/matugen.lua
-- (base16 colours, generated and gitignored), which re-applies them when
-- Noctalia sends SIGUSR1 on a palette change. Elsewhere (no Noctalia),
-- Catppuccin Mocha. Both with a transparent background, so the terminal's
-- own (slightly see-through) background shows.
if vim.uv.fs_stat(vim.fn.stdpath("config") .. "/lua/matugen.lua") then
	vim.pack.add({ { src = "https://github.com/RRethy/base16-nvim", name = "base16" } }, { confirm = false })
	require("matugen").setup()

	-- base16 paints the background and fires no ColorScheme event, so clear it
	-- here, and again after each SIGUSR1 once matugen.lua's own handler has run
	local function clear_bg()
		for _, group in ipairs({ "Normal", "NormalNC", "SignColumn", "EndOfBuffer", "LineNr", "FoldColumn" }) do
			local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
			hl.bg = nil
			vim.api.nvim_set_hl(0, group, hl)
		end
	end
	clear_bg()
	local signal = vim.uv.new_signal()
	signal:start("sigusr1", function()
		vim.schedule(function()
			vim.defer_fn(clear_bg, 100)
		end)
	end)
else
	vim.pack.add({ { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } }, { confirm = false })
	require("catppuccin").setup({ transparent_background = true })
	vim.cmd.colorscheme("catppuccin-mocha")
end
