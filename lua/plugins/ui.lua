return {
  -- {
  --   "SmiteshP/nvim-navic",
  --   lazy = true,
  --   opts = function()
  --     return {
  --       icons = {
  --         File = " ",
  --         Module = " ",
  --         Namespace = " ",
  --         Package = " ",
  --         Class = " ",
  --         Method = " ",
  --         Property = " ",
  --         Field = " ",
  --         Constructor = " ",
  --         Enum = "練",
  --         Interface = "練",
  --         Function = " ",
  --         Variable = " ",
  --         Constant = " ",
  --         String = " ",
  --         Number = " ",
  --         Boolean = "◩ ",
  --         Array = " ",
  --         Object = " ",
  --         Key = " ",
  --         Null = "ﳠ ",
  --         EnumMember = " ",
  --         Struct = " ",
  --         Event = " ",
  --         Operator = " ",
  --         TypeParameter = " ",
  --       },
  --       separator = " > ",
  --       highlight = true,
  --       depth_limit = 5,
  --       -- icons = require("lazyvim.config").icons.kinds,
  --     }
  --   end,
  -- },
  {
    "ahmedkhalf/project.nvim",
    opts = {
      -- cwd = pwd, rootdir = the latest directory containing file, we can chech both through neotree keybinding in whichkey
      detection_methods = { "pattern", "lsp" },
    },
  },
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
        "<leader>uz",
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
}
