return {
	"folke/neodev.nvim",
	config = function()
		require('neodev').setup({
			library = {
				enabled = true,
				runtime = true,
				types = true,
				plugins = true,
				--plugins = { "nvim-dap-ui" },
			},
			lspconfig = true
		})
	end,
}
