return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	--   -- refer to `:h file-pattern` for more examples
	--   "BufReadPre path/to/my-vault/*.md",
	--   "BufNewFile path/to/my-vault/*.md",
	-- },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"ibhagwan/fzf-lua",
		"nvim-treesitter/nvim-treesitter",
	},
	ui = {
		enable = false,
		-- turn off elements already covered by render-markdown
		checkboxes = false,
		-- bullets = false,
		-- headings = false,
		-- tags = false,
		-- callouts = false,
	},
	opts = {

		workspaces = {
			{
				name = "Work",
				path = "~/Documents/Obsidian Vault/",
			},
			-- {
			-- name = "work",
			-- path = "~/vaults/work",
			-- },
		},
		daily_notes = {
			-- Optional, if you keep daily notes in a separate directory.
			folder = "Daily Log",
			-- Optional, if you want to change the date format for the ID of daily notes.
			date_format = "%m-%d-%Y-",
			-- Optional, if you want to change the date format of the default alias of daily notes.
			alias_format = "%B %-d, %Y",
			-- Optional, default tags to add to each new daily note created.
			default_tags = { "time-summary" },
			-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
			template = { "{Daily Work Log}" },
		},

		-- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
		completion = {
			-- Set to false to disable completion.
			nvim_cmp = true,
			-- Trigger completion at 2 chars.
			min_chars = 2,
		},
	},
}
