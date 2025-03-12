-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Visual
vim.opt.termguicolors = true

-- Keymaps
vim.g.mapleader = " "
vim.keymap.set("n", "<C-n>", vim.cmd.Ex)
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('i', 'gg', "<Shift-v>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ccx', ':Git commit<CR>', { desc = "Git commit" })
vim.keymap.set('n', '<leader>aac', ':Git add .<CR>', { desc = "Git add all" })

-- Clipboard and messages
vim.opt.clipboard:append("unnamedplus")
vim.opt.shortmess:append('s')
