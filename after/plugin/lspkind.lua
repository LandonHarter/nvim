-- require('lspkind').init({
--     mode = "symbol_text",
--     preset = 'codicons',
--     symbol_map = {
--         Text = "",
--         Method = "",
--         Function = "",
--         Constructor = "",
--         Field = "",
--         Variable = "",
--         Class = "",
--         Interface = "",
--         Module = "",
--         Property = "",
--         Unit = "",
--         Value = "",
--         Enum = "",
--         Keyword = "",
--         Snippet = "",
--         Color = "",
--         File = "",
--         Reference = "",
--         Folder = "",
--         EnumMember = "",
--         Constant = "",
--         Struct = "",
--         Event = "",
--         Operator = "",
--         TypeParameter = "",
--     },
-- })

local cmp = require('cmp')
local lspkind = require('lspkind')

local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

cmp.setup({
    window = {
        completion = cmp.config.window.bordered({
            border = "rounded",
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
            side_padding = 1,
        }),
        documentation = cmp.config.window.bordered({
            border = "rounded",
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        }),
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            if kind_icons[vim_item.kind] then
                vim_item.kind = kind_icons[vim_item.kind]
            end

            local item = entry:get_completion_item()
            if entry.source.name == "nvim_lsp" and item.detail then
                vim_item.menu = string.sub(item.detail, 1, 50) .. "..."
            else
                vim_item.menu = ({
                    buffer = "[Buf]",
                    luasnip = "[Snip]",
                    path = "[Path]",
                })[entry.source.name] or ""
            end

            return vim_item
        end,
    },

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})
