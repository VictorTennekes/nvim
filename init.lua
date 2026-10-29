vim.g.mapleader = " "

local o = vim.o
o.number = true
o.relativenumber = true
o.mouse = "a"
o.showmode = false
o.breakindent = true
o.tabstop = 4
o.shiftwidth = 4
o.undofile = true
o.ignorecase = true
o.smartcase = true
o.signcolumn = "yes"
o.updatetime = 250
o.timeoutlen = 300
o.splitright = true
o.splitbelow = true
o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
o.inccommand = "split"
o.cursorline = true
o.scrolloff = 10
o.confirm = true
vim.schedule(function()
	o.clipboard = "unnamedplus"
end)

for _, k in ipairs({ "h", "j", "k", "l" }) do
	vim.keymap.set("n", "<C-" .. k .. ">", "<C-w>" .. k, { desc = "Focus window " .. k })
end

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight on yank",
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	desc = "Yoda-style save confirmation",
	callback = function(args)
		local name = vim.fn.fnamemodify(args.file, ":t")
		if name ~= "" then
			vim.notify("Saved " .. name .. ", you have. Hmm.", vim.log.levels.INFO, { title = "Yoda" })
		end
	end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = { { import = "plugins" } },
	install = { colorscheme = { "catppuccin-mocha" } },
	checker = { enabled = true },
})
