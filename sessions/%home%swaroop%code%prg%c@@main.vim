let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/code/prg/c
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 c.c
badd +1 in.txt
badd +4 out.txt
badd +1 ~/code/prg/c/processes/fork.c
badd +2 processes/out.txt
badd +1 processes/in.txt
badd +18 processes/waiting.c
badd +8 processes/waiting2.c
argglobal
%argdel
$argadd c.c
edit processes/waiting2.c
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
exe 'vert 1resize ' . ((&columns * 110 + 68) / 137)
exe '2resize ' . ((&lines * 17 + 18) / 36)
exe 'vert 2resize ' . ((&columns * 26 + 68) / 137)
exe '3resize ' . ((&lines * 18 + 18) / 36)
exe 'vert 3resize ' . ((&columns * 26 + 68) / 137)
argglobal
balt processes/waiting.c
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
8
normal! zo
13
normal! zo
15
normal! zo
15
normal! zo
15
normal! zo
15
normal! zo
15
normal! zo
let s:l = 8 - ((7 * winheight(0) + 18) / 36)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 8
normal! 07|
wincmd w
argglobal
if bufexists(fnamemodify("processes/in.txt", ":p")) | buffer processes/in.txt | else | edit processes/in.txt | endif
if &buftype ==# 'terminal'
  silent file processes/in.txt
endif
balt in.txt
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 8) / 17)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 02|
wincmd w
argglobal
if bufexists(fnamemodify("processes/out.txt", ":p")) | buffer processes/out.txt | else | edit processes/out.txt | endif
if &buftype ==# 'terminal'
  silent file processes/out.txt
endif
balt out.txt
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 2 - ((1 * winheight(0) + 9) / 18)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 110 + 68) / 137)
exe '2resize ' . ((&lines * 17 + 18) / 36)
exe 'vert 2resize ' . ((&columns * 26 + 68) / 137)
exe '3resize ' . ((&lines * 18 + 18) / 36)
exe 'vert 3resize ' . ((&columns * 26 + 68) / 137)
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
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
