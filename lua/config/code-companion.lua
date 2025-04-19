return {
	strategies = {
		inline = { adapter = "openai" }, -- { adapter = "ollama" },
		chat = {
			adapter = "openai",
			roles = {
				user = "Wayward",
			},
			keymaps = {
				send = {
					modes = {
						i = { "<C-CR>", "<C-s>" },
					},
				},
				completion = {
					modes = {
						i = "<C-x>",
					},
				},
			},
			slash_commands = {
				["buffer"] = {
					opts = {
						--[[ provider = "snacks", ]]
						keymaps = {
							modes = {
								i = "<C-b>",
							},
						},
					},
				},
				["help"] = {
					opts = {
						--[[ provider = "snacks", ]]
						max_lines = 1000,
					},
				},
				["file"] = {
					opts = {
						--[[ provider = "snacks", ]]
					},
				},
				--[[ ["symbols"] = { ]]
				--[[   opts = { ]]
				--[[     provider = "snacks", ]]
				--[[   }, ]]
			},
		},
		tools = {
			vectorcode = {
				description = "Run VectorCode to retrieve the project context.",
				callback = function()
					return require("vectorcode.integrations").codecompanion.chat.make_tool()
				end,
			},
		},
	},

	adapters = {
		deepseek = function()
			return require("codecompanion.adapters").extend("deepseek", {
				env = {
					api_key = "cmd:op read op://personal/DeepSeek_API/credential --no-newline",
				},
			})
		end,
		ollama = function()
			return require("codecompanion.adapters").extend("ollama", {
				schema = {
					num_ctx = {
						default = 50000,
					},
				},
			})
		end,
		openai = function()
			return require("codecompanion.adapters").extend("openai", {
				env = {
					api_key = "cmd:op read op://personal/OpenAI_API/credential --no-newline",
				},
				schema = {
					model = {
						default = function()
							return "gpt-4.1-nano"
						end,
					},
				},
			})
		end,
	},
	prompt_library = {
		["NextJS PWA Expert"] = {
			strategy = "chat",
			description = "NextJS 15.2 PWA development with TypeScript and Kubernetes",
			opts = { index = 1 },
			references = {
				{ type = "file", path = { "next.config.ts", "package.json", "dockerfile" } },
			},
			prompts = {
				{
					role = "user",
					content = [[
You are a NextJS 15.2 expert specializing in PWAs. Help me create type-safe, performant code
with App Router, server components, and React best practices. Always:
1. Prioritize TypeScript strictness
2. Enforce Tailwind CSS utility classes
3. Optimize for Kubernetes deployment
4. Suggest modern React patterns (hooks, suspense, etc.)
5. Validate against PWA requirements (service workers, manifest)
]],
				},
			},
		},

		["Neovim Config Assistant"] = {
			strategy = "chat",
			description = "Help with Neovim 0.11 Lazy.nvim configuration",
			opts = { index = 2 },
			references = {
				{ type = "file", path = "lua/config/lazy.lua" },
			},
			prompts = {
				{
					role = "user",
					content = [[
You're a Neovim configuration expert. Help me:
- Structure my Lazy.nvim setup
- Troubleshoot plugin issues
- Optimize startup time
- Implement modern Lua patterns
- Set up LSPs and formatters
- Optimize out redundancies
Always consider Neovim 0.11+ features and cross-platform compatibility.
]],
				},
			},
		},

		["Home Assistant Expert"] = {
			strategy = "chat",
			description = "Home Assistant configuration and automation help",
			opts = { index = 3 },
			references = {
				{ type = "file", path = "configuration.yaml" },
			},
			prompts = {
				{
					role = "user",
					content = [[
You're a Home Assistant expert. Always use the keyword "trigger" and never the deprecated "platform."
Similarly, never use "service." Instead ALWAYS NO MATTER WHAT use "action." Additionally, will will help with:
- YAML configuration validation
- Automation optimization
- Custom component integration
- Template creation
- Energy monitoring setup
Always check for best practices and suggest performance improvements.
]],
				},
			},
		},

		["Code Review Specialist"] = {
			strategy = "chat",
			description = "Open source code review and debugging assistant",
			opts = { index = 4 },
			prompts = {
				{
					role = "user",
					content = [[
You're a senior code reviewer. Help me:
1. Analyze code structure and architecture
2. Identify potential bugs and security issues
3. Suggest performance optimizations
4. Recommend design pattern improvements
5. Create debugging strategies
6. Document complex logic
Focus on readability, maintainability, and cross-platform compatibility.
]],
				},
			},
		},

		["Embedded Systems Engineer"] = {
			strategy = "chat",
			description = "Embedded development for various platforms",
			opts = { index = 5 },
			references = {
				{ type = "file", path = { "schematics.pdf", "datasheets/" } },
			},
			prompts = {
				{
					role = "user",
					content = [[
You're an embedded systems expert. Assist with:
- Low-level C/C++ programming
- Hardware abstraction layers
- Peripheral configuration (GPIO, UART, SPI, I2C)
- RTOS integration
- Memory optimization
- Cross-compiling toolchains
- Debugging with JTAG/SWD
Support platforms: Mikrotik, 8devices, MSP430, STM32. Always consider:
- Hardware constraints
- Power efficiency
- Real-time requirements
- Safety-critical practices
]],
				},
			},
		},

		["Code Review Workflow"] = {
			strategy = "workflow",
			description = "Multi-step code review process",
			opts = { index = 10 },
			prompts = {
				{
					{
						role = "user",
						content = "Analyze this code for potential bugs and security issues",
						opts = { auto_submit = false },
					},
					{
						role = "user",
						content = "Suggest architectural improvements and design patterns",
						opts = { auto_submit = false },
					},
					{
						role = "user",
						content = "Propose performance optimizations with concrete examples",
						opts = { auto_submit = true },
					},
				},
			},
		},

		["Embedded Debugging Workflow"] = {
			strategy = "workflow",
			description = "Hardware debugging assistance flow",
			opts = { index = 11 },
			prompts = {
				{
					{
						role = "user",
						content = "Analyze this microcontroller crash log",
						opts = { auto_submit = false },
					},
					{
						role = "user",
						content = "Suggest possible hardware/software causes",
						opts = { auto_submit = false },
					},
					{
						role = "user",
						content = "Propose step-by-step debugging strategy",
						opts = { auto_submit = true },
					},
				},
			},
		},
	},
	display = {
		action_palette = {
			provider = "telescope", -- Can be "default", "telescope", or "mini_pick". If not specified, the plugin will autodetect installed providers.
			opts = {
				show_default_actions = true, -- Show the default actions in the action palette?
				show_default_prompt_library = true, -- Show the default prompt library in the action palette?
			},
		},
		chat = {
			adapter = "deepseek",
			-- show_references = true,
			show_header_separator = true,
			-- show_settings = false,
		},
		diff = {
			enabled = true,
			provider = "default", --"mini_diff",
		},

		-- Options to customize the UI of the chat buffer
		window = {
			layout = "vertical", -- float|vertical|horizontal|buffer
			position = nil, -- left|right|top|bottom (nil will default depending on vim.opt.plitright|vim.opt.splitbelow)
			border = "single",
			height = 0.8,
			width = 0.45,
			relative = "editor",
			full_height = true, -- when set to false, vsplit will be used to open the chat buffer vs. botright/topleft vsplit
			opts = {
				breakindent = true,
				cursorcolumn = false,
				cursorline = true,
				foldcolumn = "0",
				linebreak = true,
				list = false,
				numberwidth = 1,
				signcolumn = "no",
				spell = false,
				wrap = true,
			},
		},
	},
	opts = {
		send_code = false,
		log_level = "DEBUG",
	},
}
