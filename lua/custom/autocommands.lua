vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	desc = "Yoda-style save confirmation",
	group = vim.api.nvim_create_augroup("yoda-save", { clear = true }),
	callback = function(args)
		local name = vim.fn.fnamemodify(args.file, ":t")
		if name == "" then
			return
		end
		vim.notify("Saved " .. name .. ", you have. Hmm.", vim.log.levels.INFO, { title = "Yoda" })
	end,
})
