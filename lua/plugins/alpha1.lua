return {
  "goolord/alpha-nvim",
opts = function(_, dashboard)
  -- local button1 = dashboard.button("p", " " .. " Projects", ":Telescope projects <CR>")
  -- local button  =    dashboard.button("s", " " .. " Restore Session", [[:lua require("persisted").load() <cr>]])
  local button  =    dashboard.button("a", " " .. " Restore Session", [[:lua require("persisted").load() <cr>]])
  local button2 =    dashboard.button("S", " " .. " Telescope Session", ":lua require('telescope').load_extension('persisted')<cr> <bar> :Telescope persisted<cr>")

    local logo = [[]]

    dashboard.section.header.val = vim.split(logo, "\n")
  button.opts.hl = "AlphaButtons"
  button.opts.hl_shortcut = "AlphaShortcut"
  button2.opts.hl = "AlphaButtons"
  button2.opts.hl_shortcut = "AlphaShortcut"
  table.insert(dashboard.section.buttons.val, 4, button)
  table.insert(dashboard.section.buttons.val, 5, button2)
end
}
