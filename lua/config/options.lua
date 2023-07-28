-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.o.winbar = "%f%{%v:lua.require'nvim-navic'.get_location()%}"
vim.o.winbar = " %t - %{%v:lua.require'nvim-navic'.get_location()%} %m"
vim.opt.swapfile = false
