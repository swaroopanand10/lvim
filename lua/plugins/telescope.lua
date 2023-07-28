local actions = require("telescope.actions")
return {
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
  },
  opts = {

    defaults = {
      mappings = {
        i = {
          ["<C-n>"] = require("telescope.actions").cycle_history_next,
          ["<C-p>"] = require("telescope.actions").cycle_history_prev,
          ["<C-j>"] = require("telescope.actions").move_selection_next, --doesn't seem to work with both ctrl and alt for some reason but are working for fzf
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
          ["<C-c>"] = require("telescope.actions").close, --changed it from C-c to A-c
          ["<Down>"] = require("telescope.actions").move_selection_next,
          ["<Up>"] = require("telescope.actions").move_selection_previous,
          ["<CR>"] = require("telescope.actions").select_default,
          ["<C-x>"] = require("telescope.actions").select_horizontal,
          ["<C-v>"] = require("telescope.actions").select_vertical,
          ["<C-t>"] = require("telescope.actions").select_tab,
          ["<C-u>"] = require("telescope.actions").preview_scrolling_up,
          ["<C-d>"] = require("telescope.actions").preview_scrolling_down,
          ["<PageUp>"] = require("telescope.actions").results_scrolling_up,
          ["<PageDown>"] = require("telescope.actions").results_scrolling_down,
          ["<Tab>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_worse,
          ["<S-Tab>"] = require("telescope.actions").toggle_selection
            + require("telescope.actions").move_selection_better,
          ["<C-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
          ["<M-q>"] = require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist,
          ["<C-l>"] = require("telescope.actions").complete_tag,
          ["<C-_>"] = require("telescope.actions").which_key, -- keys from pressing <C-/>
          -- ["<a-h>"] = "which_key",
          ["<a-d>"] = require("telescope.actions").delete_buffer,
        },
        n = {
          ["<esc>"] = actions.close,
          -- ["<C-c>"] = actions.close,
          ["<CR>"] = actions.select_default,
          ["<C-x>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          ["<C-t>"] = actions.select_tab,
          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["H"] = actions.move_to_top,
          ["M"] = actions.move_to_middle,
          ["L"] = actions.move_to_bottom,
          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,
          ["gg"] = actions.move_to_top,
          ["G"] = actions.move_to_bottom,
          ["<C-u>"] = actions.preview_scrolling_up,
          ["<C-d>"] = actions.preview_scrolling_down,
          ["<PageUp>"] = actions.results_scrolling_up,
          ["<PageDown>"] = actions.results_scrolling_down,
          ["?"] = actions.which_key,
          ["."] = actions.add_selection, -- not working
          -- ["<a-h>"] = "which_key",
          -- ["d"] = delete_buf
          ["<a-d>"] = actions.delete_buffer,
          --[[ ['<a-d>'] = require("telescope").mybuffer(), ]]
        },
      },
    },
  },
}
