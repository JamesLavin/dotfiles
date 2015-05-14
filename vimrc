" vim, not vi
if &compatible
  set nocompatible
endif

" display current line/column info
set ruler

" show line numbers
set number

set wildmode=full                                    " tab completion
set wildmenu                                         " show options for tab completion
set wildignore=*.log                                 " comma-separated list of files to ignore for tab completion

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

let mapleader=" "
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
map <C-c> "+y<CR>
map gn :bn<CR>                                      " goto next buffer
map gp :bp<CR>                                      " goto previous buffer
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

set history=100                                      " remember a lot
set visualbell                                       " no sound
set autoread                                         " reload files changed outside vim

" auto-launch NERDTree
"autocmd VimEnter * if !argc() | NERDTree | endif

" auto-start NERDTree if vim starts without a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim if NERDTree is last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" tell ctags where to find tags
set tags=./tags;

" open in vertical split, not horizontal
map <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufReadPost fugitive://* set bufhidden=delete " clean up Fugitive buffers

" Display current Git branch
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" map <Leader><Leader> to jump back-and-forth between files
map <Leader><Leader> <C-^>

" congfigure vim-rspec
map <Leader>rf :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>

"map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
"map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
"map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

" configure NERDTree
map <C-n> :NERDTreeToggle<CR>
"map <Leader>nt :call NERDTreeToggle()<CR>

" colorscheme solarized

"set background=dark
highlight LineNr ctermfg=grey
"colorscheme jellybeans

" use ag instead of ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" Automatically set screen title to filename (http://vim.wikia.com/wiki/Automatically_set_screen_title)
autocmd BufEnter * let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"
