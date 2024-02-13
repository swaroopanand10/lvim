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
    {
      "<leader>ik",
      "<cmd>:Neorg keybind all<cr>",
      silent = true,
      desc = "Neorg keybind all",
    },
    {
      "<leader>ie",
      "<cmd>:Neorg keybind all core.integrations.telescope.insert_link<cr>",
      silent = true,
      desc = "insert link",
    },
    {
      "<leader>ia",
      "<cmd>:Neorg keybind all core.integrations.telescope.insert_file_link<cr>",
      silent = true,
      desc = "insert file link",
    },
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
            networking = "~/notes/networking",
            comparch = "~/notes/comparch",
            rs = "~/notes/rs",
            asm = "~/notes/asm",
            os = "~/notes/os",
            wayland = "~/notes/wayland",
            gtk = "~/notes/gtk",
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
      -- ["core.ui.calendar"] = {},
    },
  },
  -- config = function(_, opts)
  --   -- mappings for neorg
  --   local neorg_callbacks = require("neorg.core.callbacks")
  --
  --   neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
  --     -- Map all the below keybinds only when the "norg" mode is active
  --     keybinds.map_event_to_mode("norg", {
  --       n = { -- Bind keys in normal mode
  --         { "<leader>ia", "core.integrations.telescope.insert_file_link" },
  --         { "<leader>ie", "core.integrations.telescope.insert_link" },
  --       },
  --
  --       i = { -- Bind in insert mode
  --         -- { "<C-.>", "core.integrations.telescope.insert_link" },
  --         -- { "<C-,>", "core.integrations.telescope.insert_file_link" },
  --       },
  --     }, {
  --       desc = "insert link",
  --       silent = true,
  --       noremap = true,
  --     })
  --   end)
  --   require("neorg").setup(opts)
  -- end,
}
