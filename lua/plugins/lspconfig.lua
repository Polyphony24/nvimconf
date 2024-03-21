return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require('mason-lspconfig').setup({
				ensure_installed = { 'lua_ls', 'clangd', 'jdtls', 'pylsp', 'rust_analyzer', 'taplo', 'gopls' }
				-- java_language_server/jdtls
				-- jedi_language_server/pyre/pyright/pylyzer/sourcery/pylsp/ruff_lsp
			})
		end
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			local lspconfig = require('lspconfig')
			lspconfig.lua_ls.setup {
				capabilities = capabilities
			}
			lspconfig.clangd.setup {}
			lspconfig.jdtls.setup {}
			lspconfig.bashls.setup {}
			lspconfig.pylsp.setup {}
			lspconfig.rust_analyzer.setup {}
			lspconfig.taplo.setup {}
			lspconfig.gopls.setup {}

			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

					local opts = { buffer = ev.buf }
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
					vim.keymap.set('n', '<leader>F', function()
						vim.lsp.buf.format { async = true }
					end, opts)
				end,
			})
		end
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			require('telescope').setup({
				extensions = {
					["ui-select"] = {
						require('telescope.themes').get_dropdown {}
					}
				}
			})
			require('telescope').load_extension('ui-select')
		end
	}
}
