return {
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
  {
    "Apeiros-46B/qalc.nvim",
    cmd = "Qalc",
    opts = {
      -- extra command arguments for Qalculate
      -- do NOT use the option `-t`/`--terse`; it will break the plugin
      -- example: { '--set', 'angle deg' } to use degrees as the default angle unit
      -- cmd_args = {'--set', 'fr 5 appr 3'}, -- this was not working
      -- cmd_args = {'--set', 'fr 5', '--set', 'appr 3'}, -- table
      cmd_args = { "--set", "fr 5", "--set", "appr 3" }, -- this is working
      -- fr -> 5 = dual and 0 = off
      -- appr -> 3 = dual and 2 = approximate
    },
  },
  {
    "luckasRanarison/nvim-devdocs",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = "DevdocsOpenCurrent",
    opts = {
      -- previewer_cmd = "glow", -- for example: "glow"
      -- cmd_args = { "-s", "dark", "-w", "80" },
      -- picker_cmd = true,
      -- picker_cmd_args = { "-p" },
      ensure_installed = { "rust", "c", "cpp", "javascript" },
    },
  },
  {
    -- I think that we can configure lspconfig servers like this normally without overidding the lazyvim default setted options but,
    -- I don't think we need to configure empty servers as they are pre-configured with defaults when they are installed(so just put them in mason)
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
      -- servers = {
      -- tsserver = {},
      -- clangd = {},
      --   html = {},
      --   cssls = {},
      --   emmet_ls = {},
      --   bashls = {},
      -- },
    },
  },
  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
  },
  {
    "rmagatti/goto-preview",
    event = "BufEnter",
    opts = {
      default_mappings = true,
    },
  },
}
