vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.guicursor = ""
vim.opt.nu = true

vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- disable highlight search of word
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
-- vim.o.breakindent = true

-- vim.o.mouse = 'a'
vim.opt.wrap = false
vim.opt.numberwidth = 4
vim.opt.scrolloff = 8
vim.opt.updatetime = 250
vim.opt.colorcolumn = "80"
vim.wo.number = true
vim.wo.signcolumn = 'yes'
vim.opt.culopt = 'number'
vim.cmd([[autocmd ColorScheme * highlight CursorLineNr cterm=bold guifg=#D19A66 guifg=#D19A66 term=bold gui=bold]])
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.list = false
vim.g.snips_author = "liepieshov"
vim.g.snips_email = "liepieshov@gmail.com"
vim.g.snips_github = "liepieshov"
-- vim.o.clipboard = 'unnamedplus'
-- vim.o.timeout = true
-- vim.o.timeoutlen = 300

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})
vim.o.completeopt = 'menuone,noselect'
