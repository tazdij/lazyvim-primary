return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "tanvirtin/monokai.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai",
    },
  }
}
