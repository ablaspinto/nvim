vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set termguicolors")
vim.keymap.set("n","<C-n>",vim.cmd.Ex)
vim.g.mapleader = " "
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('i','gg',"<Shift-v>",{noremap = true, silent = true})
vim.keymap.set('n','<leader>ccx',':Git commit<CR>',{} )
vim.keymap.set('n','<leader>aac',':Git add . <CR>', {})
vim.opt.clipboard:append("unnamedplus")

