return {
	"akinsho/toggleterm.nvim",
	version = '*',
	config = function()
		require("toggleterm").setup({
			start_in_insert = true,
			shade_terminals = true,
			persist_mode = true,
			direction = 'float',
			float_opts = {
				border = 'curved',
			},

		})
		vim.keymap.set('n', '<leader>t', '<Cmd>ToggleTerm<CR>')
		vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
	end,
}
