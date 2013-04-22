set nocompatible                                     " vim, not vi
filetype off

syntax on
filetype plugin indent on
set nohlsearch                                      " don't highlight search matches
set incsearch                                       " highlight search matches while typing
set expandtab
set shiftwidth=2                                    " tab == 2 spaces
set softtabstop=2
set sw=2
map <C-c> "+y<CR>
autocmd BufNewFile,BufRead *.json set ft=javascript
set grepprg=ack-grep\ -a
set history=1000                                     " remember a lot
set visualbell                                       " no sound
set autoread                                         " reload files changed outside vim
"autocmd VimEnter * if !argc() | NERDTree | endif    " auto-launch NERDTree

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" https://github.com/gmarik/vundle#readme
Bundle 'gmarik/vundle'

" https://github.com/chrisbra/Recover.vim#readme
Bundle "chrisbra/Recover.vim"

" https://github.com/scrooloose/syntastic#readme
Bundle "scrooloose/syntastic"

" https://github.com/astashov/vim-ruby-debugger#readme
let g:ruby_debugger_no_maps = 1                      " disable key bindings because they conflict with Command-T
Bundle "astashov/vim-ruby-debugger"

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
Bundle "scrooloose/snipmate-snippets"
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
"git://github.com/tsaleh/vim-tcomment"
Bundle "tsaleh/vim-tmux"
Bundle "vim-ruby/vim-ruby"
Bundle "mileszs/ack.vim"
Bundle "vim-scripts/Gist.vim"
Bundle 'vim-scripts/IndexedSearch'
Bundle 'vim-scripts/jQuery'
Bundle "henrik/vim-indexed-search"
Bundle 'hallettj/jslint'
Bundle "chrisbra/NrrwRgn"
Bundle "hsitz/VimOrganizer"
Bundle 'altercation/vim-colors-solarized'

" https://github.com/wincent/Command-T#readme
Bundle "wincent/Command-T"

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

colorscheme jellybeans
"set background=dark
"colorscheme solarized
