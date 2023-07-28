return {
  -- add gruvbox
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   lazy = true,
  -- },

  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night",
      transparent = true, -- Enable this to disable setting the background color
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
