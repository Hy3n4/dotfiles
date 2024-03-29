require("formatter").setup({
	filetype = {
		terraform = {
			function()
				return {
					exe = "terraform",
					args = { "fmt", "-" },
					stdin = true,
				}
			end,
		},
		hcl = {
			function()
				return {
					exe = "terragrunt",
					args = { "hclfmt" },
					stdin = false,
				}
			end,
		},
		python = {
			require("formatter.filetypes.python").black,
		},
		go = {
			require("formatter.filetypes.go").gofmt,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		-- yaml = {
		-- 	require("formatter.filetypes.yaml").prettier,
		-- },
		["*"] = {
			function()
				return {
					-- remove trailing whitespace
					exe = "sed",
					args = { "-i", "''", "'s/[	 ]*$//'" },
					stdin = false,
				}
			end,
		},
	},
})

-- Call formatter on each save
vim.cmd([[
augroup Format
    autocmd!
    autocmd BufWritePost * FormatWrite
augroup END
]])
