local harpoon = require("harpoon")
vim.notify = require("notify")

harpoon:setup()

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({ results = file_paths }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<leader>a", function()
    local list = harpoon:list()
    list:add()
    vim.notify("Harpoon: added to slot " .. list:length(), vim.log.levels.INFO)
end)
vim.keymap.set("n", "<leader>r", function()
    local list = harpoon:list()
    local current = vim.fn.expand("%:.")
    list:remove()
    vim.notify("Harpoon: removed " .. current, vim.log.levels.WARN)
end)
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end)
vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end)
