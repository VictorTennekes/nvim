vim.loader.enable()
-- Neovim's experimental cmdline/message UI (replaces noice): no "Press ENTER",
-- g< opens the message pager. Messages go to the bottom-right message window.
local ui2 = require("vim._core.ui2")
ui2.enable({ msg = { target = "msg" } })
vim.o.cmdheight = 0
-- Float the cmdline like noice's popup. ui2 has no option for this: move its
-- cmd window on every entry (sizes follow resizes). ui_cmdline_pos puts
-- blink's cmdline menu under it (the convention noice set).
-- The border gets FloatBorder's colour without its float background: ui2 draws
-- the cmdline itself on MsgArea (no background), so a dark frame showed.
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		local fg = vim.api.nvim_get_hl(0, { name = "FloatBorder", link = false }).fg
		vim.api.nvim_set_hl(0, "CmdlinePopupBorder", { fg = fg })
	end,
})
vim.api.nvim_create_autocmd("CmdlineEnter", {
	callback = function()
		local win = ui2.wins.cmd
		local width = math.min(60, vim.o.columns - 4)
		local row, col = math.floor(vim.o.lines * 0.4), math.floor((vim.o.columns - width) / 2)
		vim.api.nvim_win_set_config(win, {
			relative = "editor",
			row = row,
			col = col,
			width = width,
			border = "rounded",
		})
		local winhl = vim.wo[win].winhighlight
		if not winhl:find("FloatBorder", 1, true) then
			vim.wo[win].winhighlight = winhl .. ",FloatBorder:CmdlinePopupBorder"
		end
		vim.g.ui_cmdline_pos = { row + 3, col + 1 }
	end,
})
-- cmdheight=0 hides "recording @q": show it as a notification instead.
vim.api.nvim_create_autocmd("RecordingEnter", {
	callback = function()
		vim.notify("Recording @" .. vim.fn.reg_recording(), vim.log.levels.INFO, { id = "recording", timeout = false })
	end,
})
vim.api.nvim_create_autocmd("RecordingLeave", {
	callback = function()
		Snacks.notifier.hide("recording")
	end,
})
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
o.swapfile = false -- undofile keeps history; swap files only pile up after crashes
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
-- Over ssh, yank to the local machine's clipboard via OSC 52 (herdr forwards it).
-- Paste reads the unnamed register: terminals block OSC 52 clipboard reads.
if vim.env.SSH_TTY then
	local osc52 = require("vim.ui.clipboard.osc52")
	local function paste()
		return { vim.fn.split(vim.fn.getreg('"'), "\n"), vim.fn.getregtype('"') }
	end
	vim.g.clipboard = {
		name = "osc52",
		copy = { ["+"] = osc52.copy("+"), ["*"] = osc52.copy("*") },
		paste = { ["+"] = paste, ["*"] = paste },
	}
end

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

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

-- One file per plugin; order matters: colorscheme first, and on the first
-- buffer lazydev and blink load before lspconfig (blink's plugin file sets the
-- LSP capabilities before any client starts).
for _, name in ipairs({
	"colorscheme",
	"snacks",
	"mini",
	"treesitter",
	"gitsigns",
	"lazydev",
	"blink",
	"lspconfig",
	"conform",
	"which-key",
}) do
	require("plugins." .. name)
end

-- Like :Lazy update: review plugin changes (:w applies, :q cancels; parsers
-- rebuild via PackChanged in treesitter.lua) and update the Mason tools.
vim.api.nvim_create_user_command("PackUpdate", function()
	require("plugins.lspconfig")() -- Mason loads on the first buffer
	vim.cmd("MasonToolsUpdate")
	vim.pack.update()
end, { desc = "Update plugins, treesitter parsers and Mason tools" })
