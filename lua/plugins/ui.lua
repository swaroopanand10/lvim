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
      },
    },
  },

  {
    "nvimdev/dashboard-nvim",
    opts = {
      header = vim.split("", "\n"),
      center = {
        { action = 'lua require("persisted").load()', desc = " Restore persisted Session", icon = " ", key = "a" },
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
}
