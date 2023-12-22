let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
let NetrwTopLvlMenu = "Netrw."
let NetrwMenuPriority =  80 
silent only
silent tabonly
cd ~/code/projects/learncpp/c1
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +5 cin_example1.cpp
badd +1 in.txt
badd +1 out.txt
badd +1 uninitialized_example.cpp
badd +1 ~/code/projects/learncpp/c1
argglobal
%argdel
$argadd ~/code/projects/learncpp/c1
edit uninitialized_example.cpp
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 71 + 56) / 112)
exe '2resize ' . ((&lines * 16 + 14) / 29)
exe 'vert 2resize ' . ((&columns * 40 + 56) / 112)
exe '3resize ' . ((&lines * 12 + 14) / 29)
exe 'vert 3resize ' . ((&columns * 40 + 56) / 112)
argglobal
balt out.txt
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
lcd ~/code/projects/learncpp/c1
wincmd w
argglobal
if bufexists(fnamemodify("~/code/projects/learncpp/c1/in.txt", ":p")) | buffer ~/code/projects/learncpp/c1/in.txt | else | edit ~/code/projects/learncpp/c1/in.txt | endif
if &buftype ==# 'terminal'
  silent file ~/code/projects/learncpp/c1/in.txt
endif
balt ~/code/projects/learncpp/c1/cin_example1.cpp
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 8) / 16)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 07|
lcd ~/code/projects/learncpp/c1
wincmd w
argglobal
if bufexists(fnamemodify("~/code/projects/learncpp/c1/out.txt", ":p")) | buffer ~/code/projects/learncpp/c1/out.txt | else | edit ~/code/projects/learncpp/c1/out.txt | endif
if &buftype ==# 'terminal'
  silent file ~/code/projects/learncpp/c1/out.txt
endif
balt ~/code/projects/learncpp/c1/in.txt
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 6) / 12)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
lcd ~/code/projects/learncpp/c1
wincmd w
exe 'vert 1resize ' . ((&columns * 71 + 56) / 112)
exe '2resize ' . ((&lines * 16 + 14) / 29)
exe 'vert 2resize ' . ((&columns * 40 + 56) / 112)
exe '3resize ' . ((&lines * 12 + 14) / 29)
exe 'vert 3resize ' . ((&columns * 40 + 56) / 112)
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
