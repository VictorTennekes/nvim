vim.pack.add({ "https://github.com/echasnovski/mini.nvim" }, { confirm = false })
-- aN/iN for "next": the defaults (an/in) hide Neovim 0.12's treesitter
-- incremental selection (:h v_an).
require("mini.ai").setup({ n_lines = 500, mappings = { around_next = "aN", inside_next = "iN" } })
require("mini.align").setup()
require("mini.icons").setup()
require("mini.move").setup()
require("mini.pairs").setup()
require("mini.surround").setup()

local statusline = require("mini.statusline")
statusline.setup()
statusline.section_location = function()
	return "%2l:%-2v"
end
