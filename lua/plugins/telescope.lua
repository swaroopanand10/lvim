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

    defaults = {
      mappings = {
        i = {
          ["<C-n>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<C-p>"] = function(...)
            return require("telescope.actions").cycle_history_prev(...)
          end,
          ["<C-j>"] = function(...)
            return require("telescope.actions").move_selection_next(...)
          end, --doesn't seem to work with both ctrl and alt for some reason but are working for fzf
          ["<C-k>"] = function(...)
            return require("telescope.actions").move_selection_previous(...)
          end,
          ["<C-f>"] = function(...)
            return require("telescope.actions").preview_scrolling_right(...)
          end,
          ["<C-b>"] = function(...)
            return require("telescope.actions").preview_scrolling_left(...)
          end,
          ["<C-g>"] = function(...)
            return require("telescope.actions").results_scrolling_right(...)
          end,
          ["<C-a>"] = function(...)
            return require("telescope.actions").results_scrolling_left(...)
          end,
          ["<C-l>"] = function(...)
            return require("telescope.actions").complete_tag(...)
          end,
          ["<C-_>"] = function(...)
            return require("telescope.actions").which_key(...)
          end, -- keys from pressing <C-/>
          -- ["<a-h>"] = "which_key",
          ["<a-d>"] = function(...)
            return require("telescope.actions").delete_buffer(...)
          end,
        },
        n = {
          ["<C-f>"] = function(...)
            return require("telescope.actions").preview_scrolling_right(...)
          end,
          ["<C-b>"] = function(...) --seems like this is used somewhere else but dont know where
            return require("telescope.actions").preview_scrolling_left(...)
          end,
          ["<C-g>"] = function(...) --seems like this is used somewhere else but dont know where
            return require("telescope.actions").results_scrolling_right(...)
          end,
          ["<C-a>"] = function(...)
            return require("telescope.actions").results_scrolling_left(...)
          end,
          ["<a-d>"] = function(...)
            require("telescope.actions").delete_buffer(...)
          end,
          --   --[[ ['<a-d>'] = require("telescope").mybuffer(), ]]
        },
      },
    },

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
}
