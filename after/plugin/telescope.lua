local builtin = require('telescope.builtin')

require("telescope").setup({
    defaults = {
        file_ignore_patterns = {
            "node_modules",
            ".git",
            ".next",
            ".claude",
            "target",
            "META-INF",
            ".cache",
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
})

vim.keymap.set('n', '<C-e>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-f>', builtin.live_grep, { desc = 'Telescope live grep' })
