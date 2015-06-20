" vim, not vi
if &compatible
  set nocompatible
endif

syntax enable

set clipboard=unnamed

set ruler                                            " display current line/column info

set number                                           " show line numbers

set wildmode=full                                    " tab completion
set wildmenu                                         " show options for tab completion
set wildignore=*.log                                 " comma-separated list of files to ignore for tab completion

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

if has("autocmd")
  filetype plugin indent on
endif

runtime macros/matchit.vim

let mapleader=" "
let maplocalleader = "\\"

nnoremap ; :
set pastetoggle=<F2>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" remap vgf to open vertical split
" nnoremap <silent> vgf :vertical botright wincmd f<CR>

set hlsearch                                        " highlight search matches
set incsearch                                       " highlight search matches while typing
set expandtab
set shiftwidth=2                                    " tab == 2 spaces
set softtabstop=2
set sw=2
nnoremap <C-c> "+y<CR>
nnoremap gn :bn<CR>                                      " goto next buffer
nnoremap gp :bp<CR>                                      " goto previous buffer
autocmd BufNewFile,BufRead *.json set ft=javascript

if executable('ag')
  " use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

set history=10000                                    " remember a lot
set visualbell                                       " no sound
set autoread                                         " reload files changed outside vim
autocmd FocusGained,BufEnter,BufWinEnter,CursorHold,CursorMoved * :checktime

" auto-launch NERDTree
"autocmd VimEnter * if !argc() | NERDTree | endif

" auto-start NERDTree if vim starts without a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim if NERDTree is last open window
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" tell ctags where to find tags
set tags=./tags;

" open in vertical split, not horizontal
nnoremap <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufReadPost fugitive://* set bufhidden=delete " clean up Fugitive buffers

" Display current Git branch
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

"map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
"map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
"map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

set background=light
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:solarized_termcolors=256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
" colorscheme molokai
" colorscheme badwolf
" colorscheme jellybeans

highlight LineNr ctermfg=grey

" use ag instead of ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" disable vim-markdown folding
let g:vim_markdown_folding_disabled=1

nnoremap <C-n> :NERDTreeToggle<CR>                   " toggle NERDTree
nnoremap <C-h> <C-W>h                                " move to window on left
nnoremap <C-j> <C-W>j                                " move to window below
nnoremap <C-k> <C-W>k                                " move to window above
nnoremap <C-l> <C-W>l                                " move to window on right
nnoremap <C-x> <C-W>T                                " move current window to new tab
nnoremap <C-=> <C-W>=                                " equalize window size

nnoremap <Leader><Leader> <C-^>                      " jump back-and-forth between files
nnoremap <Leader>] :tabnext<CR>                      " jump to next tab
nnoremap <Leader>[ :tabprev<CR>                      " jump to prev tab
nnoremap <Leader>a :call RunAllSpecs()<CR>           " run all specs
nnoremap <Leader>ag :vsp<CR>:Ag                      " ag search, then open in vertial split
nnoremap <Leader>f :vertical botright wincmd gf<CR>  " go to file in vertical split
nnoremap <Leader>l :call RunLastSpec()<CR>           " re-run last spec
nnoremap <Leader>m <C-W>T                            " move current window to new tab
nnoremap <Leader>nc :RTcontroller<CR>
nnoremap <Leader>nf :RTfunctionaltest<CR>
nnoremap <Leader>nh :RThelper<CR>
nnoremap <Leader>ni :RTintegrationtest<CR>
nnoremap <Leader>nj :RTjavascript<CR>
nnoremap <Leader>nl :RTlayout<CR>
nnoremap <Leader>nm :RTmodel<CR>
nnoremap <Leader>ns :RTspec<CR>
nnoremap <Leader>nv :RTview<CR>
nnoremap <Leader>nu :RTunittest<CR>
nnoremap <leader>rc :vsplit $MYVIMRC<CR>             " open .vimrc in vertical split
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>    " run current spec
" use <Leader>T to jump to tag in a vertical split
" nnoremap <Leader>T :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>
" use <Leader>T to jump to tag in a new tab
nnoremap <silent><Leader>T <C-w><C-]><C-w>T
nnoremap <Leader>vc :RVcontroller<CR>
nnoremap <Leader>vf :RVfunctionaltest<CR>
nnoremap <Leader>vh :RVhelper<CR>
nnoremap <Leader>vi :RVintegrationtest<CR>
nnoremap <Leader>vj :RVjavascript<CR>
nnoremap <Leader>vl :RVlayout<CR>
nnoremap <Leader>vm :RVmodel<CR>
nnoremap <Leader>vs :RVspec<CR>
nnoremap <Leader>vv :RVview<CR>
nnoremap <Leader>vu :RVunittest<CR>
nnoremap <Leader>w <C-w>w
nnoremap <Leader>x :tabe<CR>                         " open eXtra tab

"nmap <CR> o<Esc>                                 " add line below without switching to insert mode
"nmap <S-Enter> O<Esc>                            " add line above without switching to insert mode

let g:rspec_runner = "os_x_iter"

if has("gui_macvim")
  let g:rspec_command = "spring rspec {spec}"
else
  let g:rspec_command = "!spring rspec {spec}"
endif

:inoremap <C-d> <esc>ddi

set tags=./tags;
" let g:easytags_dynamic_files = 1

" Automatically set screen title to filename (http://vim.wikia.com/wiki/Automatically_set_screen_title)
autocmd BufEnter * let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"

function! EqualSizeWindows()
  exec ":normal! \<c-w>="
endfunction

function! TabCall(tab_func)
  let Fn = function(a:tab_func)
  let tn = tabpagenr()
  let wn = winnr()
  tabdo :call Fn()
  exec ":normal! " . tn . "gt\n"
  exec ":normal! " . wn . "\<c-w>w"
endfunction

nnoremap <Leader>we :call TabCall("EqualSizeWindows")<CR>

set noswapfile
