vim.g.mapleader = " "

vim.keymap.set("n", "db", function()
    local char = vim.fn.getcharstr()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local line = vim.api.nvim_get_current_line()
    local sub = line:sub(1, col + 1)
    local pos = sub:find(vim.pesc(char) .. "[^" .. vim.pesc(char) .. "]*$")
    if not pos then return end
    local indent = line:match("^%s*"):len()
    vim.api.nvim_buf_set_text(0, row - 1, indent, row - 1, pos, {})
end)
