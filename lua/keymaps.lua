-- -- [[ Basic Keymaps ]]
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down", silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up", silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move lines down in visual selection", silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move lines up in visual selection", silent = true })

vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Buffer: Delete' })

-- vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
-- vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })

-- vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })

-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- -- vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
-- -- vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
-- -- vim.keymap.set("n", "<space>qq", vim.diagnostic.setqflist)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- -- vim.keymap.set("n", "<space>qe", function() vim.diagnostic.setqflist({ severity = 'error' }) end)
-- -- vim.keymap.set("n", "<space>qw", function() vim.diagnostic.setqflist({ severity = 'warn' }) end)

-- -- [[ Undo Tree ]]
vim.keymap.set("n", "<leader>u", function()
    vim.cmd.packadd("nvim.undotree")
    require("undotree").open()
end, { desc = "Toggle Builtin Undotree" })

-- -- [[ LSP ]]
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format Local buffer" })
-- vim.keymap.set("n", "df", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

-- -- [[ Oil ]]
-- vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory in current window" })
-- vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "Open parent directory in floating window" })

-- -- [[ Telescope ]]
-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
-- vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope Keymaps' })

-- -- [[ Code Actions ]]
-- vim.keymap.set("n", "<leader>ca", require('tiny-code-action').code_action, { silent = true, desc = "LSP Code Actions" })
