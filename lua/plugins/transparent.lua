return {
	'xiyaowong/transparent.nvim',
	config = function()
		vim.keymap.set('n', '<leader>b', '<Cmd>TransparentToggle<CR>')
	end
}
