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
  filetype on                                        " enable file type detection
  filetype plugin indent on
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd FileType ruby runtime ruby_mappings.vim
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

set splitright                                      " add vertical split on right
set hlsearch                                        " highlight search matches
set incsearch                                       " highlight search matches while typing
set shiftwidth=2                                    " tab == 2 spaces
set softtabstop=2
set tabstop=2
set expandtab                                       " insert spaces, not tabs, because tabs suck
set sw=2

autocmd BufNewFile,BufRead *.json set ft=javascript

if executable('ag')
  " use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

set splitright
set splitbelow
set switchbuf+=usetab,newtab

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" I hate horizontal splits
cabbrev split vsplit
cabbrev hsplit split
cabbrev sta vertical sta
cabbrev help vertical help
cabbrev new vnew
cabbrev right botright

set history=10000                                    " remember a lot
set visualbell                                       " no sound
set autoread                                         " reload files changed outside vim
autocmd FocusGained,BufEnter,BufWinEnter,CursorHold,CursorMoved * :checktime

" autocmd Bufread,BufNewFile *.feature set filetype=gherkin
" autocmd! Syntax gherkin source ~/.vim/cucumber.vim

" auto-launch NERDTree
"autocmd VimEnter * if !argc() | NERDTree | endif

" auto-start NERDTree if vim starts without a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim if NERDTree is last open window
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" tell ctags where to find tags
set tags=./tags;

autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufReadPost fugitive://* set bufhidden=delete " clean up Fugitive buffers

" Display current Git branch
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

function! AirlineInit()
  let g:airline_section_a = airline#section#create_left(['mode', 'paste', 'iminsert'])
  let g:airline_section_b = airline#section#create(['hunks', 'branch'])
  let g:airline_section_c = airline#section#create(['%<', 'file'])
  let g:airline_section_gutter = airline#section#create(['%='])
  let g:airline_section_x = airline#section#create_right([])
  let g:airline_section_y = airline#section#create_right([])
  "let g:airline_section_z = airline#section#create(['windowswap', '%3p%%'.spc, 'linenr', ':%3v '])
  let g:airline_section_z = airline#section#create(['windowswap', '%3p%%', 'linenr', ':%3v '])
  let g:airline_section_warning = airline#section#create(['syntastic'])
endfunction
autocmd VimEnter * call AirlineInit()

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

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'c'    : '#H',
      \'win'  : '#I #W',
      \'cwin' : '#I #W'}

highlight LineNr ctermfg=grey

" use ag instead of ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" disable vim-markdown folding
let g:vim_markdown_folding_disabled=1

" go to next buffer
nnoremap gn :bn<CR>
" go to previous buffer
nnoremap gp :bp<CR>

" use ,f to jump to tag in a vertical split
nnoremap <silent> ,f :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>

" open in vertical split, not horizontal
nnoremap <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" ???
nnoremap <C-c> "+y<CR>
" toggle NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
" move to window on left
nnoremap <C-h> <C-W>h
" move to window below
nnoremap <C-j> <C-W>j
" move to window above
nnoremap <C-k> <C-W>k
" move to window on right
nnoremap <C-l> <C-W>l
" move current window to new tab
nnoremap <C-x> <C-W>T
" auto-equalize window size
autocmd VimResized * wincmd =

" maximize window size
nnoremap <Leader>- :wincmd _<CR>:wincmd \|<CR>
" equalize window size
nnoremap <Leader>= :wincmd =<CR>
" jump back-and-forth between files
nnoremap <Leader><Leader> <C-^>
" browse tags using Ctrl-P
nnoremap <leader>. :CtrlPTag<CR>
" jump to next tab
nnoremap <Leader>] :tabnext<CR>
" jump to prev tab
nnoremap <Leader>[ :tabprev<CR>
" run all specs
nnoremap <Leader>a :call RunAllSpecs()<CR>
" create vertical split and start ag search
nnoremap <Leader>ag :vsp<CR>:Ag 
nnoremap <Leader>e :call TabCall("EqualSizeWindows")<CR>
" remap vgf to open file in vertical split
" nnoremap <silent> vgf :vertical botright wincmd f<CR>
" use ,gf to go to file in a vertical split
" nnoremap <silent> ,gf :vertical botright wincmd f<CR>
" go to file in vertical split
nnoremap <Leader>f :vertical botright wincmd gf<CR>
" re-run last spec
nnoremap <Leader>l :call RunLastSpec()<CR>
" move current window to new tab
nnoremap <Leader>m <C-W>T
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
nnoremap <Leader>o :TagbarToggle<CR>
" open .vimrc in vertical split
nnoremap <Leader>rc :vsplit $MYVIMRC<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
" run current spec
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
" use <Leader>T to jump to tag in a vertical split
" nnoremap <Leader>T :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>
" use <Leader>T to jump to tag in a new tab
nnoremap <silent><Leader>T <C-w><C-]><C-w>T
" add line above without switching to insert mode
nnoremap <Leader>u :pu!_<Enter>
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
" switch window
nnoremap <Leader>w <C-w>w
" open eXtra tab
nnoremap <Leader>x :tabe<CR>

" add line below without switching to insert mode
nnoremap <Leader><CR> :pu_<Enter>

let g:rspec_runner = "os_x_iter"

"if has("gui_macvim")
"  let g:rspec_command = "spring rspec {spec}"
"else
"  let g:rspec_command = "!spring rspec {spec}"
"endif

:inoremap <C-d> <esc>ddi

" can't get easytags working
" set tags=./tags;
" let g:easytags_dynamic_files = 1
" let g:easytags_events = ['BufWritePost']

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

" mode aware cursors
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set noswapfile
