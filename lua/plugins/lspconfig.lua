return {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
        ---@type lspconfig.options
        --autoformat = false,
        servers = {
            -- pyright will be automatically installed with mason and loaded with lspconfig
            pyright = {},
            intelephense = {},
            gopls = {},
        },
    },
}
