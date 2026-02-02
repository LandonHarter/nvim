require("landon")
require("config.lazy")

vim.cmd.colorscheme "everforest"

vim.keymap.set("n", "<C-i>", function() vim.cmd("!run.bat") end)
vim.opt.number = true
vim.opt.wrap = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
