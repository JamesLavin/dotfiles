set nocompatible                                     " vim, not vi
set wildmode=full                                    " tab completion
set wildmenu                                         " show options for tab completion
set wildignore=*.log                                 " comma-separated list of files to ignore for tab completion
filetype off

" remap <Leader> to ","
let mapleader=","
nnoremap ; :
set pastetoggle=<F2>

syntax on
filetype plugin indent on
nnoremap <silent> vgf :vertical botright wincmd f<CR> " remap vgf to open vertical split 
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
set grepprg=ack                                      " use ack instead of grep
set history=1000                                     " remember a lot
set visualbell                                       " no sound
set autoread                                         " reload files changed outside vim
"autocmd VimEnter * if !argc() | NERDTree | endif    " auto-launch NERDTree
set ruler                                            " display current line/column info
set number                                           " show line numbers

set tags=./tags;                                     " tell ctags where to find tags
" open in vertical split, not horizontal
map <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

autocmd BufReadPost fugitive://* set bufhidden=delete " clean up Fugitive buffers

" Display current Git branch
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" https://github.com/gmarik/vundle#readme
Bundle 'gmarik/vundle'

" https://github.com/vim-scripts/greplace.vim
Bundle 'vim-scripts/greplace.vim'

" https://github.com/chrisbra/Recover.vim#readme
Bundle "chrisbra/Recover.vim"

" https://github.com/scrooloose/syntastic#readme
Bundle "scrooloose/syntastic"

" https://github.com/astashov/vim-ruby-debugger#readme
" let g:ruby_debugger_no_maps = 1                      " disable key bindings because they conflict with Command-T
Bundle "astashov/vim-ruby-debugger"
" https://github.com/wincent/Command-T#readme
" Replace Command-T with ctrlp
" Bundle "wincent/Command-T"
" https://github.com/kien/ctrlp.vim/blob/master/readme.md#readme
Bundle "https://github.com/kien/ctrlp.vim"

" https://github.com/mattn/gist-vim/blob/master/README.mkd#readme
Bundle "mattn/gist-vim.git"

" https://github.com/ervandew/supertab#readme
Bundle "ervandew/supertab"

" https://github.com/godlygeek/tabular#readme
Bundle "godlygeek/tabular"

" https://github.com/depuracao/vim-rdoc#readme
Bundle "depuracao/vim-rdoc"

" https://github.com/thoughtbot/vim-rspec#readme
Bundle "thoughtbot/vim-rspec"

" https://github.com/garbas/vim-snipmate#readme
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"
" Bundle "scrooloose/snipmate-snippets"
Bundle "garbas/vim-snipmate"

" https://github.com/scrooloose/nerdtree#readme
Bundle "scrooloose/nerdtree"

" https://github.com/scrooloose/nerdcommenter#readme
Bundle "scrooloose/nerdcommenter"

Bundle "airblade/vim-gitgutter"

Bundle "timcharper/textile.vim"
Bundle "kchmck/vim-coffee-script"
Bundle "tpope/vim-characterize"
Bundle "tpope/vim-cucumber"
Bundle "tpope/vim-dispatch"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-git"
Bundle "tpope/vim-haml"
Bundle "pangloss/vim-javascript"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-rake"
Bundle "tpope/vim-repeat"
Bundle "ecomba/vim-ruby-refactoring"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-vividchalk"
"git://github.com/tsaleh/taskpaper.vim"
Bundle "tsaleh/vim-matchit"
Bundle "tsaleh/vim-shoulda"
Bundle "tomtom/tcomment_vim"
"git://github.com/tsaleh/vim-tcomment"
Bundle "vim-ruby/vim-ruby"

" Trying ag as ack replacement
Bundle "rking/ag.vim"
" Bundle "mileszs/ack.vim"

Bundle "vim-scripts/Gist.vim"
Bundle 'vim-scripts/IndexedSearch'
Bundle 'vim-scripts/jQuery'
Bundle "henrik/vim-indexed-search"
Bundle 'hallettj/jslint.vim'
Bundle "chrisbra/NrrwRgn"
Bundle "hsitz/VimOrganizer"
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

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

colorscheme jellybeans
"set background=dark
"colorscheme solarized

