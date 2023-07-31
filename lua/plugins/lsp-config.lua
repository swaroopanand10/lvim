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
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        "flake8",
        "html-lsp",
        "css-lsp",
        "emmet-ls",
      },
    },
  },
}
