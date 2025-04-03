return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"jdtls",
					"rust_analyzer",
					"taplo",
					"gopls",
					"html",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			--[[lspconfig.ruff.setup({
				capabilities = capabilities,
				filetypes = "python",
			})]]--
			lspconfig.clangd.setup({
				on_attach = on_attach,
				capabilities = cmp_nvim_lsp.default_capabilities(),
				cmd = {
					"clangd",
					"--offset-encoding=utf-16",
					"--enable-config",
				},
			})
			--[[lspconfig.ccls.setup({
				--capabilities = capabilities,
				init_options = {
					cache = {
						directory = ".ccls-cache",
					},
				},
			})]]
			lspconfig.jdtls.setup({})
			lspconfig.rust_analyzer.setup({})
			lspconfig.taplo.setup({})
			lspconfig.gopls.setup({})
			lspconfig.ts_ls.setup({})
			lspconfig.pylsp.setup({
				--on_attach = custom_attach,
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = {
								ignore = { "W391" },
								maxLineLength = 100,
							},
						},
					},
				},
			})
			lspconfig.texlab.setup({
				settings = {
					texlab = {
						auxDirectory = ".",
						bibtexFormatter = "texlab",
						build = {
							args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
							executable = "latexmk",
							forwardSearchAfter = false,
							onSave = false,
						},
						chktex = {
							onEdit = false,
							onOpenAndSave = false,
						},
						diagnosticsDelay = 300,
						formatterLineLength = 80,
						forwardSearch = {
							args = {},
						},
						latexFormatter = "latexindent",
						latexindent = {
							modifyLineBreaks = false,
						},
					},
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>jd", vim.lsp.buf.definition, opts)
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>ji", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>F", function()
						vim.lsp.buf.format({ async = true })
					end, opts)
				end,
			})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
