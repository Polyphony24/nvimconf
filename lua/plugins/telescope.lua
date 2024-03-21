return {
	'nvim-telescope/telescope.nvim',
	--tag = '0.1.5',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>lf', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>f', builtin.find_files, {})
		vim.keymap.set('n', '<leader>t', builtin.builtin, {})
		vim.keymap.set('n', '<leader>m', builtin.man_pages, {})
		vim.keymap.set('n', '<leader>g', builtin.git_status, {})
	end
}
