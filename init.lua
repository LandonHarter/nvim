require("landon")
require("config.lazy")

vim.cmd.colorscheme "everforest"

vim.opt.relativenumber = true
vim.opt.wrap = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

for _, mode in pairs({ 'n', 'i', 'v' }) do
    vim.keymap.set(mode, '<Up>', '<Nop>', { noremap = true, silent = true })
    vim.keymap.set(mode, '<Down>', '<Nop>', { noremap = true, silent = true })
    vim.keymap.set(mode, '<Left>', '<Nop>', { noremap = true, silent = true })
    vim.keymap.set(mode, '<Right>', '<Nop>', { noremap = true, silent = true })
end
