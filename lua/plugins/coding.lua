return {
  -- {
  -- i think that we can configure lspconfig like this without overidding the lazyvim default setted options but, 
  -- I don't think we need to configure empty servers as they are pre-configured with defaults when they are installed(so just put them in mason)
  --   "neovim/nvim-lspconfig",
  --   opts = { 
  --     servers = {
  --       -- tsserver = {},
  --       -- clangd = {},
  --       html = {},
  --       cssls = {},
  --       emmet_ls = {},
  --       bashls = {},
  --     },
  --   },
  -- },

  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --   -- wrong way of configuring ensure_installed as it will overrite the prewritten ensure_installed table by lazyvim like codelldb
  --     ensure_installed = { -- have to write full name of lsp server
  --       "stylua",
  --       "shfmt",
  --       "flake8",
  --       "html-lsp",
  --       "css-lsp",
  --       "emmet-ls",
  --       "bash-language-server",
  --     },
  --   },
  -- },

  -- this is a correct way of configuring mason, so that the previous dafault items setup by lazyvim does not get overidden(same way also configure typescript (see lazyvim docs))
  {

    "williamboman/mason.nvim",
    optional = true,
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        -- vim.list_extend(opts.ensure_installed, { "stylua" })
        -- vim.list_extend(opts.ensure_installed, { "shfmt" })
        -- vim.list_extend(opts.ensure_installed, { "flake8" })
        vim.list_extend(opts.ensure_installed, { "html-lsp" })
        vim.list_extend(opts.ensure_installed, { "css-lsp" })
        vim.list_extend(opts.ensure_installed, { "emmet-ls" })
        vim.list_extend(opts.ensure_installed, { "bash-language-server" })
        vim.list_extend(opts.ensure_installed, { "debugpy" }) --adding this as well because it was not present in default lazyvim config
      end
    end,
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
