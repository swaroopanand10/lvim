let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +3 init.lua
badd +17 ~/.config/nvim/lua/config/lazy.lua
badd +36 ~/.config/nvim/bak/alpha.lua
badd +14 ~/.config/nvim/bak/alpha1.lua
badd +25 ~/.config/nvim/lua/plugins/colorizer.lua
badd +1 ~/.config/nvim/lua/plugins/colorscheme.lua
badd +1 ~/.config/nvim/lua/plugins/disabled.lua
badd +84 ~/.config/nvim/lua/plugins/fzflua.lua
badd +7 ~/.config/nvim/lua/plugins/lsp-config.lua
badd +12 ~/.config/nvim/lua/plugins/luasnip1.lua
badd +44 ~/.config/nvim/lua/plugins/navic.lua
badd +67 ~/.config/nvim/lua/plugins/telescope.lua
badd +13 ~/.config/nvim/lua/plugins/toggleterm.lua
badd +9 ~/.config/nvim/lua/plugins/whichkey.lua
badd +35 ~/.config/nvim/lua/plugins/persisted.lua
badd +15 ~/.config/nvim/lua/plugins/dashboard.lua
argglobal
%argdel
edit ~/.config/nvim/bak/alpha1.lua
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
let s:l = 14 - ((13 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 14
normal! 017|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
