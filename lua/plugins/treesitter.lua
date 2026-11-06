-- main branch: parsers built with tree-sitter-cli; highlighting is Neovim's own.
-- These are always installed (make update); other languages install on first open.
local parsers = {
	"bash",
	"c",
	"diff",
	"hcl",
	"lua",
	"luadoc",
	"markdown",
	"markdown_inline",
	"python",
	"query",
	"sql",
	"vim",
	"vimdoc",
}
vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" } }, { confirm = false })
-- Headless runs (make update) install and update synchronously instead.
if not vim.tbl_contains(vim.v.argv, "--headless") then
	-- Async and a no-op once installed.
	require("nvim-treesitter").install(parsers)
	-- main-branch parsers must match the plugin version (:PackUpdate).
	vim.api.nvim_create_autocmd("PackChanged", {
		callback = function(ev)
			if ev.data.spec.name == "nvim-treesitter" and ev.data.kind == "update" then
				require("nvim-treesitter").update()
			end
		end,
	})
end
local function attach(buf)
	if vim.api.nvim_buf_is_valid(buf) and pcall(vim.treesitter.start, buf) then
		vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end
end
vim.api.nvim_create_autocmd("FileType", {
	callback = function(ev)
		local ts = require("nvim-treesitter")
		local lang = vim.treesitter.language.get_lang(ev.match)
		if
			lang
			and not vim.tbl_contains(ts.get_installed("parsers"), lang)
			and vim.tbl_contains(ts.get_available(), lang)
		then
			ts.install(lang):await(function()
				attach(ev.buf)
			end)
		else
			attach(ev.buf)
		end
	end,
})
return parsers
