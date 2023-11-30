return {
  "nvim-neorg/neorg",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-neorg/neorg-telescope" },
    { "nvim-telescope/telescope.nvim" },
  },
  keys = {
    {
      "<leader>jnn",
      "<cmd>:Neorg<cr>",
      silent = true,
      desc = "neorg menu",
    },
    {
      "<leader>jnp",
      "<cmd>:Neorg sync-parsers<cr>",
      silent = true,
      desc = "Neorg sync-parsers",
    },
    {
      "<leader>jni",
      "<cmd>:Neorg index<cr>",
      silent = true,
      desc = "Neorg index",
    },
    {
      "<leader>jnw",
      "<cmd>:Telescope neorg switch_workspace<cr>",
      silent = true,
      desc = "Neorg switch workspace",
    },

    {
      "<leader>jnl",
      "<cmd>:Telescope neorg find_linkable<cr>",
      silent = true,
      desc = "Neorg find_linkable in current workspace",
    },

    {
      "<leader>jnh",
      "<cmd>:Telescope neorg search_headings<cr>",
      silent = true,
      desc = "Neorg search headings in current file",
    },
    {
      "<leader>jnf",
      "<cmd>:Telescope neorg find_norg_files<cr>",
      silent = true,
      desc = "Neorg search files in current workspace",
    },
    {
      "<leader>jnr",
      "<cmd>:Neorg return<cr>",
      silent = true,
      desc = "Neorg return",
    },
    -- {
    --   "<leader>jne",
    --   "<cmd>Telescope Neorg insert_link<cr>",
    --   silent = true,
    --   desc = "insert link",
    -- },
    -- {
    --   "<leader>jna",
    --   "<cmd>Telescope Neorg insert_file_link<cr>",
    --   silent = true,
    --   desc = "insert file link",
    -- },
  },
  ft = "norg", -- lazy load on filetype
  -- cmd = "Neorg", -- lazy load on command, allows you to autocomplete :Neorg regardless of whether it's loaded yet
  --  (you could also just remove both lazy loading things)
  priority = 30, -- treesitter is on default priority of 50, neorg should load after it.
  build = ":Neorg sync-parsers",
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/notes",
          },
          default_workspace = "notes",
        },
      },
      ["core.integrations.telescope"] = {},
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
      ["core.export"] = {},
      ["core.summary"] = {},
    },
  },
}
