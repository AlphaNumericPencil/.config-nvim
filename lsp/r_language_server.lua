---@brief
---
--- [languageserver](https://github.com/REditorSupport/languageserver) is an
--- implementation of the Microsoft's Language Server Protocol for the R
--- language.
---
--- It is released on CRAN and can be easily installed by
---
--- ```r
--- install.packages("languageserver")
--- ```
return {
	cmd = { "R", "--no-echo", "-e", "languageserver::run()" },
	filetypes = { "r", "rmd", "quarto" },
	root_dir = function(bufnr, on_dir)
		on_dir(vim.fs.root(bufnr, ".git") or vim.uv.os_homedir())
	end,
}
