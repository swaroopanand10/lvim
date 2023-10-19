local logo = [[]]
logo = string.rep("\n", 8) .. logo .. "\n\n"
return {

  {
    "folke/flash.nvim",
    opts = {
      modes = {
        char = {
          jump_labels = true,
        },
        search = {
          enabled = false,
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
          enabled = true,
          font = "+4", -- font size increment
        },
      },
    },
  },

  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>k"] = { name = "+fzflua" },
        ["<leader>j"] = { name = "+extra" },
        ["<leader>jw"] = { name = "+windowpick" },
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
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      -- style = "night",
      -- transparent = true, -- Enable this to disable setting the background color
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      {
        "s1n7ax/nvim-window-picker",
        -- keys = {
        --   {
        --     "<leader>jww",
        --     swich_window = function()
        --       local winid = require("window-picker").pick_window()
        --       if winid then
        --         vim.api.nvim_set_current_win(winid)
        --       end
        --     end,
        --     "<cmd>{switch_window}<cr",
        --     silent = true,
        --     desc = "window pick",
        --   },
        -- },
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
