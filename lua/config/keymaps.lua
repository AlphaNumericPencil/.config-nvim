-- config/keymaps.lua
local M = {}
-- {{{ Section Name
-- fold markers
-- }}}
--

M.items = {
  -- Base keymaps
  { mode = { "n", "x" }, "<leader>n",  group = "+NoNeckPain" },

  {
    itemgroup = "+Toggle",
    description = "Toggle Settings for themes and preferences",
    icon = "",
    keymaps = {

      { mode = "n", "<leader>tT", "<cmd>Themery<cr>",            description = "Change theme" },
      { mode = "n", "<leader>tt", "<cmd>TransparentToggle<cr>",  description = "Toggle Transparency" },
      { mode = "n", "<leader>tw", "<cmd>Twilight<cr>",           description = "Toggle Twilight" },
      { mode = "n", "<leader>ts", "<cmd>TabsVsSpacesToggle<cr>", description = "Tabs vs Spaces" },
      {
        mode = "n",
        "<leader>td",
        function()
          require("functions.toggle-diagnostics").cycle()
        end,
        description = "Cycle Diagnostics Display",
      },
    }
  },
  -- {
  --   mode = "n",
  --   "<leader>tsc",
  --   CycleScrollbar(),
  --   description = "Cycle scrollbar",
  -- },
  { mode = { "n", "x" }, "<leader>cp", '"+y',                 description = "Copy to system clipboard" },
  { mode = { "n", "x" }, "<leader>cv", '"+p',                 description = "Paste from system clipboard" },
  { mode = { "n" },      "<Esc>",      "<cmd>nohlsearch<CR>", description = "Esc to clear search" },
  -- vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
  -- { mode = { "n", "x" }, "C-<tab>", 'copilot#Accept("<CR>")', description = "accept from Copilot" },
  {
    mode = "n",
    "<leader>uh",
    function()
      local bufnr = vim.api.nvim_get_current_buf()
      local current_setting = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
      vim.lsp.inlay_hint.enable(not current_setting, { bufnr = bufnr })
    end,
    description = "Toggle Inlay Hints",
  },
  {
    mode = "n",
    "<leader>tn",
    "<cmd>:set relativenumber!<cr>",
    description = "Toggle relative numbers",
  },

  -- NoNeckPain
  {
    itemgroup = "+NoNeckPain",
    description = "Center code in the terminal to reduce neck strain and increase ergonomics",
    icon = "",
    keymaps = {
      { mode = "n", "<leader>nnp", "<cmd>NoNeckPain<cr>",           description = "Toggle No Neck Pain" },
      { mode = "n", "<leader>nwu", "<cmd>NoNeckPainWidthUp<cr>",    description = "Increase width" },
      { mode = "n", "<leader>nwd", "<cmd>NoNeckPainWidthDown<cr>",  description = "Decrease width" },
      { mode = "n", "<leader>nns", "<cmd>NoNeckPainScratchPad<cr>", description = "Toggle scratchpad" },
    },
  },
  {
    itemgroup = "+Games",
    description = "Play Games",
    icon = "󰡺",
    keymaps = {
      { mode = "n", "<leader>pbg", "<cmd>VimBeGood<cr>",                      description = "Vim Be Good" },
      { mode = "n", "<leader>pt",  "<cmd>tetris<cr>",                         description = "Tetris" },
      { mode = "n", "<leader>ps",  "<cmd>solitaire<cr>",                      description = "Solitaire" },
      { mode = "n", "<leader>pm",  "<cmd>minesweeper<cr>",                    description = "Minesweeper" },
      { mode = "n", "<leader>pk",  "<cmd>KillKillKill<cr>",                   description = "Killer Sheep" },
      { mode = "n", "<leader>pa",  "<cmd>CellularAutomaton make_it_rain<cr>", description = "die code" },
      { mode = "n", "<leader>pA",  "<cmd>CellularAutomaton game_of_life<cr>", description = "game of life" },
      {
        mode = "n",
        "<leader>pt",
        "<cmd>:tetris<cr>",
        description = "Play tetris",
      },
    },
  },
  {
    itemgroup = "+UFO",
    description = "Center code in the terminal to reduce neck strain and increase ergonomics",
    icon = "",
    keymaps = {
      { mode = "n", "zR", require("ufo").openAllFolds,         description = "Open all folds" },
      { mode = "n", "zM", require("ufo").closeAllFolds,        description = "Close all folds" },
      { mode = "n", "zr", require("ufo").openFoldsExceptKinds, description = "Open folds except kind" },
      { mode = "n", "zm", require("ufo").closeFoldsWith,       description = "Close folds with..." },
    },
  },
  {
    itemgroup = "+Hover",
    description = "View documentation in a tooltip",
    icon = "",
    keymaps = {
      {
        mode = "n",
        "K",
        function()
          local ufo = require("ufo")
          if ufo and ufo.peekFoldedLinesUnderCursor and ufo.peekFoldedLinesUnderCursor() then
            return
          end
          require("pretty_hover").hover() -- Call pretty_hover directly
        end,
        description = "Peek fold (UFO) or pretty_hover",
      },
      {
        mode = "n",
        "<C-n>",
        function()
          require("hover").hover_switch("next")
        end,
        description = "Next hover",
      },
      {
        mode = "n",
        "<C-p>",
        function()
          require("hover").hover_switch("previous")
        end,
        description = "Previous hover",
      },
    },
  },
  -- Doxygen
  {
    itemgroup = "+Documentation",
    description = "Code documentation tools",
    icon = "󰏫",
    keymaps = {
      { "<leader>dd", "<cmd>DoxygenOpen<CR>",   desc = "Open Doxygen" },
      { "<leader>du", "<cmd>DoxygenUpdate<CR>", desc = "Update Doxygen" },
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
        function()
          require("functions.toggle-trouble").toggle_below()
        end,
        desc = "鈴 Diagnostics below code (Trouble)",
      },
      {
        "<leader>xX",
        function()
          require("functions.toggle-trouble").toggle_buffer_diagnostics()
        end,
        desc = "󰒡 Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        function()
          require("functions.toggle-trouble").toggle_symbols()
        end,
        desc = "󰒡 Symbols (Trouble)",
      },
      {
        "<leader>xr",
        function()
          require("functions.toggle-trouble").toggle_lsp()
        end,
        desc = "󰒡 LSP Definitions / References (Trouble)",
      },
      {
        "<leader>xL",
        function()
          require("functions.toggle-trouble").toggle_loclist()
        end,
        desc = "󰒡 Location List (Trouble)",
      },
      {
        "<leader>xQ",
        function()
          require("functions.toggle-trouble").toggle_qflist()
        end,
        desc = "󰒡 Quickfix List (Trouble)",
      },
      {
        "<leader>xi",
        function()
          require("functions.toggle-trouble").toggle_implement()
        end,
        desc = "󰒡 Symbols (Trouble)",
      },
      {
        "<leader>xtd",
        function()
          require("functions.toggle-trouble").toggle_typedef()
        end,
        desc = "󰒡 LSP Definitions / References (Trouble)",
      },
    },
  },

  -- Neo-tree
  {
    itemgroup = "+File Tree",
    description = "File tree navigation",
    icon = "",
    keymaps = {
      {
        mode = "n",
        "<Bar>",
        "<cmd>Neotree reveal<cr>",
        description = "Reveal file in Neo-tree",
      },
      {
        mode = "n",
        "rf",
        function()
          vim.cmd("Neotree float reveal_file=" .. vim.fn.expand("<cfile>") .. " reveal_force_cwd")
        end,
        description = "Reveal in float",
      },
      {
        mode = "n",
        "<leader>B",
        "<cmd>Neotree buffers toggle position=right<cr>",
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
        "<leader><space>",
        "<cmd>Neotree filesystem show<cr>",
        description = "Show filesystem",
      },
      {
        mode = "n",
        "<leader>o",
        "<cmd>Neotree toggle<cr>",
        description = "Toggle Neo-tree",
      },
      {
        mode = "n",
        "<leader>O",
        "<cmd>Neotree show<cr>",
        description = "Toggle Neo-tree",
      },
    },
    condition = function()
      return vim.bo.filetype == "neo-tree"
    end,
    opts = {
      buffer = 0, -- 0 means current buffer
      show_keys = true,
    },
  },

  -- Bufferline
  {
    itemgroup = "+Bufferline",
    description = "Use buffers as tabs to allow one terminal tab to encapsulate a project",
    icon = "",
    keymaps = {
      { mode = { "n", "i" }, "<M-PageUp>",   "<cmd>BufferLineCyclePrev<CR>", description = "Previous buffer" },
      { mode = { "n", "i" }, "<M-PageDown>", "<cmd>BufferLineCycleNext<CR>", description = "Next buffer" },
      { mode = "n",          "<leader>q",    "<cmd>bp|bd #<CR>",             description = "Close buffer" },
    },
  },

  {
    itemgroup = "+Scrolling",
    description = "Smooth scrolling with neoscroll",
    icon = "󰅟",
    keymaps = {
      {
        mode = { "n", "v", "x" },
        "<C-k>",
        function()
          require("neoscroll").ctrl_u({ duration = 250 })
        end,
      },
      {
        mode = { "n", "v", "x" },
        "<C-j>",
        function()
          require("neoscroll").ctrl_d({ duration = 250 })
        end,
      },
      {
        mode = { "n", "v", "x" },
        "<C-b>",
        function()
          require("neoscroll").ctrl_b({ duration = 450 })
        end,
      },
      {
        mode = { "n", "v", "x" },
        "<C-f>",
        function()
          require("neoscroll").ctrl_f({ duration = 450 })
        end,
      },
      {
        mode = { "n", "v", "x" },
        "<C-y>",
        function()
          require("neoscroll").scroll(-0.1, { move_cursor = false, duration = 100 })
        end,
      },
      {
        mode = { "n", "v", "x" },
        "<C-e>",
        function()
          require("neoscroll").scroll(0.1, { move_cursor = false, duration = 100 })
        end,
      },
      {
        mode = "n",
        "zt",
        function()
          require("neoscroll").zt({ half_win_duration = 250 })
        end,
      },
      {
        mode = "n",
        "zz",
        function()
          require("neoscroll").zz({ half_win_duration = 250 })
        end,
      },
      {
        mode = "n",
        "zb",
        function()
          require("neoscroll").zb({ half_win_duration = 250 })
        end,
      },
      {
        mode = { "n", "v", "x", "i" }, -- Add relevant modes here
        "<PageUp>",
        function()
          require("neoscroll").scroll(-vim.api.nvim_win_get_height(0) + 10, { duration = 250 })
        end,
        description = "Page Up (Neoscroll)",
      },
      {
        mode = { "n", "v", "x", "i" }, -- Add relevant modes here
        "<PageDown>",
        function()
          require("neoscroll").scroll(vim.api.nvim_win_get_height(0) - 10, { duration = 250 })
        end,
        description = "Page Down (Neoscroll)",
      },
    },
  },

  -- Telescope
  {
    itemgroup = "+Telescope",
    description = "Find files and strings using telescope",
    icon = "",
    keymaps = {
      {
        mode = "n",
        "<leader>f",
        "",
        description = "Telescope (finder)",
      },
      -- General
      {
        mode = "n",
        "<leader>ff",
        require("telescope.builtin").find_files,
        description = "Find Files",
      },
      {
        mode = "n",
        "<leader>fa",
        require("telescope.builtin").live_grep,
        description = "Live Grep",
      },
      {
        mode = "n",
        "<leader>fb",
        require("telescope.builtin").buffers,
        description = "Find Buffers",
      },
      {
        mode = "n",
        "<leader>fh",
        require("telescope.builtin").help_tags,
        description = "Help Tags",
      },
      { "<leader>fp", "<cmd>Telescope projects<CR>", description = "Find projects" },

      -- Git-specific
      {
        mode = "n",
        "<leader>fg",
        "",
        description = "Git finder",
      },
      {
        mode = "n",
        "<leader>fgb",
        "<cmd>Telescope git_branches<CR>",
        description = "Git branches",
      },
      {
        mode = "n",
        "<leader>fgB",
        function()
          require("git_branch").files()
        end,
        description = "Git branches",
      },
      {
        mode = "n",
        "<leader>fgc",
        "<cmd>Telescope git_commits<CR>",
        description = "Git commits",
      },
      {
        mode = "n",
        "<leader>fgs",
        "<cmd>Telescope git_stash<CR>",
        description = "Git stash",
      },
      {
        mode = "n",
        "<leader>fgS",
        "<cmd>Telescope git_status<CR>",
        description = "Git status",
      },
      {
        mode = "n",
        "<leader>fcb",
        require("telescope.builtin").git_bcommits,
        description = "Commits in buffer",
      },
      -- -- Debugger
      -- {
      -- 	mode = "n",
      -- 	"<leader>fdc",
      -- 	require("telescope'.extensions").dap.commands,
      -- 	description = "Debugger Commands",
      -- },
      -- {
      -- 	mode = "n",
      -- 	"<leader>fdC",
      -- 	require("telescope").extensions.dap.configurations({}),
      -- 	description = "Debugger Configurations",
      -- },
      -- {
      -- 	mode = "n",
      -- 	"<leader>fdb",
      -- 	require("telescope").extensions.dap.list_breakpoints({}),
      -- 	description = "Debugger Breakpoints",
      -- },
      -- {
      -- 	mode = "n",
      -- 	"<leader>fdv",
      -- 	require("telescope").extensions.dap.variables({}),
      -- 	description = "Debugger Variables",
      -- },
      -- {
      -- 	mode = "n",
      -- 	"<leader>fdf",
      -- 	require("telescope").extensions.dap.frames({}),
      -- 	description = "Debugger Frames",
      -- },
      --
    },
  },
  {
    itemgroup = "+Git",
    description = "Version Control Integration",
    icon = "",
    keymaps = {
      {
        mode = "n",
        "<leader>gp",
        function()
          vim.system({ "git", "pull" }, { text = true }, function(result)
            vim.notify(result.stdout)
          end)
        end,
        description = "Git Pull",
      },
      {
        mode = "n",
        "<leader>gb",
        "<cmd>Gitsigns toggle_current_line_blame<CR>",
        description = "Toggle git blame inline",
      },
      {
        mode = "n",
        "<leader>gB",
        "<cmd>Gitsigns blame_line<CR>",
        description = "Toggle git blame for entire buffer",
      },
      {
        mode = "n",
        "<leader>ghp",
        "<cmd>Gitsigns preview_hunk_inline<CR>",
        description = "Preview git hunk inline",
      },
      {
        mode = "n",
        "<leader>ghP",
        "<cmd>Gitsigns preview_hunk<CR>",
        description = "Preview git hunk buffer-wide",
      },
      {
        mode = "n",
        "<leader>ghr",
        "<cmd>Gitsigns reset_hunk<CR>",
        description = "Reset git hunk",
      },

      {
        mode = "n",
        "<leader>ghs",
        "<cmd>Gitsigns stage_hunk<CR>",
        description = "Stage git hunk",
      },
      {
        mode = "n",
        "<leader>gid",
        "<cmd>Gitsigns toggle_word_diff<CR>",
        description = "Toggle inline diff",
      },
      -- git toggles
      {
        mode = "n",
        "<leader>gtn",
        "<cmd>Gitsigns toggle_numhl<CR>",
        description = "Toggle git numline highlight",
      },
      {
        mode = "n",
        "<leader>gth",
        "<cmd>Gitsigns toggle_linehl<CR>",
        description = "Toggle git line highlights",
      },
      {
        mode = "n",
        "<leader>gts",
        "<cmd>Gitsigns toggle_signs<CR>",
        description = "Toggle git signs column highlights",
      },
      {
        mode = "n",
        "<leader>gl",
        "<cmd>Gitsigns setloclist<CR>",
        description = "Toggle git signs column highlights",
      },
      {
        mode = "n",
        "<leader>gf",
        "<cmd>Gitsigns setqflist<CR>",
        description = "Toggle git signs column highlights",
      },
    },
  },
}

