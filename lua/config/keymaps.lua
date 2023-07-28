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

-- some telescope bindings
-- map(
--   "n",
--   "<leader>fa",
--   "<cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>",
--   { silent = true, desc = "find all files" }
-- )

-- -- some fzf-lua bindings
-- map("n", "<leader>kF", "<cmd>FzfLua<cr>", opts)
-- map("n", "<leader>ka", "<cmd>FzfLua files cwd=~<cr>", opts)
-- map("n", "<leader>kR", "<cmd>FzfLua lgrep_curbuf<cr>", opts)
-- map("n", "<leader>kr", "<cmd>FzfLua grep_curbuf<cr>", opts)
-- map("n", "<leader>kv", "<cmd>FzfLua grep_visual<cr>", opts)
-- map("n", "<leader>kf", "<cmd>FzfLua live_grep<cr>", opts)
-- map("n", "<leader>kp", "<cmd>FzfLua files<cr>", opts)
-- map("n", "<leader>kb", "<cmd>FzfLua buffers<cr>", opts)
-- map("n", "<leader>kl", "<cmd>FzfLua blines<cr>", opts)
-- map("n", "<leader>kL", "<cmd>FzfLua lines<cr>", opts)
-- -- map("n", "<leader>ko","<cmd>call fzf#run({'source': 'find ~/ -type d', 'sink':  'edit','down': '35%'})<cr>",opts); -- not working for some reason
-- -- map("n", "<leader>ko","<cmd>:lua require'fzf-lua'.files({prompt='LS> ',cmd = 'find ~/ -type d', cwd='~/'})<cr>",opts);
-- -- map("n", "<leader>kO","<cmd>:lua require'fzf-lua'.files({prompt='LS> ',cmd = 'find ~/ -type d', cwd='./' })<cr>",opts);
-- vim.keymap.set({ "n" }, "<leader>ko", function()
--   require("fzf-lua").files({
--     prompt = "LS> ",
--     cmd = "find ~/ -type d",
--     cwd = "~/",
--     winopts = { preview = { hidden = "true" } },
--   })
-- end, { silent = true, desc = "Fuzzy complete file" })
--
-- vim.keymap.set({ "n" }, "<leader>kO", function()
--   require("fzf-lua").files({
--     prompt = "LS> ",
--     cmd = "find . -type d",
--     cwd = "cwd",
--     winopts = { preview = { hidden = "true" } },
--   })
-- end, { silent = true, desc = "Fuzzy complete file" })

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
