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

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')

" https://github.com/gmarik/vundle#readme
Plugin 'gmarik/Vundle.vim'

" reStructuredText in Vim
Plugin 'Rykka/riv.vim'

" https://github.com/vim-scripts/greplace.vim
Bundle 'vim-scripts/greplace.vim'

Bundle 'vim-scripts/Vim-R-plugin'

" https://github.com/chrisbra/Recover.vim#readme
Plugin 'chrisbra/Recover.vim'

" https://github.com/scrooloose/syntastic#readme
Plugin 'scrooloose/syntastic'

" https://github.com/astashov/vim-ruby-debugger#readme
Plugin 'astashov/vim-ruby-debugger'
" let g:ruby_debugger_no_maps = 1                      " disable key bindings because they conflict with Command-T
" https://github.com/wincent/Command-T#readme
" Replace Command-T with ctrlp
" Bundle "wincent/Command-T"
" https://github.com/kien/ctrlp.vim/blob/master/readme.md#readme
Bundle "https://github.com/kien/ctrlp.vim"

" https://github.com/mattn/gist-vim/blob/master/README.mkd#readme
Bundle "mattn/gist-vim.git"

" https://github.com/ervandew/supertab#readme
Plugin 'ervandew/supertab'

" https://github.com/godlygeek/tabular#readme
Plugin 'godlygeek/tabular'

" https://github.com/depuracao/vim-rdoc#readme
Plugin 'depuracao/vim-rdoc'

" https://github.com/thoughtbot/vim-rspec#readme
Plugin 'thoughtbot/vim-rspec'

" https://github.com/garbas/vim-snipmate#readme
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
" Plugin 'scrooloose/snipmate-snippets'
Plugin 'garbas/vim-snipmate'

" https://github.com/scrooloose/nerdtree#readme
Plugin 'scrooloose/nerdtree'

" https://github.com/scrooloose/nerdcommenter#readme
Plugin 'scrooloose/nerdcommenter'

Plugin 'airblade/vim-gitgutter'

Plugin 'timcharper/textile.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-characterize'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-heroku'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-repeat'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vividchalk'
"git://github.com/tsaleh/taskpaper.vim"

" Plugin 'tomtom/tcomment_vim'
"git://github.com/tsaleh/vim-tcomment"

" Trying ag as ack replacement
Plugin 'rking/ag.vim'
" Plugin 'mileszs/ack.vim'

"Plugin 'tsaleh/vim-matchit' " replaced with vim-sensible
Plugin 'tsaleh/vim-shoulda'
"git://github.com/tsaleh/vim-tcomment"
Plugin 'vim-ruby/vim-ruby'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/Gist.vim'
Plugin 'vim-scripts/IndexedSearch'
Plugin 'vim-scripts/jQuery'
Plugin 'henrik/vim-indexed-search'
Plugin 'hallettj/jslint.vim'
Plugin 'chrisbra/NrrwRgn'
Plugin 'hsitz/VimOrganizer'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'

call vundle#end()
filetype plugin indent on     " required!

" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install(update) plugins
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..

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

"colorscheme solarized

"set background=dark
highlight LineNr ctermfg=grey
colorscheme jellybeans

" use ag instead of ack
let g:ackprg = 'ag --nogroup --nocolor --column'
