-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = vim.keymap

map.set(
    "n",
    "<leader>sx",
    require("telescope.builtin").resume,
    { 
        noremap = true,
        silent = true,
        desc = "Resume"
    })

map.del("n", "<leader>gg")
map.del("n", "<leader>gG")

-- Add a map to launch gitui into a floating terminal window
map.set("n", "<leader>gg", function ()
    require("lazy.util").float_term({ "gitui" }, {
        terminal = true,
        close_on_exit = false,
        enter = true,
        float = {
            size = { width = 0.9, height = 0.9 },
            margin = { top = 0, right = 0, bottom = 0, left = 0 },
        },
    })
end, { desc = "Gitui" })
