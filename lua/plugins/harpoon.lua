return {
  "ThePrimeagen/harpoon",
  keys = {
    {
      "<leader>ha",
      "<cmd>lua require('harpoon.mark').add_file()<cr>",
      silent = true,
      desc = "harpoon add file",
    },
    {
      "<leader>hr",
      "<cmd>lua require('harpoon.mark').rm_file()<cr>",
      silent = true,
      desc = "harpoon remove file",
    },
    {
      "<leader>hh",
      "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
      silent = true,
      desc = "harpoon menu",
    },
    {
      "<leader>hf",
      "<cmd>lua require('harpoon.ui').nav_next()<cr>",
      silent = true,
      desc = "harpoon next file",
    },
    {
      "<leader>hb",
      "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
      silent = true,
      desc = "harpoon prev file",
    },
    {
      "<leader>h1",
      "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
      silent = true,
      desc = "file 1",
    },
    {
      "<leader>h2",
      "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
      silent = true,
      desc = "file 2",
    },
    {
      "<leader>h3",
      "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
      silent = true,
      desc = "file 3",
    },
    {
      "<leader>h4",
      "<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
      silent = true,
      desc = "file 4",
    },
    {
      "<leader>h5",
      "<cmd>lua require('harpoon.ui').nav_file(5)<cr>",
      silent = true,
      desc = "file 5",
    },
  },
}
