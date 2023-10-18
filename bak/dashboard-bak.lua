return {
  "nvimdev/dashboard-nvim",
  opts = function()
    local logo = [[
    ]]
 logo = string.rep("\n", 8) .. logo .. "\n\n"
    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
      header = vim.split(logo, "\n"),
      -- stylua: ignore
      center = {
        { action = "Telescope find_files",                                                                      desc = " Find file",       icon = " ", key = "f" },
        { action = "ene | startinsert",                                                                         desc = " New file",        icon = " ", key = "n" },
        { action = "Telescope oldfiles",                                                                        desc = " Recent files",    icon = " ", key = "r" },
        { action = "Telescope live_grep",                                                                       desc = " Find text",       icon = " ", key = "g" },
        { action = ":e $MYVIMRC",                                                                               desc = " Config",          icon = " ", key = "c" },
        { action = 'lua require("persistence").load()',                                                         desc = " Restore Session", icon = " ", key = "s" },
        { action = 'lua require("persisted").load()',                                                           desc = " Restore persisted Session", icon = " ", key = "a" },
        { action = "LazyExtras",                                                                                desc = " Lazy Extras",     icon = " ", key = "x" },
        { action = "Lazy",                                                                                      desc = " Lazy",            icon = "󰒲 ", key = "l" },
        { action = "qa",                                                                                        desc = " Quit",            icon = " ", key = "q" },
        -- { action = ":lua require('telescope').load_extension('persisted')<cr> <bar> :Telescope persisted<cr>",                  desc = " telescope persisted session", icon = " ", key = "S" }, -- not working
      },
      },
    }

    return opts
  end,
}
