return {
  "ibhagwan/fzf-lua",
  lazy = true,
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>kF", "<cmd>FzfLua<cr>", silent = true, desc = "fzflua" },
    { "<leader>ka", "<cmd>FzfLua files cwd=~<cr>", desc = "fzflua files in ~" },
    { "<leader>kR", "<cmd>FzfLua lgrep_curbuf<cr>", desc = "fzflua curbuf livegrep regex" },
    { "<leader>kr", "<cmd>FzfLua grep_curbuf<cr>", desc = "fzflua curbuf grep fuzzy" },
    { "<leader>kv", "<cmd>FzfLua grep_visual<cr>", desc = "fzflua visualgrep workspace fuzzy" },
    { "<leader>kf", "<cmd>FzfLua live_grep<cr>", desc = "fzflua livegrep workspace regex" },
    { "<leader>kp", "<cmd>FzfLua files<cr>", desc = "fzflua find files" },
    { "<leader>kb", "<cmd>FzfLua buffers<cr>", desc = "fzflua find buffers" },
    { "<leader>kl", "<cmd>FzfLua blines<cr>", desc = "fzflua find bufferlines fuzzy" },
    { "<leader>kL", "<cmd>FzfLua lines<cr>", desc = "fzflua find workspace lines fuzzy" },
    -- map("n", "<leader>ko","<cmd>call fzf#run({'source': 'find ~/ -type d', 'sink':  'edit','down': '35%'})<cr>",opts); -- not working for some reason
    -- map("n", "<leader>ko","<cmd>:lua require'fzf-lua'.files({prompt='LS> ',cmd = 'find ~/ -type d', cwd='~/'})<cr>",opts);
    -- map("n", "<leader>kO","<cmd>:lua require'fzf-lua'.files({prompt='LS> ',cmd = 'find ~/ -type d', cwd='./' })<cr>",opts);
    {
      "<leader>ko",
      function()
        require("fzf-lua").files({
          prompt = "LS> ",
          cmd = "find ~/ -type d",
          cwd = "~/",
          winopts = { preview = { hidden = "true" } },
        })
      end,
      silent = true,
      desc = "Fuzzy complete file",
    },

    {
      "<leader>kO",
      function()
        require("fzf-lua").files({
          prompt = "LS> ",
          cmd = "find . -type d",
          cwd = "cwd",
          winopts = { preview = { hidden = "true" } },
        })
      end,
      silent = true,
      desc = "Fuzzy complete file",
    },
  },
}
