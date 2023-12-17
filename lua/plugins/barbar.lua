return {
	"romgrk/barbar.nvim",
	config = function()
		vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>')
		vim.keymap.set('n', '<Tab>', '<Cmd>BufferNext<CR>')
	end
}
