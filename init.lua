require("landon")
require("config.lazy")

vim.cmd.colorscheme "nord"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
-- vim.opt.cmdheight = 0

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "dr", "v$hd<Esc>")
vim.keymap.set("n", "cp", function()
    local char = vim.fn.getcharstr()

    if char == '\27' or char == '\3' then
        return
    end

    local line = vim.api.nvim_get_current_line()
    local _, col = unpack(vim.api.nvim_win_get_cursor(0))

    local start_idx, end_idx = string.find(line, char, col + 1, true)
    if end_idx then
        local new_line = string.sub(line, 1, end_idx)
        vim.api.nvim_set_current_line(new_line)
        vim.cmd('startinsert!')
    end
end)

for _, mode in pairs({ 'n', 'i', 'v' }) do
    vim.keymap.set(mode, '<Up>', '<Nop>', { noremap = true, silent = true })
    vim.keymap.set(mode, '<Down>', '<Nop>', { noremap = true, silent = true })
    vim.keymap.set(mode, '<Left>', '<Nop>', { noremap = true, silent = true })
    vim.keymap.set(mode, '<Right>', '<Nop>', { noremap = true, silent = true })
end
