return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				python = { "black" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				dart = { "dart_format" },
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
			-- Custom overrides for your specific formatters!
			formatters = {
				["clang-format"] = {
					-- Pass the 4-space indent rule directly to the command line execution
					prepend_args = { "-style={BasedOnStyle: Google, IndentWidth: 4}" },
				},
				["prettier"] = {
					-- Tell prettier to drop the 2-space rule and use 4
					prepend_args = { "--tab-width", "4" },
				},
			},
		},
		config = function(_, opts)
			local conform = require("conform")
			conform.setup(opts)

			vim.keymap.set({ "n", "v" }, "<leader>fm", function()
				conform.format({
					lsp_format = "fallback",
					async = false,
					timeout_ms = 500,
				})
			end, { desc = "Format current buffer" })
		end,
	},
}
