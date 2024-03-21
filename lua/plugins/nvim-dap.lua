return {
	{
		'nvim-telescope/telescope-dap.nvim',
		config = function ()
			require('telescope').load_extension('dap')
		end
	},
	{
		'theHamsta/nvim-dap-virtual-text',
		config = function()
			require('nvim-dap-virtual-text').setup({})
		end
	},
	{
		'mfussenegger/nvim-dap',
		config = function()
			local dap = require("dap")

			dap.adapters.gdb = {
				type = "executable",
				command = "gdb",
				args = { "-i", "dap" }
			}
			local gdb = {
				name = "Launch gdb",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
				runInTerminal = false,
			}

			dap.configurations.c = {
				gdb
			}

			vim.keymap.set('n', '<leader>sb', function() require('dap').toggle_breakpoint() end)
		end
	},
	--[[
	{
		'rcarriga/nvim-dap-ui',
		config = function()
			require("dapui").setup()
		end
	}
	]]--
}
