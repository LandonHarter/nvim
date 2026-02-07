vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set('n', '<C-p>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<C-l>', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
end

require("nvim-tree").setup({
    on_attach = my_on_attach,
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
        git_ignored = true,
        exclude = {
            ".env",
            ".env.local",
            ".env.development",
            ".env.production",
            "CLAUDE.md"
        }
    },
})
