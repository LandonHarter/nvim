return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "BurntSushi/ripgrep"
        },
        callback = function(event)
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = event.buf })
            vim.keymap.set("n", "gI", builtin.lsp_implementations, { buffer = event.buf })
        end
    },
    { "sainnhe/everforest",     name = "everforest", priority = 1000 },
    {
        "gbprod/nord.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("nord").setup {}
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate"
    },
    { "mbbill/undotree" },
    { "williamboman/mason.nvim" },
    { "neovim/nvim-lspconfig" },
    {
        "hrsh7th/cmp-nvim-lsp",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local capabilities = cmp_nvim_lsp.default_capabilities()
            vim.lsp.config("*", {
                capabilities = capabilities,
            })
        end
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "onsails/lspkind.nvim",
        },
        config = function()
            local cmp = require("cmp")

            local luasnip = require("luasnip")

            local lspkind = require("lspkind")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Up>"] = cmp.mapping.select_prev_item(),
                    ["<C-Down>"] = cmp.mapping.select_next_item(),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    -- ["<Esc>"] = cmp.mapping.abort(),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),

                formatting = {
                    format = lspkind.cmp_format({
                        maxwidth = 50,
                        ellipsis_char = "...",
                    }),
                },
            })
        end,
    },
    { "antosha417/nvim-lsp-file-operations", config = {} },
    {
        "stevearc/conform.nvim",
        lazy = false,
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format { async = true, lsp_fallback = true }
                end,
                mode = "",
                desc = "[F]ormat buffer",
            },
        },
        opts = {
            format_on_save = function(bufnr)
                local disable_filetypes = { c = true, cpp = true }
                return {
                    timeout_ms = 500,
                    lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
                }
            end,
            formatters_by_ft = {
                javascript = { "prettier_bun" },
                javascriptreact = { "prettier_bun" },
                typescript = { "prettier_bun" },
                typescriptreact = { "prettier_bun" },
                css = { "prettier_bun" },
                html = { "prettier_bun" },
                json = { "prettier_bun" },
                yaml = { "prettier_bun" },
                markdown = { "prettier_bun" },
            },
            formatters = {
                prettier_bun = { command = "bun", args = { "x", "prettier", "--stdin-filepath", "$FILENAME" }, stdin = true },
            }
        },
    },
    { "nvim-tree/nvim-tree.lua" },
    { "nvim-tree/nvim-web-devicons" },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "athar-qadri/weather.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim", -- Required for HTTP requests
            "rcarriga/nvim-notify",  -- Optional, for notifications
        },
        config = function()
            local weather = require("weather")
            weather:setup({
                settings = {
                    update_interval = 60 * 10 * 1000,
                    minimum_magnitude = 5,
                    temperature_unit = "fahrenheit",
                },
            })
        end,
    },
    { "numToStr/Comment.nvim" },
    { "windwp/nvim-ts-autotag" },
    { "m4xshen/autoclose.nvim" },
    {
        "kylechui/nvim-surround",
        version = "^3.0.0",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end
    },
    { "onsails/lspkind.nvim", event = { "InsertEnter" } },
}
