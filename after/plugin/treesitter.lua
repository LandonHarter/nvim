require('nvim-treesitter').install({
    "java",
    "lua",
    "typescript",
    "prisma",
    "json",
    "rust",
    "glsl",
    "cpp",
    "dockerfile",
    "tsx"
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = {
        "java",
        "lua",
        "typescript",
        "prisma",
        "json",
        "rust",
        "glsl",
        "cpp",
        "dockerfile",
        "tsx"
    },
    callback = function() vim.treesitter.start() end,
})
