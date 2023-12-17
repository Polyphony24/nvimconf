return {
	'nvim-tree/nvim-web-devicons',
	config = function()
		require 'nvim-web-devicons'.setup {
			override = {
				rust = {
					icon = "",
				}
			},
		}
		require("nvim-web-devicons").set_icon {
			toml = {
				icon = "",
			}
		}
	end
}
