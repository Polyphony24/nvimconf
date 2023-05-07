local opt = vim.opt vim.cmd('colorscheme nightfox')
opt.whichwrap = "<>[]hl"
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.colorcolumn = '86'
opt.autoindent = true
opt.showmatch = true
opt.tabstop = 4
opt.softtabstop = 4
opt.smarttab = true
opt.encoding = 'UTF-8'
opt.shiftwidth = 4
vim.cmd('hi MatchParen cterm=none gui=underline')

-- NERDTREE --
vim.cmd("autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif")
vim.cmd("autocmd VimEnter * NERDTree | wincmd p")
vim.cmd("let g:NERDTreeDirArrowCollapsible = ''")
vim.cmd("let g:NERDTreeDirArrowExpandable = ''")
vim.cmd("let NERDTreeIgnore = ['\\.class$']")

-- BARBAR --
require('barbar').setup {
	animation = true,
	auto_hide = false,
	tabpages = true,
	icons = {
		button = '×',
		filetype = {
			custom_colors = false,
			enabled = true,
		},
		separator = {left = '▎', right = ''},
		modified = {button = '●'},
		pinned = {button = '車', filename = true, separator = {right = ''}},
		alternate = {filetype = {enabled = false}},
		current = {buffer_index = true},
		inactive = {button = '×'},
		visible = {modified = {buffer_number = false}},
	},
	-- Set the filetypes which barbar will offset itself for
	sidebar_filetypes = {},
}

-- LUALINE --
require('lualine').setup {
	options = {
		theme = 'auto',
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
}

-- COC --
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"

-- TOGGLETERM --
require("toggleterm").setup{
	start_in_insert = false,
	direction = 'float',
	autochdir = true
}

-- AUTOPAIRS --
require('nvim-autopairs').setup()
-- there are many good rules to add here once I realize shit is annoying

-- NVIM-TREESITTER --
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "rust", "java", "python" },
  highlight = {
    enable = false,
  },
}

-- NVIM-TREESITTER-CONTEXT --
require'treesitter-context'.setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 2, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
}
