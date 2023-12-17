return {
	'neoclide/coc.nvim',
	branch = 'release',
	lazy = false,
	config = function()
		--format
		vim.keymap.set('n', '<leader>F',
			'<Cmd>CocCommand editor.action.formatDocument<CR> <Cmd>CocCommand editor.action.organizeImport<CR>')
		vim.keymap.set('n', '<leader>v', '<Cmd>CocCommand document.toggleInlayHint<Cr>')
		-- confirm
		vim.keymap.set('i', '<Tab>', [[coc#pum#visible() ? coc#pum#confirm() : '<Tab>']],
			{ silent = true, noremap = true, expr = true, replace_keycodes = false })
		-- down
		vim.keymap.set('i', '<C-j>',
			'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<C-j>" : coc#refresh()',
			{ silent = true, noremap = true, expr = true, replace_keycodes = false })
		-- up
		vim.keymap.set('i', '<C-k>', [[coc#pum#visible() ? coc#pum#prev(1) : '<C-k>']],
			{ silent = true, noremap = true, expr = true, replace_keycodes = false })
	end
}
