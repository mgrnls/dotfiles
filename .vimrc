" Want to experiment with following link at some point.
" https://stackoverflow.com/questions/2362914/fold-function-in-vim


" Set up the comma key to be the leader
let mapleader=","

" Basic remaps.
inoremap <Leader>a <right>
inoremap jk <esc>
nnoremap <Leader>w :w<enter>
nnoremap <Leader>q :q<enter>
nnoremap <Leader>n :call ToggleNetrw()<enter>
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

" Setting up stuff
filetype plugin indent on
set nu
set nocompatible
set tabstop=4
set wrap linebreak
set expandtab
set shiftwidth=4
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
set formatoptions-=t
set formatoptions+=cro
set spelllang=en_gb
set hlsearch
set incsearch
set ignorecase
set smartcase
set wildmenu
set autochdir
set nowrap
set background=dark
colo slate
syntax on

autocmd BufRead,BufNewFile *.md setl cc=0 nowrap!
autocmd BufRead,BufNewFile *.md nnoremap <F5> :!clear;pandoc -f markdown -t plain % \| less -S<enter>
autocmd BufRead,BufNewFile *.cpp nnoremap <F5> :!clear;g++ %;./a.out<enter>
autocmd BufRead,BufNewFile *.py nnoremap <F5> :!clear;python3 %<enter>
autocmd BufRead,BufNewFile *.q nnoremap <F5> :!clear;rlwrap q %<enter>
autocmd BufRead,BufNewFile *.q setl tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.tex nnoremap <leader>c :!clear;pdflatex %<enter>
autocmd BufRead,BufNewFile *.tex setl tabstop=2 shiftwidth=2 cc=0
autocmd FileType markdown setl cc=0 spell com=b:-,b:1. fo=roqln
autocmd BufRead .vimrc setl tabstop=2 shiftwidth=2
autocmd FileType python setl cc=79 tw=79

" Set up netrw to act like NERDTree, open :Explore with ,n.
let g:netrw_banner=0
let g:netrw_winsize=25
let g:netrw_dirhistmax = 0

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

function! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
"autocmd BufWritePre * call TrimWhitespace()

" Temporary, used to compile things...
autocmd BufRead,BufNewFile *.md nnoremap <Leader>W :!clear;pandoc -f markdown -t html --template ~/.templates/pandoc.html -o index.html %<enter>

" Add statusline with filename
set laststatus=2
set stl=%#Comment#\ %t
