return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = 15,
				open_mapping = [[<C-t>]],
				hide_numbers = true,
				shade_terminals = false, -- Absolute must: tells ToggleTerm not to darken the window
				direction = "horizontal",
				close_on_exit = true,
				shell = vim.o.shell,
				-- Directly links every terminal window layer to your main Neovim background
				highlights = {
					Normal = {
						link = "Normal",
					},
					NormalFloat = {
						link = "Normal",
					},
					Terminal = {
						link = "Normal",
					},
					EndOfBuffer = {
						link = "Normal",
					},
				},
			})

			-- Terminal shortcut mechanics
			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "<C-t>", [[<Cmd>ToggleTerm<CR>]], opts)
				vim.keymap.set("t", "<C-w>h", [[<C-\><C-n><C-w>h]], opts)
				vim.keymap.set("t", "<C-w>j", [[<C-\><C-n><C-w>j]], opts)
				vim.keymap.set("t", "<C-w>k", [[<C-\><C-n><C-w>k]], opts)
				vim.keymap.set("t", "<C-w>l", [[<C-\><C-n><C-w>l]], opts)
			end

			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		end,
	},
}
