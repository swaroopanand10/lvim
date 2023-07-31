return {
  "ibhagwan/fzf-lua",
  lazy = true,
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>kF", "<cmd>FzfLua<cr>", silent = true, desc = "fzflua" },
    -- { "<leader>ka", "<cmd>FzfLua files cwd=/home/swaroop/<cr>", desc = "fzflua files in ~" },
    { "<leader>kc", "<cmd>FzfLua files cwd=/home/swaroop/.config/<cr>", desc = "fzflua config files" },
    { "<leader>kh", "<cmd>FzfLua files cwd=/home/swaroop/.local/<cr>", desc = "fzflua local files" },
    { "<leader>kR", "<cmd>FzfLua lgrep_curbuf<cr>", desc = "fzflua curbuf livegrep regex" },
    { "<leader>kr", "<cmd>FzfLua grep_curbuf<cr>", desc = "fzflua curbuf grep fuzzy" },
    { "<leader>kw", "<cmd>FzfLua grep_visual<cr>", desc = "fzflua visualgrep workspace fuzzy" },
    { "<leader>kW", "<cmd>FzfLua live_grep<cr>", desc = "fzflua livegrep workspace regex" },
    { "<leader>kf", "<cmd>FzfLua files<cr>", desc = "fzflua find files" },
    -- { "<leader>kp", "<cmd>FzfLua files cwd=/home/swaroop/Projects/<cr>", desc = "fzflua find files" },
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
      desc = "fuzzy search directories in ~",
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
      desc = "fuzzy search directories in .",
    },

    {
      "<leader>kp",
      function()
        require("fzf-lua").files({
          prompt = "LS> ",
          cmd = "find /home/swaroop/Projects -type d",
          cwd = "~/Projects/",
          winopts = { preview = { hidden = "true" } },
        })
      end,
      silent = true,
      desc = "fuzzy search projects",
    },

    {
      "<leader>ka",
      function()
        require("fzf-lua").files({
          prompt = "LS> ",
          -- cmd = "find /home/swaroop/ -not -path '*/.*'",
          cmd = 'find ~ -not -path "*/.*" -not -name "*.exe" -not -name "*.out" -not -name "*.pdf" -not -name "*.jpg" -not -name "*.png" -not -name "*.jpeg" -not -name "*.tar" -not -name "*.mp3" -not -name "*.opus" -not -name "*.docx" -type f',
          cwd = "~/",
          winopts = { preview = { hidden = "true" } },
        })
      end,
      silent = true,
      desc = "fuzzy search normal files in ~",
    },

    {
      "<leader>kA",
      function()
        require("fzf-lua").files({
          prompt = "LS> ",
          cmd = "find /home/swaroop/",
          cwd = "~/",
          winopts = { preview = { hidden = "true" } },
        })
      end,
      silent = true,
      desc = "fuzzy search all files in ~",
    },
  },
}
