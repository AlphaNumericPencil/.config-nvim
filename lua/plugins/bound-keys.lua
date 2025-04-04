return {
  "nvim-lua/plenary.nvim",        -- Required dependency for many plugins. Super useful Lua functions
  {
    "mrjones2014/legendary.nvim", -- A command palette for keymaps, commands and autocmds
    priority = 10000,
    lazy = false,
    dependencies = { "kkharji/sqlite.lua" },
    keys = {
      {
        "<C-p>",
        function()
          require("legendary").find()
        end,
        desc = "Open Legendary",
      },
    },
    config = function()
      local legendary = require("legendary")
      -- Register your keybindings with Legendary
      legendary.keymaps({
        --[[   { ]]
        --[[     "<leader>T", ]]
        --[[     "<cmd>Themery<cr>", ]]
        --[[     desc = "Reveal file in Neo-tree", ]]
        --[[   }, ]]
        --[[   { ]]
        --[[     "<leader>nnp", ]]
        --[[     "<cmd>NoNeckPain<cr>", ]]
        --[[     desc = "Toggle No Neck Pain", ]]
        --[[   }, ]]
        --[[   { ]]
        --[[     "<leader>nwu", ]]
        --[[     "<cmd>NoNeckPainWidthUp<cr>", ]]
        --[[     desc = "Increase No Neck Pain Width", ]]
        --[[   }, ]]
        --[[   { ]]
        --[[     "<leader>nwd", ]]
        --[[     "<cmd>NoNeckPainWidthDown<cr>", ]]
        --[[     desc = "Decrease No Neck Pain Width", ]]
        --[[   }, ]]
        --[[   { ]]
        --[[     "<leader>nns", ]]
        --[[     "<cmd>NoNeckPainScratchPad<cr>", ]]
        --[[     desc = "Increase No Neck Pain Width", ]]
        --[[   }, ]]
        --[[   { ]]
        --[[     "<Leader>nf", ]]
        --[[     function() ]]
        --[[       require("neogen").generate({ type = "func" }) ]]
        --[[     end, ]]
        --[[     desc = "Generate function doc", ]]
        --[[   }, ]]
        --[[   -- Neo-tree Keybindings ]]
        --[[   { ]]
        --[[     "|", ]]
        --[[     "<cmd>Neotree reveal<cr>", ]]
        --[[     desc = "Reveal file in Neo-tree", ]]
        --[[   }, ]]
        --[[   { ]]
        --[[     "rf", ]]
        --[[     "<cmd>Neotree float reveal_file=<cfile> reveal_force_cwd<cr>", ]]
        --[[     desc = "Reveal file in floating Neo-tree (force cwd)", ]]
        --[[   }, ]]
        --[[   { ]]
        --[[     "<leader>B", ]]
        --[[     "<cmd>Neotree toggle show buffers right<cr>", ]]
        --[[     desc = "Toggle buffer list in Neo-tree (right)", ]]
        --[[   }, ]]
        --[[   { ]]
        --[[     "<leader>s", ]]
        --[[     "<cmd>Neotree float git_status<cr>", ]]
        --[[     desc = "Open git status in floating Neo-tree", ]]
        --[[   }, ]]
        --[[   { ]]
        --[[     "<leader>o", ]]
        --[[     "<cmd>Neotree toggle<cr>", ]]
        --[[     desc = "Toggle Neo-tree (filesystem)", ]]
        --[[   }, ]]
        --[[   -- Bufferline Keybindings ]]
        --[[   { ]]
        --[[     "<M-PageUp>", ]]
        --[[     "<cmd>BufferLineCyclePrev<CR>", ]]
        --[[     desc = "Previous buffer", ]]
        --[[   }, ]]
        --[[   { ]]
        --[[     "<M-PageDown>", ]]
        --[[     "<cmd>BufferLineCycleNext<CR>", ]]
        --[[     desc = "Next buffer", ]]
        --[[   }, ]]
        --[[   { ]]
        --[[     "<leader>q", ]]
        --[[     "<cmd>bp|bd #<CR>", ]]
        --[[     desc = "Close current buffer", ]]
        --[[   }, ]]
        --[[   { ]]
        --[[     "<leader>ng", ]]
        --[[     ":lua require('neogen').generate()<CR>", ]]
        --[[     desc = "Generate documentation", ]]
        --[[   }, ]]
        --[[   -- Telescope Keybindings ]]
        --[[   { ]]
        --[[     "<leader>ff", ]]
        --[[     require("telescope.builtin").find_files, ]]
        --[[     desc = "Find Files", ]]
        --[[   }, ]]
        --[[   { ]]
        --[[     "<leader>fg", ]]
        --[[     require("telescope.builtin").live_grep, ]]
        --[[     desc = "Live Grep", ]]
        --[[   }, ]]
        --[[   { ]]
        --[[     "<leader>fb", ]]
        --[[     require("telescope.builtin").buffers, ]]
        --[[     desc = "Find Buffers", ]]
        --[[   }, ]]
        --[[   { ]]
        --[[     "<leader>fh", ]]
        --[[     require("telescope.builtin").help_tags, ]]
        --[[     desc = "Help Tags", ]]
        --[[   }, ]]
        --[[ }) ]]
        -- DAP Keymaps (global)
        --[[   { mode = 'n', '<F5>', function() require('dap').continue() end, desc = 'Start/Continue Debugging' }, ]]
        --[[   { mode = 'n', '<F10>', function() require('dap').step_over() end, desc = 'Step Over' }, ]]
        --[[   { mode = 'n', '<F11>', function() require('dap').step_into() end, desc = 'Step Into' }, ]]
        --[[   { mode = 'n', '<F12>', function() require('dap').step_out() end, desc = 'Step Out' }, ]]
        --[[   { mode = 'n', '<Leader>b', function() require('dap').toggle_breakpoint() end, desc = 'Toggle Breakpoint' }, ]]
        --[[   { ]]
        --[[     mode = 'n', ]]
        --[[     '<Leader>B', ]]
        --[[     function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, ]]
        --[[     desc = 'Set Conditional Breakpoint' ]]
        --[[   }, ]]
        --[[   { mode = 'n', '<Leader>dr', function() require('dap').repl.open() end, desc = 'Open REPL' }, ]]
        --[[   { mode = 'n', '<Leader>dl', function() require('dap').run_last() end, desc = 'Run Last Debug Session' }, ]]
      })
    end,
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end,
  },

  -- lazy = true, -- Optionally load it only when required
}
