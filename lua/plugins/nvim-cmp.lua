
-- local has_words_before = function()
--     unpack = unpack or table.unpack
--     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--     return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end






return {
    {
        "L3MON4D3/LuaSnip",
        keys = function()
            return {}
        end,
    },
    -- then: setup supertab in cmp
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-emoji",
        },
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local luasnip = require("luasnip")
            local cmp = require("cmp")

            opts.mapping = vim.tbl_extend("force", opts.mapping, {
                -- Define the down arrow to select the next item in the completion menu
                ["<Down>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                -- Define the up arrow to select the previous item in the completion menu
                ["<Up>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                -- ["<Tab>"] = cmp.mapping(function(fallback)
                --     if cmp.visible() then
                --         cmp.select_next_item()
                --         -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                --         -- this way you will only jump inside the snippet region
                --     elseif luasnip.expand_or_jumpable() then
                --         luasnip.expand_or_jump()
                --     elseif has_words_before() then
                --         cmp.complete()
                --     else
                --         fallback()
                --     end
                -- end, { "i", "s" }),
                -- ["<S-Tab>"] = cmp.mapping(function(fallback)
                --     if cmp.visible() then
                --         cmp.select_prev_item()
                --     elseif luasnip.jumpable(-1) then
                --         luasnip.jump(-1)
                --     else
                --         fallback()
                --     end
                -- end, { "i", "s" }),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<Esc>"] = cmp.mapping({
                    i = cmp.mapping.abort(),
                    c = function()
                        if cmp.visible() then
                            cmp.close()
                        else
                            vim.api.nvim_feedkays(vim.api.nvim_replace_termcodes("<C-c>", true, true, true), "n", true)
                        end
                    end,
                }),
                --["<C-t>"] = { 
                --    "copilot#Accept('\\<CR>')", 
                --    desc = "copilot expand", 
                --    silent = true, 
                --    expr = true, 
                --    script = true
                --},
            })
        end,
    },
}









-- vim.opt.completeopt = "menu,menuone,noselect"





--[[
return {
    "nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-emoji",
        {
            "zbirenbaum/copilot-cmp",
            opts = {}
        },
        "L3MON4D3/LuaSnip",
    },

    config = function(_, opts)
        -- TODO: This is should be the cmp configuration with its custom bindings?
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        opts.mapping = {
            ["<Tab>"] = cmp.mapping(
                function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(
                function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end,
                { "i", "s" }),
            ["<CR>"] = cmp.mapping()
        }

        cmp.setup(opts)

    end,

}
]]




-- M.opts = function(_, opts)
-- 
--     local cmp = require("cmp")
--     opts.sources = cmp.config.sources(vim.list_extend(
--         opts.sources,
--         {
--             { name = "copilot" },
--             { name = "emoji" }
--         }
--     ))
--     opts.mapping = cmp.config.mapping(vim.list_extend(
--         opts.mapping,
--         {
--             ["<C-Space>"] = cmp.mapping.complete(),
--             ["<Esc>"] = cmp.mapping.close(),
--             ["<CR>"] = cmp.mapping.confirm({
--                 behavior = cmp.ConfirmBehavior.Replace,
--                 select = true,
--             }),
--         }
--     ))
-- 
--     opts.mapping["<Tab>"] = cmp.mapping.select_next_item()
--     opts.mapping["<S-Tab>"] = cmp.mapping.select_prev_item()
-- end


--return M

