let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/prg/dev/c/sample
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +15 struct.c
badd +0 in.txt
badd +0 out.txt
argglobal
%argdel
edit struct.c
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
exe 'vert 1resize ' . ((&columns * 95 + 96) / 192)
exe '2resize ' . ((&lines * 23 + 24) / 48)
exe 'vert 2resize ' . ((&columns * 96 + 96) / 192)
exe '3resize ' . ((&lines * 23 + 24) / 48)
exe 'vert 3resize ' . ((&columns * 96 + 96) / 192)
argglobal
let s:l = 15 - ((14 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 15
normal! 09|
wincmd w
argglobal
if bufexists(fnamemodify("in.txt", ":p")) | buffer in.txt | else | edit in.txt | endif
if &buftype ==# 'terminal'
  silent file in.txt
endif
balt struct.c
let s:l = 1 - ((0 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 08|
wincmd w
argglobal
if bufexists(fnamemodify("out.txt", ":p")) | buffer out.txt | else | edit out.txt | endif
if &buftype ==# 'terminal'
  silent file out.txt
endif
balt struct.c
let s:l = 2 - ((1 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 95 + 96) / 192)
exe '2resize ' . ((&lines * 23 + 24) / 48)
exe 'vert 2resize ' . ((&columns * 96 + 96) / 192)
exe '3resize ' . ((&lines * 23 + 24) / 48)
exe 'vert 3resize ' . ((&columns * 96 + 96) / 192)
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
