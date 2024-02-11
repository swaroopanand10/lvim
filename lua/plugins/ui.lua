return {

  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<A-q>",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        mode = { "n", "i" },
        desc = "Dismiss all Notifications",
      },
    },
  },
  {
    "folke/flash.nvim",
    keys = {
      {
        "kl",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            search = { mode = "search", max_length = 0 },
            label = { after = { 0, 0 } },
            pattern = "^",
          })
        end,
        desc = "Label beginning of line",
      },
      {
        "lk",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            search = { mode = "search", max_length = 0 },
            label = { after = { 0, 0 } },
            pattern = "^",
          })
        end,
        desc = "Label beginning of line",
      },
      {
        "<A-f>",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            search = { mode = "search", max_length = 0 },
            label = { after = { 0, 0 } },
            pattern = "^",
          })
        end,
        desc = "Label beginning of line",
      },
    },
    opts = {
      -- labels = "asdfghjklqwertyuiopzxcvbnm", --default
      labels = "asdfghjkl;uionwertmpqyzxcvb", --customized
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
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>k"] = { name = "+fzflua" },
        ["<leader>j"] = { name = "+extra" },
        ["<leader>jw"] = { name = "+windowpick" },
        ["<leader>jn"] = { name = "+compitest" },
        ["<leader>jm"] = { name = "+multicursors" },
        ["<leader>h"] = { name = "+harpoon" },
        ["<leader>i"] = { name = "+neorg" },
      },
    },
  },

  {
    "nvimdev/dashboard-nvim",
    -- event = 'VimEnter',
    opts = {
      hide = {
        statusline = false, -- hide statusline default is true
        winbar = true, -- hide winbar -- not working
      },
    },
    config = function(_, opts) -- passing opts as a table
      local logo = [[]]
      logo = string.rep("\n", 2) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
      if type(opts.config.center) == "table" then
        vim.list_extend(opts.config.center, {
          { action = 'lua require("persisted").load()', desc = " Restore persisted Session", icon = " ", key = "d" },
        })
      end
      for _, button in ipairs(opts.config.center) do -- for removing square brackets from around key (copied from lazyvim repo)
        -- button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end
      require("dashboard").setup(opts) -- without this undefined behavour without errors
    end,
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
    cmd = { "Hardtime" },
    event = { "BufEnter" },
    opts = {},
  },
  {
    "uga-rosa/ccc.nvim",
    cmd = "CccPick",
    keys = {
      {
        "<leader>jC",
        "<cmd>CccPick<cr>",
        silent = true,
        desc = "Ccc Pick",
      },
      {
        "<leader>jc",
        "<cmd>CccHighlighterToggle<cr>",
        silent = true,
        desc = "Ccc highlight toggle",
      },
    },
  },
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "smoka7/hydra.nvim",
    },
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    opts = {},
    keys = {
      {
        mode = { "v", "n" },
        "<Leader>jms",
        "<cmd>MCstart<cr>",
        desc = "Create a selection for selected text or word under the cursor",
      },
      {
        mode = { "v", "n" },
        "<Leader>jma",
        "<cmd>MCpattern<cr>",
        desc = "Create a selection for selected text or word under the cursor",
      },
      {
        mode = { "v", "n" },
        "<Leader>jmx",
        "<cmd>MCclear<cr>",
        desc = "Create a selection for selected text or word under the cursor",
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
