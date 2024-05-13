return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "tanvirtin/monokai.nvim" },
  { "shaunsingh/nord.nvim" },
  { "catppuccin/nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai",
    },
  }
}
