" vim configuration file
" Guillermo Perez
" 2012 - 2013

" source SuperTab for python
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" plugins
filetype plugin on
filetype indent on

" grep will sometimes skip displaying the file name if you
" search in a single file. This confuses Latex-Suite. This
" sets grep to always generate a file name
set grepprg=grep\ -nH\ $*
" all tex files are now tex and not plaintex
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_FoldedSections=''
let g:Tex_FoldedEnvironments=''
let g:Tex_FoldedMisc=''

" standard settings
syntax on
" show line numbers and keep the width = 80
set number
au BufRead * let &numberwidth = float2nr(log10(line("$"))) + 2
          \| let &columns = &numberwidth + 80
" indent automatically
set autoindent
" read cpp_part files as c++ files
au BufNewFile,BufRead *.cpp_part set filetype=cpp
" programming language dependant tabs
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType sql setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType xml setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType htmldjango setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType jsp setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType ant setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType css setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType java setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType sh setlocal tabstop=2 shiftwidth=2 expandtab
" f7 and f8 to navigate tabs
map <F7> :tabp<Enter>
map <F8> :tabn<Enter>
imap <F7> <Esc>:tabp<Enter>
imap <F8> <Esc>:tabn<Enter>
