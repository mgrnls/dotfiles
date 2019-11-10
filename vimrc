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
syntax on

autocmd BufRead,BufNewFile *.q set tabstop=2|set shiftwidth=2

inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap " ""<left>
inoremap ,a <right>
inoremap jj <esc>
inoremap <F1> <esc>:call ToggleWhiteSpaceHighlighting()<enter>i
nnoremap ,w :w<enter>
nnoremap ,q :q<enter>
nnoremap ,x :x<enter>
nnoremap ,e :e<space>
nnoremap ,n :call ToggleNetrw()<enter>
nnoremap ,k :q!<enter>
nnoremap ,d :bd<enter>
nnoremap <F1> :call ToggleWhiteSpaceHighlighting()<enter>
nnoremap <C-n> :bn<enter>
nnoremap <C-p> :bp<enter>
nnoremap ,, ,

set backspace=2
set backspace=eol,indent,start

" better scrolling
set scrolloff=5

" indent guide
let g:indent_guides_enable_on_vim_startup = 1

colorscheme slate
set background=dark

set tags=tags;

set splitright
set splitbelow

set foldmethod=indent
" Turn off folding when you open or change to a new buffer.
" Use zi to toggle all folding.
set nofoldenable

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

" Toggle white space highlighting
let g:WhiteSpaceHighlighting=0
highlight TrailingSpace ctermbg=darkgreen  guibg=darkgreen

function! ToggleWhiteSpaceHighlighting()
    if g:WhiteSpaceHighlighting
        silent match
        let g:WhiteSpaceHighlighting=0
    else
        silent match TrailingSpace /\s\+$/
        let g:WhiteSpaceHighlighting=1
    endif
endfunction

" Delete trailing whitespace everytime you save.
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * call TrimWhitespace()

" Add statusline with very basic info.
set laststatus=2
set stl=\ %t%m\ \|\ buffer\:\ %n%=line\:\ %l/%L\ (%p%%)\ "
