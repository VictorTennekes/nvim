-- Add and set up plugins on the first of `events` instead of at startup
-- (vim.pack has no lazy loading). Returns the loader so scripts (make update)
-- can force it; it runs at most once.
return function(events, specs, setup)
	local id
	local function load()
		if not id then
			return
		end
		vim.api.nvim_del_autocmd(id)
		id = nil
		vim.pack.add(specs, { confirm = false })
		setup()
	end
	id = vim.api.nvim_create_autocmd(events, { callback = load })
	return load
end
