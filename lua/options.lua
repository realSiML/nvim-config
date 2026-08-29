-- [[ Leader keys ]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Display ]]
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.signcolumn = 'yes'
vim.o.winborder = 'rounded'
vim.o.wrap = false
vim.o.scrolloff = 10
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.termguicolors = true
vim.g.have_nerd_font = true

-- [[ Splits ]]
vim.o.splitbelow = true
vim.o.splitright = true

-- [[ Search ]]
vim.o.ignorecase = true
vim.o.smartcase = true

-- [[ Indentation ]]
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- [[ Behavior ]]
vim.o.confirm = true
vim.o.inccommand = 'split'
vim.o.mouse = 'a'
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- [[ Files & Undo ]]
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath('data') .. '/undodir'

-- [[ Statusline ]]
vim.o.laststatus = 3
vim.o.showmode = false

-- [[ Completion ]]
vim.opt.completeopt = 'menuone,noselect,fuzzy,nosort'
vim.opt.shortmess:append('c')

-- [[ Misc ]]
vim.opt.isfname:append('@-@')

vim.o.langmap = 'йЙцЦуУкКеЕнНгГшШщЩзЗхХъЪфФыЫвВаАпПрРоОлЛдДжЖэЭяЯчЧсСмМиИтТьЬбБюЮ.\\,;qQwWeErRtTyYuUiIoOpP[{]}aAsSdDfFgGhHjJkKlL\\;:\'"zZxXcCvVbBnNmM\\,<.>/?'

-- [[ Clipboard ]]
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- [[ Autocommands ]]
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
