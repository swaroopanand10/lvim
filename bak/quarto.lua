return {
  "quarto-dev/quarto-nvim",
  -- dev = true,
  dependencies = {
    { "jmbuhr/otter.nvim" }, -- , dev = true },
    "benlubas/nvim-cmp",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
    { "nvimtools/hydra.nvim" },
  },
  ft = { "quarto", "markdown", "norg" },
  config = function()
    local quarto = require("quarto")
    quarto.setup({
      lspFeatures = {
        languages = { "r", "python", "rust" },
        chunks = "all", -- 'curly' or 'all'
        diagnostics = {
          enabled = true,
          triggers = { "BufWritePost" },
        },
        completion = {
          enabled = true,
        },
      },
      keymap = {
        hover = "K",
        definition = "gd",
        rename = "<leader>rn",
        references = "gr",
        format = "<leader>gf",
      },
      codeRunner = {
        enabled = true,
        ft_runners = {
          bash = "slime",
        },
        default_method = "molten",
      },
    })

    vim.keymap.set(
      "n",
      "<localleader>qp",
      quarto.quartoPreview,
      { desc = "Preview the Quarto document", silent = true, noremap = true }
    )
    -- to create a cell in insert mode, I have the ` snippet
    vim.keymap.set("n", "<localleader>cc", "i`<c-j>", { desc = "Create a new code cell", silent = true })
    vim.keymap.set(
      "n",
      "<localleader>cs",
      "i```\r\r```{}<left>",
      { desc = "Split code cell", silent = true, noremap = true }
    )
  end,
}
