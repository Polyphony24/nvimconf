local g = vim.g
local o = vim.o local opt = vim.opt
local map = vim.keymap.set
opts = { silent = true }


o.number = true
o.relativenumber = true
--o.signcolumn = "yes"
o.cursorline = true
o.autoindent = true
o.wrap = true
opt.whichwrap:append("<,>,h,l,[,]")
opt.termguicolors = true
opt.scrolloff = 8
--opt.colorcolumn = "80"
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.clipboard = "unnamedplus"
g.mapleader = " "
g.maplocalleader = " "
o.mouse = ''

-- binds:
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
