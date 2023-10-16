return { --Tip - check the default bindings before setting them unneccesarily
  "nvim-telescope/telescope.nvim",
  lazy = true,
  keys = {
    -- some telescope bindings
    {
      "<leader>fa",
      "<cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>",
      silent = true,
      desc = "find all files",
    },
{
      "<leader>qt",
      ":lua require('telescope').load_extension('persisted')<cr> <bar> :Telescope persisted<cr>",
      silent = true,
      desc = "telescope persisted",
    },


-- {
--       "<leader>uA",
--       ":lua require('telescope').load_extension('aerial')<cr> <bar> :Telescope aerial<cr>",
--       silent = true,
--       desc = "telescope aerial",
--     },


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
          -- ["<C-c>"] = function(...)
          --   return require("telescope.actions").close(...)
          -- end, --changed it from C-c to A-c
          -- ["<Down>"] = function(...)
          --   return require("telescope.actions").move_selection_next(...)
          -- end,
          -- ["<Up>"] = function(...)
          --   return require("telescope.actions").move_selection_previous(...)
          -- end,
          -- ["<CR>"] = function(...)
          --   return require("telescope.actions").select_default(...)
          -- end,
          -- ["<C-x>"] = function(...)
          --   return require("telescope.actions").select_horizontal(...)
          -- end,
          -- ["<C-v>"] = function(...)
          --   return require("telescope.actions").select_vertical(...)
          -- end,
          -- ["<C-t>"] = function(...)
          --   return require("telescope.actions").select_tab(...)
          -- end,
          -- ["<C-u>"] = function(...)
          --   return require("telescope.actions").preview_scrolling_up(...)
          -- end,
          -- ["<C-d>"] = function(...)
          --   return require("telescope.actions").preview_scrolling_down(...)
          -- end,
          -- ["<PageUp>"] = function(...)
          --   return require("telescope.actions").results_scrolling_up(...)
          -- end,
          -- ["<PageDown>"] = function(...)
          --   return require("telescope.actions").results_scrolling_down(...)
          -- end,
          -- ["<Tab>"] = function(...)
          --   require("telescope.actions").toggle_selection(...)
          --   require("telescope.actions").move_selection_worse(...)
          -- end,
          -- ["<S-Tab>"] = function(...)
          --   require("telescope.actions").toggle_selection(...)
          --   require("telescope.actions").move_selection_better(...)
          -- end,
          -- ["<C-q>"] = function(...)
          --   require("telescope.actions").send_to_qflist(...)
          --   require("telescope.actions").open_qflist(...)
          -- end,
          -- ["<M-q>"] = function(...)
          --   require("telescope.actions").send_selected_to_qflist(...)
          --   require("telescope.actions").open_qflist(...)
          -- end,
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
          ["<C-g>"] = function(...)
            return require("telescope.actions").results_scrolling_right(...)
          end,
          ["<C-a>"] = function(...)
            return require("telescope.actions").results_scrolling_left(...)
          end,
        -- seems like all of these are already default bindings so no need to set them seperately
        --   ["<esc>"] = actions.close,
        --   -- ["<C-c>"] = actions.close,
        --   ["<CR>"] = actions.select_default,
        --   ["<C-x>"] = actions.select_horizontal,
        --   ["<C-v>"] = actions.select_vertical,
        --   ["<C-t>"] = actions.select_tab,
        --   ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        --   ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        --   ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        --   ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        --   ["j"] = actions.move_selection_next,
        --   ["k"] = actions.move_selection_previous,
        --   ["H"] = actions.move_to_top,
        --   ["M"] = actions.move_to_middle,
        --   ["L"] = actions.move_to_bottom,
        --   ["<Down>"] = actions.move_selection_next,
        --   ["<Up>"] = actions.move_selection_previous,
        --   ["gg"] = actions.move_to_top,
        --   ["G"] = actions.move_to_bottom,
        --   ["<C-u>"] = actions.preview_scrolling_up,
        --   ["<C-d>"] = actions.preview_scrolling_down,
        --   ["<PageUp>"] = actions.results_scrolling_up,
        --   ["<PageDown>"] = actions.results_scrolling_down,
        --   ["?"] = actions.which_key,
        --   ["."] = actions.add_selection, -- not working
        --   -- ["<a-h>"] = "which_key",
        --   -- ["d"] = delete_buf
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
    },

    -- require("telescope").load_extension("persisted"),
  },
}
