" vim configuration file
" Guillermo A. Perez - 2019

" === Personal preferences and shortcuts ===
" Set textwidth to 80 to be terminal/console friendly
" It also allows to keep typing and vim will auto break your
" text at the 80th col
set tw=80
" show line numbers
set number
" indent automatically
set autoindent
" highlight all search pattern matches
set hlsearch
" to go through buffers easily let us use f8, f9 for prev and next
nmap <F8> :bp<CR>
nmap <F9> :bn<CR>

" === External package management (via vim-plug) ===
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'rhysd/vim-llvm'
Plug 'nvie/vim-flake8'
call plug#end()

" === Good coding practices/checks ===
" Python flake8 called on f7 (script default) and on save
autocmd BufWritePost *.py call Flake8()

" === Filetype stuff ===
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
autocmd FileType ll setlocal tabstop=4 shiftwidth=4 expandtab
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
