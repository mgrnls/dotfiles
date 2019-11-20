filetype plugin indent on
set mouse=a
set tabstop=4
set wrap linebreak
set expandtab
set shiftwidth=4
set nu
set rnu
set hidden
set colorcolumn=80
set backspace=2
set backspace=eol,indent,start
set scrolloff=5
set tags=tags;
set splitright
set splitbelow
set belloff=all
set foldmethod=indent
set nofoldenable
set formatoptions+=cro
set spelllang=en_gb
set background=dark
set hlsearch
set incsearch
set ignorecase
set smartcase
colorscheme slate
syntax on

autocmd BufRead,BufNewFile *.q setl tabstop=2|set shiftwidth=2
autocmd FileType markdown setl cc=0 spell com=b:-,b:1. fo=tcroqln
autocmd BufRead .vimrc setl tabstop=2 shiftwidth=2

if has("gui_running")
  if has("mac")
    set gfn=Menlo:h16
  endif
endif

inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap " ""<left>
inoremap ,a <right>
inoremap jj <esc>
nnoremap ,w :w<enter>
nnoremap ,q :q<enter>
nnoremap ,x :x<enter>
nnoremap ,e :e<space>
nnoremap ,n :call ToggleNetrw()<enter>
nnoremap ,k :q!<enter>
nnoremap ,d :bd<enter>
nnoremap <C-n> :bn<enter>
nnoremap <C-p> :bp<enter>
nnoremap ,, ,

" Experimental... surround highlighted text and then undo it
nnoremap ,s :setlocal spell!<enter>
xnoremap ,( c(<esc>pa)<esc>
xnoremap ,{ c{<esc>pa}<esc>
xnoremap ,[ c[<esc>pa]<esc>
nnoremap ,u( di(va(p
nnoremap ,u[ di[va]p
nnoremap ,u{ di{va}p

" Also experimental, clear search pattern (so no highlighting)
nnoremap ,/ :let @/ = ""<enter>

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

" Delete trailing whitespace everytime you save.
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
autocmd BufWritePre * call TrimWhitespace()

" Add statusline with buffer number, filename and line count.
set laststatus=2
set stl=%#LineNr#\ %n\ \|\ %t%m%=\ line\:\ %l/%L\ (%p%%)\ "
