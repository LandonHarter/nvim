require("landon")
require("config.lazy")

vim.cmd.colorscheme "catppuccin"

vim.keymap.set("n", "<C-i>", function() vim.cmd("!run.bat") end)
vim.opt.number = true
