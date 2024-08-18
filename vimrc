source $VIMRUNTIME/vimrc_example.vim

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

set noeb vb t_vb=
set vb t_vb=

set lazyredraw
"Disable guioptions
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

"No Undo File
set backupdir^=$HOME/Temp//
set directory^=$HOME/Temp//
set undodir^=$HOME/Temp//

" Set Indentation
set shiftwidth=2
set autoindent
set smartindent

"Colorscheme
colorscheme desertink

" turn relative line numbers on
set relativenumber
set nu rnu

" Airline config
set encoding=utf-8
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h9:cANSI
let g:Powerline_symbols = "fancy"

" Tab Navigation like Firefox
nnoremap <C-Left> :bprevious<CR>
nnoremap <C-Right> :bnext<CR>


if has("win32")
  "Windows options here
  " Copy / Paste
  nmap <C-s> mzggVG"*y`z
  nnoremap zj mz"yyy"yP`z
else
  if has("unix")
    "Unix options here
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
      "Mac options here
    endif
  endif
endif

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
if has("win32")
  call plug#begin('C:\Users\<username>\MY_DATA\vim_plugged')
endif
if has("unix")
  call plug#begin()
endif
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'kien/ctrlp.vim'
" Initialize plugin system
call plug#end()

if has("gui_running")
"  nnoremap <F12> :silent! :so ./vim/xx.l<CR>
"  nnoremap <C-Up> :silent! :so ./vim/xx.l<CR>
"  nnoremap <C-Down> :silent! :so Vim/yy.l<CR>
  nnoremap <C-Up> :silent! let &guifont = substitute(
   \ &guifont,
   \ ':h\zs\d\+',
   \ '\=eval(submatch(0)+1)',
   \ 'g')<CR><CR>
  nnoremap <C-Down> :silent! let &guifont = substitute(
   \ &guifont,
   \ ':h\zs\d\+',
   \ '\=eval(submatch(0)-1)',
   \ 'g')<CR><CR>
endif
