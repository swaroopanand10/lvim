return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- tsserver = {},
        -- clangd = {},
        html = {},
        cssls = {},
        emmet_ls = {},
        bashls = {},
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { -- have to write full name of lsp server
        "stylua",
        "shfmt",
        "flake8",
        "html-lsp",
        "css-lsp",
        "emmet-ls",
        "bash-language-server",
      },
    },
  },
  {
    "kosayoda/nvim-lightbulb",
    event = "BufEnter",
    -- opts = {
    --   autocmd = { enabled = true }
    -- },
    config = function()
      require("nvim-lightbulb").setup({
        autocmd = { enabled = true },
      })
    end,
  },
}
