return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>lf', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>f', builtin.find_files, {})
	end
}
