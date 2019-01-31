" vim configuration file
" Guillermo Perez
" 2014

" Set textwidth to 80 to be terminal/console friendly
" It also allows to keep typing and vim will auto break your
" text at the 80th col
set tw=80

" loading Pathogen to manage my plugins
" in an ordered fashion
call pathogen#infect("bundle/{}")
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
" called on f7 (script default) and on save
autocmd BufWritePost *.py call Flake8()
" Call gjslint on save for javascript
autocmd BufWritePost *.js call GSJLinter()

" google-closure-linter called on save
" for javascript files
autocmd BufWritePost *.js call GJSLinter()

" source SuperTab for python
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" to go through buffers easily let us use f8, f9 for prev and next
nmap <F8> :bp<CR>
nmap <F9> :bn<CR>
imap <buffer> <F10> <Plug>Tex_Completion

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
let g:Imap_UsePlaceHolders=0
let g:Tex_SectionMaps=0
let g:Imap_FreezeImap=1

" show line numbers
set number
" indent automatically
set autoindent
" read ctp files as php files
au BufNewFile,BufRead *.ctp set filetype=php
" read cpp_part files as c++ files
au BufNewFile,BufRead *.cpp_part set filetype=cpp
" read sty files as tex files
au BufNewFile,BufRead *.sty set filetype=tex
" programming language dependant tabs
autocmd FileType lex setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType yacc setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType asm setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType sql setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType haskell setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType bib setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType scala setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType sh setlocal tabstop=4 shiftwidth=4 expandtab
" for these I economize spaces
autocmd FileType tex setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType java setlocal tabstop=2 shiftwidth=2 expandtab
" for web programming I also economize spaces
autocmd FileType xml setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType xslt setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType php setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType htmldjango setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType jsp setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType ant setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType css setlocal tabstop=2 shiftwidth=2 expandtab
