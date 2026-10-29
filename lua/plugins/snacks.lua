local p = "<cmd>lua Snacks.picker."

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			sections = {
				{
					padding = 1,
					hl = "SnacksDashboardHeader",
					text = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⢴⣤⣠⣤⢤⣂⣔⣲⣒⣖⡺⢯⣝⡿⣿⣿⣿⣷⣶⣶⣢⢦⣤⣄⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣯⣿⣾⣿⣶⣺⣯⡿⣓⣽⢞⡸⣻⢏⣋⠌⣛⣭⣿⢟⣿⣛⣿⢷⣿⣿⣿⡟⣿⣻⣵⣲⢢⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣀⣤⡴⠲⠶⢦⠤⢤⡤⠿⠿⠿⠿⣿⣽⣿⣽⣷⣿⢽⣾⣷⣭⡞⣩⡐⠏⡋⣽⡬⣭⠏⢍⣞⢿⣽⣿⣷⢿⣿⣿⡿⠾⣿⢶⡶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣤⣖⠯⡙⢢⡁⠄⢢⡤⢠⢀⣸⠀⣄⡠⣀⣀⣦⡄⣠⢀⡃⠽⣽⠬⠍⣿⣿⣤⣥⣷⣿⣿⣿⣾⡍⠛⢌⠈⢫⣍⢋⣍⡁⠹⢍⠈⣳⢎⠴⠟⠻⢧⣄⠀⠀⠀⠀⠀
⠀⠀⣠⣾⣿⣿⣿⣯⡔⠆⠠⠈⣿⣿⠾⡾⠿⣶⠿⡟⣻⡛⣭⢙⠍⢩⠭⢩⡳⢮⡿⡿⢿⣿⣿⣧⣿⣽⣮⣤⣥⣩⣶⣟⣻⠧⣻⠶⢤⢰⡱⣬⣤⣌⣑⠞⠲⠓⠭⡀⠀⠀⠀
⠀⠐⣿⣿⣿⢟⡋⢈⢤⣤⣷⢿⣿⠒⢜⣁⡱⡧⢿⣹⣷⣿⡿⣷⠌⣢⣟⢱⢽⡨⢊⠴⡉⢉⡿⣯⢿⣏⢹⠏⣯⣩⣙⠾⢿⣳⣶⢻⣟⣿⠧⢀⠋⠟⣿⡧⠠⠄⡤⠈⢠⠀⠀
⠀⠀⠘⠻⠿⠶⠶⠿⠛⣹⣟⡞⠸⣬⠐⠙⢍⢉⣔⠪⠟⡛⠫⢵⣾⣣⣼⣽⢈⠔⡅⣜⡽⢯⢞⡕⡠⠓⣡⢚⣷⣷⣿⣳⡄⠢⠉⠛⢿⣲⢿⣶⢿⣬⣾⣛⠳⣼⡮⠳⡂⠒⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢠⠏⡁⢉⣀⣑⣆⡐⠊⣅⡕⢦⣀⣱⡶⢫⣨⢟⠽⠕⣇⢶⣵⣋⢝⣉⣋⠜⠉⠉⡯⠛⣿⣿⣿⣾⣳⠠⠤⠪⠁⠊⠉⠻⣟⣾⣿⣿⣟⣧⣧⢸⠂⠠⢠
⠀⠀⠀⠀⠀⠀⠀⣠⣾⢞⢉⠿⢿⣟⡓⠖⢾⡏⢠⣾⣿⠛⣰⠾⢓⡵⣺⢺⣼⡫⢪⡱⣉⠷⢗⡀⠤⠆⡻⣛⠿⣻⣿⢶⣊⡄⠀⠀⠀⠀⠄⢀⠀⠉⠿⣿⡿⣿⣛⡁⢍⣀⡌
⠀⠀⠀⠀⠀⠀⣠⣛⢓⠗⠀⠀⠠⣈⠉⢀⢬⣵⡿⢋⣴⣞⣵⣼⣭⢁⠕⢿⢋⣞⢟⣕⡩⣔⠃⠀⠀⡀⣛⣤⢿⣷⢻⣿⣿⣽⣮⡙⠆⠀⠤⢓⡙⣆⠀⠀⠘⠙⢯⣛⣶⠋⠁
⠀⠀⠀⠀⠀⢠⢋⢿⣼⣶⣶⣤⠒⢉⠠⣪⣮⠟⣡⡾⠹⡿⣿⣿⠝⢊⣐⢺⡜⣫⡞⢭⡕⠋⣐⠒⠀⠡⠏⠉⠘⠛⠚⡻⣯⠋⠛⢅⠐⢄⠀⣸⡃⠛⠀⡀⡀⠀⠈⠙⡟⠀⠀
⠀⠀⠀⠀⣠⢫⠎⠙⠿⣿⠛⡡⠔⠕⣴⡿⡁⡮⡷⡶⢟⣿⢎⡵⡠⢞⠱⢈⣼⠁⠄⠇⡄⣢⠒⠀⡎⠀⡇⠒⠐⠐⠐⢚⠐⢷⣔⢖⢊⡈⠒⠗⠠⠘⠈⡁⢈⣠⣤⠾⠀⠀⠀
⠀⠀⠀⣰⢳⠏⢀⢔⢤⠶⠪⣠⣭⣾⣿⠗⢘⣷⣼⠛⠛⢛⡝⣜⢑⣤⣾⠿⣿⣿⢽⣿⠿⠶⢴⣯⣄⡄⣇⣀⣀⡀⠄⠠⠆⣀⡨⢽⣵⣕⣄⣀⣰⣥⣶⣾⡿⠟⠉⠀⠀⠀⠀
⠀⠀⡰⣱⢋⠴⣩⠔⠻⣴⡾⢷⣿⡿⠃⠰⢿⣿⣿⣿⣶⣬⣧⣼⡿⠛⠁⡢⠒⠈⢈⡉⠿⠚⢼⣿⣿⣿⡆⠋⠉⠢⠀⢀⣀⣡⣴⡶⣿⣿⣿⠿⠻⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀
⠀⡼⣳⣯⣱⣪⣲⣫⠻⣯⢟⠽⠋⠀⠀⠀⠀⠈⠙⠻⢻⡳⡩⢇⢀⠸⢢⣤⣴⣁⡀⠊⡀⠠⠂⢉⣫⡭⣁⣀⣠⣴⣶⢿⣿⣿⣿⡿⠞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣼⣟⡿⣿⣿⢝⣫⣶⡿⠣⠉⠀⠀⠀⠀⠀⠀⠀⣠⣖⠕⡩⢂⢕⠡⠒⠸⣿⣿⣿⡿⢂⢀⠀⣜⡿⣵⣶⣾⣿⡿⠯⠟⠋⠉⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢸⢿⣷⣷⣷⣿⠛⠋⠁⠀⠀⠀⠀⠀⠀⢀⣴⡺⠟⣑⣿⡺⢑⡴⠂⠊⠀⢀⡁⣍⣢⣼⣺⣽⣶⡿⠿⠏⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠈⠙⠻⠝⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡿⡋⢰⠕⠋⡿⠉⢁⡈⢕⣲⣼⣒⣯⣷⣿⠿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣿⣷⣧⡎⣠⡤⠥⣰⢬⣵⣮⣽⣿⡿⠟⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷⣮⣟⡯⣓⣦⣿⣮⣿⣿⣿⠿⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠿⣿⣿⣿⣿⡿⠟⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
]],
				},
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},
		explorer = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		notifier = { enabled = true, timeout = 3000 },
		picker = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		{ "<leader><space>", p .. "smart()<cr>", desc = "Smart Find Files" },
		{ "<leader>,", p .. "buffers()<cr>", desc = "Buffers" },
		{ "<leader>/", p .. "grep()<cr>", desc = "Grep" },
		{ "<leader>:", p .. "command_history()<cr>", desc = "Command History" },
		{ "<leader>e", "<cmd>lua Snacks.explorer()<cr>", desc = "File Explorer" },
		{ "<leader>n", "<cmd>lua Snacks.notifier.show_history()<cr>", desc = "Notification History" },
		-- find
		{ "<leader>fb", p .. "buffers()<cr>", desc = "Buffers" },
		{ "<leader>fc", p .. "files({ cwd = vim.fn.stdpath('config') })<cr>", desc = "Find Config File" },
		{ "<leader>ff", p .. "files()<cr>", desc = "Find Files" },
		{ "<leader>fg", p .. "git_files()<cr>", desc = "Find Git Files" },
		{ "<leader>fp", p .. "projects()<cr>", desc = "Projects" },
		{ "<leader>fr", p .. "recent()<cr>", desc = "Recent" },
		-- git
		{ "<leader>gb", p .. "git_branches()<cr>", desc = "Git Branches" },
		{ "<leader>gl", p .. "git_log()<cr>", desc = "Git Log" },
		{ "<leader>gL", p .. "git_log_line()<cr>", desc = "Git Log Line" },
		{ "<leader>gs", p .. "git_status()<cr>", desc = "Git Status" },
		{ "<leader>gS", p .. "git_stash()<cr>", desc = "Git Stash" },
		{ "<leader>gd", p .. "git_diff()<cr>", desc = "Git Diff (Hunks)" },
		{ "<leader>gf", p .. "git_log_file()<cr>", desc = "Git Log File" },
		{ "<leader>gB", "<cmd>lua Snacks.gitbrowse()<cr>", desc = "Git Browse", mode = { "n", "v" } },
		{ "<leader>gg", "<cmd>lua Snacks.lazygit()<cr>", desc = "Lazygit" },
		-- search
		{ "<leader>sb", p .. "lines()<cr>", desc = "Buffer Lines" },
		{ "<leader>sB", p .. "grep_buffers()<cr>", desc = "Grep Open Buffers" },
		{ "<leader>sg", p .. "grep()<cr>", desc = "Grep" },
		{ "<leader>sw", p .. "grep_word()<cr>", desc = "Visual selection or word", mode = { "n", "x" } },
		{ '<leader>s"', p .. "registers()<cr>", desc = "Registers" },
		{ "<leader>s/", p .. "search_history()<cr>", desc = "Search History" },
		{ "<leader>sa", p .. "autocmds()<cr>", desc = "Autocmds" },
		{ "<leader>sc", p .. "command_history()<cr>", desc = "Command History" },
		{ "<leader>sC", p .. "commands()<cr>", desc = "Commands" },
		{ "<leader>sd", p .. "diagnostics()<cr>", desc = "Diagnostics" },
		{ "<leader>sD", p .. "diagnostics_buffer()<cr>", desc = "Buffer Diagnostics" },
		{ "<leader>sh", p .. "help()<cr>", desc = "Help Pages" },
		{ "<leader>sH", p .. "highlights()<cr>", desc = "Highlights" },
		{ "<leader>si", p .. "icons()<cr>", desc = "Icons" },
		{ "<leader>sj", p .. "jumps()<cr>", desc = "Jumps" },
		{ "<leader>sk", p .. "keymaps()<cr>", desc = "Keymaps" },
		{ "<leader>sl", p .. "loclist()<cr>", desc = "Location List" },
		{ "<leader>sm", p .. "marks()<cr>", desc = "Marks" },
		{ "<leader>sM", p .. "man()<cr>", desc = "Man Pages" },
		{ "<leader>sp", p .. "lazy()<cr>", desc = "Search for Plugin Spec" },
		{ "<leader>sq", p .. "qflist()<cr>", desc = "Quickfix List" },
		{ "<leader>sR", p .. "resume()<cr>", desc = "Resume" },
		{ "<leader>ss", p .. "lsp_symbols()<cr>", desc = "LSP Symbols" },
		{ "<leader>sS", p .. "lsp_workspace_symbols()<cr>", desc = "LSP Workspace Symbols" },
		{ "<leader>su", p .. "undo()<cr>", desc = "Undo History" },
		-- ui
		{ "<leader>uC", p .. "colorschemes()<cr>", desc = "Colorschemes" },
		{ "<leader>un", "<cmd>lua Snacks.notifier.hide()<cr>", desc = "Dismiss All Notifications" },
		-- lsp
		{ "gd", p .. "lsp_definitions()<cr>", desc = "Goto Definition" },
		{ "gD", p .. "lsp_declarations()<cr>", desc = "Goto Declaration" },
		{ "gr", p .. "lsp_references()<cr>", desc = "References", nowait = true },
		{ "gI", p .. "lsp_implementations()<cr>", desc = "Goto Implementation" },
		{ "gy", p .. "lsp_type_definitions()<cr>", desc = "Goto Type Definition" },
		-- other
		{ "<leader>z", "<cmd>lua Snacks.zen()<cr>", desc = "Toggle Zen Mode" },
		{ "<leader>Z", "<cmd>lua Snacks.zen.zoom()<cr>", desc = "Toggle Zoom" },
		{ "<leader>.", "<cmd>lua Snacks.scratch()<cr>", desc = "Toggle Scratch Buffer" },
		{ "<leader>S", "<cmd>lua Snacks.scratch.select()<cr>", desc = "Select Scratch Buffer" },
		{ "<leader>bd", "<cmd>lua Snacks.bufdelete()<cr>", desc = "Delete Buffer" },
		{ "<leader>cR", "<cmd>lua Snacks.rename.rename_file()<cr>", desc = "Rename File" },
		{ "<c-/>", "<cmd>lua Snacks.terminal()<cr>", desc = "Toggle Terminal" },
		{ "]]", "<cmd>lua Snacks.words.jump(vim.v.count1)<cr>", desc = "Next Reference", mode = { "n", "t" } },
		{ "[[", "<cmd>lua Snacks.words.jump(-vim.v.count1)<cr>", desc = "Prev Reference", mode = { "n", "t" } },
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				Snacks.toggle.inlay_hints():map("<leader>uh")
			end,
		})
	end,
}
