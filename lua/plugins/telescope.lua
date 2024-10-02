return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
--						["<C-j>"] = require("telescope.actions").cycle_history_next,
--						["<C-k>"] = require("telescope.actions").cycle_history_prev,
					},
				},
			},
		})
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>lf", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>f", builtin.find_files, {})
		vim.keymap.set("n", "<leader>t", builtin.builtin, {})
		vim.keymap.set("n", "<leader>m", builtin.man_pages, {})
		vim.keymap.set("n", "<leader>g", builtin.git_status, {})
	end,
}
