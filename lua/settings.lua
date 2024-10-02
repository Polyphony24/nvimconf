local g = vim.g
local o = vim.o
local opt = vim.opt
local map = vim.keymap.set
local opts = { silent = true }


g.mapleader = " "
g.maplocalleader = " "
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
o.number = true
o.relativenumber = true
o.cursorline = true
o.autoindent = true
o.wrap = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.mouse = 'a'
--o.signcolumn = "yes"
--o.clipboard = "unnamedplus"
opt.whichwrap:append("<,>,h,l,[,]")
opt.termguicolors = true
opt.scrolloff = 8
--opt.colorcolumn = "80"

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- binds:
map('n', 'h', ';')
map('n', ';', 'l', opts)
map('n', 'l', 'h', opts)
map('n', '<C-w>;', '<C-w>l', opts)
map('n', '<C-w>l', '<C-w>h', opts)

map('i', 'jj', '<Esc>', opts)
map('i', 'jk', '<Esc>', opts)
map('i', 'kk', '<Esc>', opts)

map('v', ';', 'l', opts)
map('v', 'l', 'h', opts)

map('v', "J", ":m '>+1<CR>gv=gv")
map('v', "K", ":m '<-2<CR>gv=gv")

map('n', "Q", "<nop>")
map('n', "<C-z>", "<nop>")
map('n', "<C-Z>", "<nop>")