M.lsp_mappings = function(bufnr)
  return {
    {
      itemgroup = "+LSP",
      description = "Quick operations based on code project context.",
      icon = "",
      keymaps = {
        {
          mode = "n",
          "fr",
          "<cmd>Telescope lsp_references<CR>",
          description = "LSP Finder",
          buffer = bufnr,
        },
        {
          mode = "n",
          "gd",
          function()
            require("telescope.builtin").lsp_definitions()
          end,
          description = "Peek Definition",
          buffer = bufnr,
        },
        {
          mode = "n",
          "gD",
          function()
            vim.lsp.buf.definition()
          end,
          description = "Go to Definition",
          buffer = bufnr,
        },
        {
          mode = "n",
          "<leader>ca",
          function()
            require("tiny-code-action").code_action()
            -- vim.lsp.buf.code_action()
          end,
          description = "Code Action",
          buffer = bufnr,
          noremap = true,
          silent = true,
        },
        {
          mode = "n",
          "<leader>rn",
          function()
            vim.lsp.buf.rename()
          end,
          description = "Rename Symbol",
          buffer = bufnr,
        },
        {
          mode = "n",
          "<leader>E",
          "<cmd>Trouble symbols toggle<CR>",
          description = "Toggle Outline",
          buffer = bufnr,
        },
        {
          mode = "n",
          "gi",
          function()
            require("telescope.builtin").lsp_implementations()
          end,
          -- require("telescope.builtin").lsp_implementations(),
          -- vim.lsp.buf.implementation,
          description = "Go to Implementation",
          buffer = bufnr,
        },
        {
          mode = "n",
          "<leader>gR",
          function()
            require("telescope.builtin").lsp_references()
          end,
          description = "Find References",
          buffer = bufnr,
        },
        {
          mode = "n",
          "<leader>sh",
          function()
            vim.lsp.buf.signature_help()
          end,
          description = "Signature Help",
          buffer = bufnr,
        },
        {
          mode = "n",
          "[d",
          function()
            vim.diagnostic.goto_prev()
          end,
          description = "Previous Diagnostic",
          buffer = bufnr,
        },
        {
          mode = "n",
          "]d",
          function()
            vim.diagnostic.goto_next()
          end,
          description = "Next Diagnostic",
          buffer = bufnr,
        },
        {
          mode = "n",
          "<leader>e",
          function()
            vim.diagnostic.open_float()
          end,
          description = "Show Diagnostic Under Cursor",
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
          function()
            vim.lsp.buf.workspace_symbol()
          end,
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
        { mode = "n", "<F5>",      dap.continue,          description = "Start/Continue Debugging" },
        { mode = "n", "<F10>",     dap.step_over,         description = "Step Over" },
        { mode = "n", "<F11>",     dap.step_into,         description = "Step Into" },
        { mode = "n", "<F12>",     dap.step_out,          description = "Step Out" },
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
        { mode = "n", "<Leader>dl", dap.run_last,  description = "Run Last Session" },
      },
    },

    {
      itemgroup = "+Harpoon",
      description = "Pin files",
      icon = "󰒥",
      keymaps = {
        {
          "<leader>h",
          icon = "󰒥",
          description = "Harpoon files",
        },
        {
          "<leader>hp",
          function()
            require("harpoon"):list():add()
          end,
          description = "Harpoon file",
        },
        {
          "<leader>hq",
          function()
            require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
          end,
          description = "Harpoon menu",
        },
        {
          mode = "n",
          "<leader>hd",
          function()
            local cursor_highlight =
                vim.fn.synIDattr(vim.fn.synID(vim.fn.line("."), vim.fn.col("."), 1), "name")
            print("Highlight group under cursor: " .. cursor_highlight)
          end,
          description = "Show highlight group under cursor",
        },
      },
    },

    -- Obsidian
    {
      itemgroup = "+Notes",
      description = "Obsidian note management",
      icon = "󰈙",
      keymaps = {
        { "<leader>ns", "<cmd>ObsidianSearch<CR>", description = "Search notes" },
        { "<leader>nN", "<cmd>ObsidianNew<CR>",    description = "New note" },
        { "<leader>nl", "<cmd>ObsidianLink<CR>",   description = "Link note" },
      },
    },
  }
end

return M
