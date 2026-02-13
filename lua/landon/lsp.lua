vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("jsonls")

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
