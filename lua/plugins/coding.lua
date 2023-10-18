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
    opts = {
      autocmd = { enabled = true },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    -- build = (not jit.os:find("Windows"))
    --     and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
    --   or nil,
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = vim.fn.stdpath("config") .. "/snippets",
      })
    end,
  },
}
