return {
  "nvim-neorg/neorg",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-neorg/neorg-telescope" },
    { "nvim-telescope/telescope.nvim" },
  },
  keys = {
    {
      "<leader>in",
      "<cmd>:Neorg<cr>",
      silent = true,
      desc = "neorg menu",
    },
    {
      "<leader>ip",
      "<cmd>:Neorg sync-parsers<cr>",
      silent = true,
      desc = "Neorg sync-parsers",
    },
    {
      "<leader>ii",
      "<cmd>:Neorg index<cr>",
      silent = true,
      desc = "Neorg index",
    },
    {
      "<leader>iw",
      "<cmd>:Telescope neorg switch_workspace<cr>",
      silent = true,
      desc = "Neorg switch workspace",
    },

    {
      "<leader>il",
      "<cmd>:Telescope neorg find_linkable<cr>",
      silent = true,
      desc = "Neorg find_linkable in current workspace",
    },

    {
      "<leader>ih",
      "<cmd>:Telescope neorg search_headings<cr>",
      silent = true,
      desc = "Neorg search headings in current file",
    },
    {
      "<leader>if",
      "<cmd>:Telescope neorg find_norg_files<cr>",
      silent = true,
      desc = "Neorg search files in current workspace",
    },
    {
      "<leader>ir",
      "<cmd>:Neorg return<cr>",
      silent = true,
      desc = "Neorg return",
    },
    {
      "<leader>im",
      "<cmd>:Neorg inject-metadata<cr>",
      silent = true,
      desc = "Neorg inject-metadata",
    },
    {
      "<leader>is",
      "<cmd>:Neorg generate-workspace-summary<cr>",
      silent = true,
      desc = "Neorg generate-workspace-summary",
    },
    {
      "<leader>ij",
      "<cmd>:Neorg journal<cr>",
      silent = true,
      desc = "Neorg journal menu",
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
            notes = "~/notes/default",
            cprg = "~/notes/cprg",
            cppprg = "~/notes/cppprg",
            asmprg = "~/notes/asmprg",
            networking = "~/notes/networking",
            comparch = "~/notes/comparch",
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
