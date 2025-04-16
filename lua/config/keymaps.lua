-- config/keymaps.lua
local M = {}
-- {{{ Section Name
-- fold markers
-- }}}
M.items = {
	-- Base keymaps

	{ mode = { "n", "x" }, "<leader>n", group = "+NoNeckPain" },

	{
		mode = "n",
		"<leader>hd",
		function()
			local cursor_highlight = vim.fn.synIDattr(vim.fn.synID(vim.fn.line("."), vim.fn.col("."), 1), "name")
			print("Highlight group under cursor: " .. cursor_highlight)
		end,
		description = "Show highlight group under cursor",
	},
	{ mode = "n", "<leader>T", "<cmd>Themery<cr>", description = "Change theme" },
	{ mode = "n", "<leader>t", "<cmd>TransparentToggle<cr>", description = "Toggle Transparency" },
	{ mode = { "n", "x" }, "<leader>cp", '"+y', description = "Copy to system clipboard" },
	{ mode = { "n", "x" }, "<leader>cv", '"+p', description = "Paste from system clipboard" },

	-- NoNeckPain
	{
		itemgroup = "+NoNeckPain",
		description = "Center code in the terminal to reduce neck strain and increase ergonomics",
		icon = "",
		keymaps = {
			{ mode = "n", "<leader>nnp", "<cmd>NoNeckPain<cr>", description = "Toggle No Neck Pain" },
			{ mode = "n", "<leader>nwu", "<cmd>NoNeckPainWidthUp<cr>", description = "Increase width" },
			{ mode = "n", "<leader>nwd", "<cmd>NoNeckPainWidthDown<cr>", description = "Decrease width" },
			{ mode = "n", "<leader>nns", "<cmd>NoNeckPainScratchPad<cr>", description = "Toggle scratchpad" },
		},
	},
	-- Neogen
	{
		itemgroup = "+Neogen",
		description = "Quickly generate header comments for a variety of languages using various format specifications.",
		icon = "",
		keymaps = {
			{
				mode = "n",
				"<leader>ng",
				function()
					require("neogen").generate()
				end,
				description = "Generate docs",
			},
			{
				mode = "n",
				"<leader>nf",
				function()
					require("neogen").generate({ type = "func" })
				end,
				description = "Function doc",
			},
			{
				mode = "n",
				"<leader>nc",
				function()
					require("neogen").generate({ type = "class" })
				end,
				description = "Class doc",
			},
		},
	},

	{
		itemgroup = "+Diagnostics",
		description = "Index errors, warnings, and info dialouges and diagnostics.",
		icon = "",
		keymaps = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},

	-- Neo-tree
	{
		itemgroup = "+File Tree",
		description = "Center code in the terminal to reduce neck strain and increase ergonomics",
		icon = "",
		keymaps = {
			{
				mode = "n",
				"|",
				"<cmd>Neotree reveal<cr>",
				description = "Reveal file in Neo-tree",
			},
			{
				mode = "n",
				"rf",
				"<cmd>Neotree float reveal_file=<cfile> reveal_force_cwd<cr>",
				description = "Reveal in float",
			},
			{
				mode = "n",
				"<leader>B",
				"<cmd>Neotree toggle show buffers right<cr>",
				description = "Buffer list",
			},
			{
				mode = "n",
				"<leader>s",
				"<cmd>Neotree float git_status<cr>",
				description = "Git status",
			},
			{
				mode = "n",
				"<leader>o",
				"<cmd>Neotree toggle<cr>",
				description = "Toggle Neo-tree",
			},
		},
	},

	-- Bufferline
	{
		itemgroup = "+Bufferline",
		description = "Use buffers as tabs to allow one terminal tab to encapsulate a project",
		icon = "",
		keymaps = {
			{ mode = { "n", "i" }, "<M-PageUp>", "<cmd>BufferLineCyclePrev<CR>", description = "Previous buffer" },
			{ mode = { "n", "i" }, "<M-PageDown>", "<cmd>BufferLineCycleNext<CR>", description = "Next buffer" },
			{ mode = "n", "<leader>q", "<cmd>bp|bd #<CR>", description = "Close buffer" },
		},
	},

	-- Telescope
	{
		itemgroup = "+Telescope",
		description = "Find files and strings using telescope",
		icon = "",
		keymaps = {
			{ mode = "n", "<leader>ff", require("telescope.builtin").find_files, description = "Find Files" },
			{ mode = "n", "<leader>fg", require("telescope.builtin").live_grep, description = "Live Grep" },
			{ mode = "n", "<leader>fb", require("telescope.builtin").buffers, description = "Find Buffers" },
			{ mode = "n", "<leader>fh", require("telescope.builtin").help_tags, description = "Help Tags" },
		},
	},

	-- itemgroup = "CodeCompanion",
	-- icon = "",
	-- description = "Use the power of AI...",
	-- keymaps = {
	{
		itemgroup = "+NoNeckPain",
		description = "Center code in the terminal to reduce neck strain and increase ergonomics",
		icon = "",
		keymaps = {
			{
				mode = { "n", "v" },
				"<C-a>",
				"<cmd>CodeCompanionActions<CR>",
				description = "Open the action palette",
			},
			{
				mode = { "n", "v" },
				"<Leader>aa",
				"<cmd>CodeCompanionChat Toggle<CR>",
				description = "Toggle a chat buffer",
			},
			{
				mode = { "n", "v" },
				"<Leader>ac",
				"<cmd>CodeCompanionChat Add<CR>",
				description = "Add selected text to a chat buffer",
			},
			{
				mode = { "n", "v" },
				"<Leader>ad",
				"<cmd>CodeCompanionDiff<CR>",
				description = "Diff the current buffer",
			},
			{
				mode = { "n", "v" },
				"<Leader>as",
				"<cmd>CodeCompanionSettings<CR>",
				description = "Open the settings buffer",
			},
			{
				mode = { "n", "v" },
				"<Leader>at",
				"<cmd>CodeCompanionToggle<CR>",
				description = "Toggle CodeCompanion",
			},
			{
				mode = { "n", "v" },
				"<Leader>ae",
				"<cmd>CodeCompanion<CR>",
				description = "CodeCompanion to edit the file directly",
			},
			-- },
		},
	},
}

