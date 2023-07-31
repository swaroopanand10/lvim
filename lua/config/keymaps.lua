-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local opts = { silent = true }

-- for exiting insert mode
map("i", "jk", "<Esc>", opts)
map("i", "kj", "<Esc>", opts)

-- for switching to last buffer
map("n", "<C-b>", "<C-6>", opts)

-- for resizing window sizes
map("n", "<C-h>", ":vertical resize -2<CR>", opts)
map("n", "<C-k>", ":resize -2<CR>", opts)
map("n", "<C-j>", ":resize +2<CR>", opts)
map("n", "<C-l>", ":vertical resize +2<CR>", opts)

--for switching between windows
map("n", "<A-h>", "<C-w>h", opts)
map("n", "<A-j>", "<C-w>j", opts)
map("n", "<A-k>", "<C-w>k", opts)
map("n", "<A-l>", "<C-w>l", opts)
map("n", "<leader>gd", "<cmd>lcd %:p:h<cr>",{desc= "change dir to cwd",silent=true});

-- keympas for custom cumpilation
vim.cmd(
  [[autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -O2 % &>%:p:h/out.txt -o %:p:h/a.out && %:p:h/a.out < %:p:h/in.txt &> %:p:h/out.txt <Enter><CR>]]
)
vim.cmd(
  [[autocmd filetype c nnoremap <F9> :w <bar> !gcc -O2 % &>%:p:h/out.txt -o %:p:h/a.out && %:p:h/a.out < %:p:h/in.txt &> %:p:h/out.txt <Enter><CR>]]
)
vim.cmd([[autocmd filetype cpp nnoremap <C-x> :!%:p:h/a.out < %:p:h/in.txt &> %:p:h/out.txt <Enter><CR>]])
vim.cmd([[ autocmd filetype python nnoremap <C-x> :w <bar> !python % < %:p:h/in.txt &> %:p:h/out.txt <Enter><CR> ]]) -- had to change the shortcut form C-c to C-x so that i can cancel the buggy code at any time
vim.cmd([[ autocmd filetype javascript nnoremap <C-x> :w <bar> !node % &> %:p:h/out.txt <Enter><CR> ]]) -- had to change the shortcut form C-c to C-x so that i can cancel the buggy code at any time
