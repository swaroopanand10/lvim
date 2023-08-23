return {
  {
    "SmiteshP/nvim-navic",
    lazy = true,
    opts = function()
      return {
        icons = {
          File = " ",
          Module = " ",
          Namespace = " ",
          Package = " ",
          Class = " ",
          Method = " ",
          Property = " ",
          Field = " ",
          Constructor = " ",
          Enum = "練",
          Interface = "練",
          Function = " ",
          Variable = " ",
          Constant = " ",
          String = " ",
          Number = " ",
          Boolean = "◩ ",
          Array = " ",
          Object = " ",
          Key = " ",
          Null = "ﳠ ",
          EnumMember = " ",
          Struct = " ",
          Event = " ",
          Operator = " ",
          TypeParameter = " ",
        },
        separator = " > ",
        highlight = true,
        depth_limit = 5,
        -- icons = require("lazyvim.config").icons.kinds,
      }
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    detection_methods = { "pattern", "lsp" },
  },
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        char = {
          jump_labels = true,
        },
      },
    },
  },
}