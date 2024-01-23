return { --Tip - check the default bindings before setting them unneccesarily
  "nvim-telescope/telescope.nvim",
  lazy = true,
  dependencies = {
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    },
    "debugloop/telescope-undo.nvim",
  },
  keys = {
    -- some telescope bindings
    {
      "<leader>jf",
      "<cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>",
      silent = true,
      desc = "find all(+hid) files in curdir",
    },
    {
      "<leader>jt",
      ":lua require('telescope').load_extension('persisted')<cr> <bar> :Telescope persisted<cr>",
      silent = true,
      desc = "telescope persisted",
    },

    { -- helps in live-grepping through rg with arguments
      "<leader>jr",
      ":lua require('telescope').load_extension('live_grep_args')<cr> <bar> :Telescope live_grep_args<cr>",
      silent = true,
      desc = "telescope livegrep with args",
    },

    {
      "<leader>jh",
      ":lua require('telescope').load_extension('harpoon')<cr> <bar> :Telescope harpoon marks<cr>",
      silent = true,
      desc = "telescope harpoon",
    },
    {
      "<leader>ju",
      "<cmd>Telescope undo<cr>",
      desc = "undo history",
    },
    {
      "<leader>j,",
      -- "<cmd>Telescope undo<cr>",
      function()
        require("telescope.builtin").find_files({ cwd = require("telescope.utils").buffer_dir() })
      end,
      desc = "find files(normal) directory of current file",
    },
    {
      "<leader>j.",
      -- "<cmd>Telescope undo<cr>",
      function()
        require("telescope.builtin").find_files({ cwd = require("telescope.utils").buffer_dir(), hidden = true })
      end,
      desc = "find files(all) directory of current file",
    },
    {
      "<leader>jH",
      "<cmd>DevdocsOpenCurrent<cr>",
      desc = "devdocs opencurrent",
    },
  },
  opts = {
    extensions = {
      persisted = {
        layout_config = { width = 0.55, height = 0.55 },
      },
      undo = {
        side_by_side = true,
        -- layout_strategy = "horizontal",
        -- layout_config = {
        --   preview_width = 0.5,
        -- },
        layout_strategy = "vertical",
        layout_config = {
          height = 0.98,
          width = 0.98,
          preview_cutoff = 10,
          preview_height = 0.55,
        },
      },
    },

    -- require("telescope").load_extension("persisted"),
  },
  config = function(_, opts)
    local actions = require("telescope.actions")
    -- this is much better way of configuring mappings
    opts.defaults.mappings.i = {
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
      ["<C-n>"] = actions.cycle_history_next,
      ["<C-p>"] = actions.cycle_history_prev,
      ["<C-f>"] = actions.preview_scrolling_right,
      ["<C-b>"] = actions.preview_scrolling_left,
      ["<M-j>"] = actions.results_scrolling_left,
      ["<M-k>"] = actions.results_scrolling_right,
      ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
      ["<C-g>"] = actions.send_selected_to_qflist + actions.open_qflist,
      ["<C-q>"] = false,
      ["<M-q>"] = false,
    }
    opts.defaults.mappings.n = {
      ["<C-f>"] = actions.preview_scrolling_left,
      ["<C-b>"] = actions.preview_scrolling_right,
      ["<M-j>"] = actions.results_scrolling_left,
      ["<M-k>"] = actions.results_scrolling_right,
      ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
      ["<C-g>"] = actions.send_selected_to_qflist + actions.open_qflist,
      ["<C-q>"] = false,
      ["<M-q>"] = false,
    }
    require("telescope").setup(opts)
  end,
}
