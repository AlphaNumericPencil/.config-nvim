require("config.lazy")

-- Clear prefixes for plugins
-- require('transparent').clear_prefix('lualine_c')
-- require('transparent').clear_prefix('NeoTree')
-- require('transparent').clear_prefix('DropBar')
-- require('transparent').clear_prefix('Bufferline')

vim.o.cmdheight = 0
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.o.signcolumn = "yes"

-- vim.cmd.set = "termguicolors"
--
-- vim.api.nvim_create_augroup("NotifyBackgroundFix", { clear = true })
-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	group = "NotifyBackgroundFix",
-- 	pattern = "*",
-- 	callback = function()
-- 		-- Adjust "#000000" (or use "NONE" if you want transparency)
-- 		vim.cmd("highlight NotifyBackground guibg=#000000")
-- 	end,
-- })
--
-- -- Also set it right away if a colorscheme is already loaded
-- vim.cmd("highlight NotifyBackground guibg=#000000")
