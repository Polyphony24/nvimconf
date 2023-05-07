local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

vim.g.mapleader = ' '

-- normal
map('i', 'jj', '<Esc>')

-- jkl;
map('n', ';', 'l')
map('n', 'l', 'h')
map('v', ';', 'l')
map('v', 'l', 'h')

-- window navigation
map('n', '<C-w>;', '<C-w>l')
map('n', '<C-w>l', '<C-w>h')

-- undo
map('n', '<C-z>', 'u')
map('i', '<C-z>', '<Esc> u i')

-- redo
map('n', '<C-y>', '<C-r>')
map('i', '<C-y>', '<Esc> <C-r> i')

-- vertical split
map('n', '<Leader>s', ':vs <CR>')

-- BARBAR --
map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>')
map('n', '<Tab>', '<Cmd>BufferNext<CR>')

-- COC --
-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
-- CTRL J and CTRL K moves up and down the autocomplete menu
vim.keymap.set("i", "<C-j>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
vim.keymap.set("i", "<C-k>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
-- Tab complete
-- old not sure why mine works, something may be wrong
--vim.keymap.set("i", "<Tab>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
vim.keymap.set("i", "<Tab>", [[coc#pum#visible() ? coc#pum#confirm() : "<Tab>"]], opts)

-- TOGGLETERM --
map('n', '<Leader>t', ':ToggleTerm <CR>')
map('t', '<Esc>', '<C-\\><C-n>')

