let mapleader=","

inoremap <Leader>a <right>
inoremap jk <esc>
nnoremap <Leader>w :w<enter>
nnoremap <Leader>q :q<enter>
nnoremap <Leader>d :bd<enter>
nnoremap <C-n> :bn<enter>
nnoremap <C-p> :bp<enter>
nnoremap <Leader><Leader> ,
nnoremap <F2> :setlocal spell!<enter>
nnoremap <Leader>/ :let @/ = ""<enter>
vnoremap < <gv
vnoremap > >gv
nnoremap <Leader>s a<C-X>s
nnoremap j gj
nnoremap k gk

set number
set nocompatible
set tabstop=4
set linebreak
set expandtab
set shiftwidth=4
set hidden
set colorcolumn=100
set textwidth=100
set backspace=2
set backspace=eol,indent,start
set scrolloff=5
set tags=tags;
set formatoptions-=t
set formatoptions+=cro
set spelllang=en_gb
set hlsearch
set incsearch
set ignorecase
set smartcase
set wildmenu
set nowrap
set term=xterm-256color
set background=dark
set noswapfile
syntax on

autocmd BufRead,BufNewFile *.q setl tabstop=2 shiftwidth=2
autocmd FileType markdown setlocal cc=0 spell com=b:-,b:1. fo=roqln
autocmd FileType gitcommit setlocal cc=72 textwidth=72 spell

let g:netrw_banner=0

set laststatus=2
set stl=%#Comment#\ %t