M.lsp_mappings = function(bufnr)
	return {

		{
			itemgroup = "+LSPSaga",
			description = "Quick operations based on code project context.",
			icon = "",
			keymaps = {
				{
					mode = "n",
					"gh",
					"<cmd>Lspsaga lsp_finder<CR>",
					description = "LSP Finder",
					buffer = bufnr,
				},
				{
					mode = "n",
					"K",
					"<cmd>Lspsaga hover_doc<CR>",
					description = "Hover Documentation",
					buffer = bufnr,
				},
				{
					mode = "n",
					"gd",
					"<cmd>Lspsaga peek_definition<CR>",
					description = "Peek Definition",
					buffer = bufnr,
				},
				{
					mode = "n",
					"gD",
					vim.lsp.buf.definition,
					description = "Go to Definition",
					buffer = bufnr,
				},
				{
					mode = "n",
					"<leader>ca",
					"<cmd>Lspsaga code_action<CR>",
					description = "Code Action",
					buffer = bufnr,
				},
				{
					mode = "n",
					"<leader>rn",
					"<cmd>Lspsaga rename<CR>",
					description = "Rename Symbol",
					buffer = bufnr,
				},
				{
					mode = "n",
					"<leader>O",
					"<cmd>Lspsaga outline<CR>",
					description = "Toggle Outline",
					buffer = bufnr,
				},
				{
					mode = "n",
					"gi",
					vim.lsp.buf.implementation,
					description = "Go to Implementation",
					buffer = bufnr,
				},
				{
					mode = "n",
					"gr",
					vim.lsp.buf.references,
					description = "Find References",
					buffer = bufnr,
				},
				{
					mode = "n",
					"<leader>sh",
					vim.lsp.buf.signature_help,
					description = "Signature Help",
					buffer = bufnr,
				},
				{
					mode = "n",
					"[d",
					"<cmd>Lspsaga diagnostic_jump_prev<CR>",
					description = "Previous Diagnostic",
					buffer = bufnr,
				},
				{
					mode = "n",
					"]d",
					"<cmd>Lspsaga diagnostic_jump_next<CR>",
					description = "Next Diagnostic",
					buffer = bufnr,
				},
				{
					mode = "n",
					"<leader>e",
					"<cmd>Lspsaga show_line_diagnostics<CR>",
					description = "Show Line Diagnostic",
					buffer = bufnr,
				},
				{
					mode = "n",
					"<leader>F",
					function()
						vim.lsp.buf.format({ async = true })
					end,
					description = "Format Code",
					buffer = bufnr,
				},
				{
					mode = "n",
					"<leader>ws",
					vim.lsp.buf.workspace_symbol,
					description = "Workspace Symbol",
					buffer = bufnr,
				},
			},
		},
	}
end

M.dap_mappings = function(dap)
	return {
		{
			itemgroup = "+Debugger",
			description = "Comprehensive debugging",
			icon = "",
			keymaps = {
				{ mode = "n", "<F5>", dap.continue, description = "Start/Continue Debugging" },
				{ mode = "n", "<F10>", dap.step_over, description = "Step Over" },
				{ mode = "n", "<F11>", dap.step_into, description = "Step Into" },
				{ mode = "n", "<F12>", dap.step_out, description = "Step Out" },
				{ mode = "n", "<Leader>b", dap.toggle_breakpoint, description = "Toggle Breakpoint" },
				{
					mode = "n",
					"<Leader>cb",
					function()
						dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
					end,
					description = "Conditional Breakpoint",
				},
				{ mode = "n", "<Leader>dr", dap.repl.open, description = "Open REPL" },
				{ mode = "n", "<Leader>dl", dap.run_last, description = "Run Last Session" },
			},
		},
	}
end

return M
