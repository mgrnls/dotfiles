filetype plugin indent on
set nocompatible
set mouse=a
set tabstop=4
set wrap linebreak
set expandtab
set shiftwidth=4
set nu
set rnu
set hidden
set colorcolumn=80
set textwidth=80
set backspace=2
set backspace=eol,indent,start
set scrolloff=5
set tags=tags;
set splitright
set splitbelow
set belloff=all
set foldmethod=indent
set nofoldenable
set formatoptions-=t
set formatoptions+=cro
set spelllang=en_gb
set background=dark
set hlsearch
set incsearch
set ignorecase
set smartcase
set wildmenu
set showcmd
set autochdir
colorscheme slate
syntax on

autocmd BufRead,BufNewFile *.q setl tabstop=2 shiftwidth=2
autocmd FileType markdown setl cc=0 spell com=b:-,b:1. fo=roqln
autocmd BufRead .vimrc setl tabstop=2 shiftwidth=2
autocmd FileType python setl cc=79 tw=79

if has("gui_running")
  if has("mac")
    set gfn=Menlo:h14
  endif
endif

let mapleader=","

inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap " ""<left>
nnoremap '' ''<left>
inoremap <Leader>a <right>
inoremap jj <esc>
inoremap <F5> <esc>:setlocal spell!<enter>i
nnoremap <Leader>w :w<enter>
nnoremap <Leader>q :q<enter>
nnoremap <Leader>x :x<enter>
nnoremap <Leader>n :call ToggleNetrw()<enter>
nnoremap <Leader>Q :q!<enter>
nnoremap <Leader>d :bd<enter>
nnoremap <Leader>b ^
nnoremap <Leader>e $
nnoremap <Leader>o :e<space>
nnoremap <C-n> :bn<enter>
nnoremap <C-p> :bp<enter>
nnoremap <Leader><Leader> ,
nnoremap <F5> :setlocal spell!<enter>
xnoremap <Leader>( c(<esc>pa)<esc>
xnoremap <Leader>{ c{<esc>pa}<esc>
xnoremap <Leader>[ c[<esc>pa]<esc>
nnoremap <Leader>( di(va(p
nnoremap <Leader>[ di[va]p
nnoremap <Leader>{ di{va}p
nnoremap <Leader>/ :let @/ = ""<enter>
vnoremap < <gv
vnoremap > >gv
nnoremap <Leader>s a<C-X>s
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Experimental!
nnoremap j gj
nnoremap k gk

" indent guide
let g:indent_guides_enable_on_vim_startup=1

" Set up netrw to act like NERDTree, open :Explore with ,n.
let g:netrw_banner=0
let g:netrw_winsize=25

" Fix the Lexplore toggle.
let g:NetrwIsOpen=0

function! ToggleNetrw()
  if g:NetrwIsOpen
    let i = bufnr("$")
    while (i >= 1)
      if (getbufvar(i, "&filetype") == "netrw")
        silent exe "bwipeout " . i
      endif
      let i-=1
    endwhile
    let g:NetrwIsOpen=0
  else
    let g:NetrwIsOpen=1
    silent Lexplore
  endif
endfunction

" Delete trailing white space every time you save.
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
autocmd BufWritePre * call TrimWhitespace()

" Add statusline with buffer number, filename and line count.
set laststatus=2
set stl=\ %n\ \|\ %t%m

" Notes to self
" =============
" Use `zi` to toggle all folds, and then use `za` to open/close a single fold.
" This will only toggle folds locally.
