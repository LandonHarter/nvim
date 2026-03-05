vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("jsonls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("clangd")
vim.lsp.enable("prismals")
vim.lsp.enable("bashls")
vim.lsp.enable("dockerls")
vim.lsp.enable("glsl_analyzer")
vim.lsp.enable("tailwindcss")
vim.lsp.enable("jdtls")

local severity = vim.diagnostic.severity
vim.diagnostic.config({
    signs = {
        text = {
            [severity.ERROR] = " ",
            [severity.WARN] = " ",
            [severity.HINT] = "󰠠 ",
            [severity.INFO] = " ",
        },
    },
    virtual_text = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        source = "always",
    }
})
