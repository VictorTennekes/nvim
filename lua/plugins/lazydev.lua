-- No luv library entry: Neovim 0.12 ships the vim.uv types in its runtime.
require("later")({ "BufReadPre", "BufNewFile", "InsertEnter" }, { "https://github.com/folke/lazydev.nvim" }, function()
	require("lazydev").setup()
end)
