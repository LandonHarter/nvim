vim.g.mapleader = " "

vim.keymap.set("n", "<leader>p", vim.cmd.Ex)

vim.keymap.set("n", "<C-t>", ":vsplit<CR><C-w>l:terminal<CR>")
vim.keymap.set('n', '<C-o>', "<C-w>w")
vim.keymap.set("t", "<C-o>", "<C-\\><C-n><C-w>w")
