" vim configuration file
" Guillermo Perez
" 2012 - 2013

" Set textwidth to 80 to be terminal/console friendly
" It also allows to keep typing and vim will auto break your
" text at the 80th col
set tw=80

" loading Pathogen to manage my plugins
" in an ordered fashion
filetype off
call pathogen#incubate()
call pathogen#helptags()

" Syntax highlight and validation
syntax on
filetype on
filetype plugin indent on
set hlsearch

" easytags, update only on save,
" load and others
let g:easytags_always_enabled = 1
let g:easytags_on_cursorhold = 0

" Pyflakes for checking code
" and PEP8 for python, all in flake8
" called on f7
autocmd BufWritePost *.py call Flake8()

" Setting the map for the todo
map <leader>t <Plug>TaskList

" source SuperTab for python
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" NERD Tree
map <leader>n :NERDTreeToggle<CR>

" to go through buffers easily let us use f8, f9 for prev and next
nmap <F8> :bp<CR>
nmap <F9> :bn<CR>

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
let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode --shell-escape $*'
let g:Tex_FoldedSections=''
let g:Tex_FoldedEnvironments=''
let g:Tex_FoldedMisc=''

" standard settings
" licenses
map :gpl-c :0r ~/.vim/gpl-c.txt
map :gpl-python :0r ~/.vim/gpl-python.txt
" show line numbers
set number
" indent automatically
set autoindent
" read ctp files as php files
au BufNewFile,BufRead *.ctp set filetype=php
" read cpp_part files as c++ files
au BufNewFile,BufRead *.cpp_part set filetype=cpp
" programming language dependant tabs
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType sql setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType bib setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType xml setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType xslt setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType php setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType htmldjango setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType jsp setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType ant setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType css setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType java setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType scala setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType sh setlocal tabstop=2 shiftwidth=2 expandtab
