local logo = [[]]
logo = string.rep("\n", 8) .. logo .. "\n\n"
return {

  {
    "folke/flash.nvim",
    opts = {
      modes = {
        -- char = {
        --   jump_labels = true,
        -- },
        search = {
          -- enabled = false,
        },
      },
    },
  },
  {
    "folke/zen-mode.nvim",
    keys = {
      {
        "<leader>jz",
        "<cmd>:ZenMode<cr>",
        silent = true,
        desc = "zenmode toggle",
      },
    },
    opts = {
      plugins = {
        -- disable some global vim options (vim.o...)
        -- comment the lines to not apply the options
        options = {
          enabled = true,
          ruler = false, -- disables the ruler text in the cmd line area
          showcmd = false, -- disables the command in the last line of the screen
          -- you may turn on/off statusline in zen mode by setting 'laststatus'
          -- statusline will be shown only if 'laststatus' == 3
          laststatus = 0, -- turn off the statusline in zen mode
        },
        tmux = { enabled = true }, --seems that true value disables the tmux statusline
        kitty = {
          enabled = false, --disabling it since it is forcing the text size to fall back to default small, anyway didn't need it
          font = "+4", -- font size increment
        },
      },
    },
  },
  -- {
  --   "pocco81/true-zen.nvim",
  --   keys = {
  --     {
  --       "<leader>jZ",
  --       "<cmd>:TZMinimalist<cr>",
  --       silent = true,
  --       desc = "true zen minimalist",
  --     },
  --   }
  -- },

  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>k"] = { name = "+fzflua" },
        ["<leader>j"] = { name = "+extra" },
        ["<leader>jw"] = { name = "+windowpick" },
        -- ["<leader>jn"] = { name = "+neorg" },
        ["<leader>h"] = { name = "+harpoon" },
      },
    },
  },

  {
    "nvimdev/dashboard-nvim",
    opts = {
      hide = {
        statusline = false, -- hide statusline default is true
        -- tabline =true,     -- hide the tabline
        winbar = true, -- hide winbar -- not working
      },
      config = {
        header = vim.split(logo, "\n"),
        -- center = { -- this results in overriding the defaults
        -- { action = 'lua require("persisted").load()', desc = "Restore persisted Session", icon = " ", key = "a" },
        -- },
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      {
        "s1n7ax/nvim-window-picker",
      },
    },
    keys = {
      {
        "<leader>je",
        "<cmd>:Neotree reveal<cr>",
        silent = true,
        desc = "neotree reveal",
      },
    },
    opts = {
      window = {
        mappings = {
          ["S"] = "split_with_window_picker",
          ["s"] = "vsplit_with_window_picker",
        },
      },
    },
  },
  {
    "s1n7ax/nvim-window-picker",
    opts = {
      hint = "floating-big-letter",
      show_prompt = false,
    },
  },
  {
    "mikesmithgh/kitty-scrollback.nvim",
    enabled = true,
    lazy = true,
    cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
    event = { "User KittyScrollbackLaunch" },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
    -- version = '^2.0.0', -- pin major version, include fixes and features that do not have breaking changes
    config = function()
      require("kitty-scrollback").setup()
    end,
  },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>jj",
        "<cmd>Hardtime toggle<cr>",
        silent = true,
        desc = "hardtime toggle",
      },
    },
    cmd = {"Hardtime"},
    event = {"BufEnter"},
    opts = {},
  },
  -- {
  --   "ten3roberts/window-picker.nvim",
  --   keys = {
  --     {
  --       "<leader>jww",
  --       "<cmd>:WindowPick<cr>",
  --       silent = true,
  --       desc = "window pick",
  --     },
  --     {
  --       "<leader>jws",
  --       "<cmd>:WindowSwap<cr>",
  --       silent = true,
  --       desc = "widnow swap",
  --     },
  --     {
  --       "<leader>jwd",
  --       "<cmd>:WindowZap<cr>",
  --       silent = true,
  --       desc = "window zap",
  --     },
  --   },
  -- },
}
