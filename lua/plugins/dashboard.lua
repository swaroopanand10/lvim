return {
  "nvimdev/dashboard-nvim",
  opts = {
        header = vim.split(" ", "\n"),
      center = {
        { action = 'lua require("persisted").load()',  desc = " Restore persisted Session", icon = " ", key = "a" },
      },
  },
  }
