" set standard file encoding
set encoding=utf8

" no special per file vim overrides
set nomodeline

" stop word wrapping
set nowrap

 "except on markdown
 autocmd FileType markdown setlocal wrap

 "and for gitcommits
 autocmd Filetype gitcommit setlocal spell textwidth=72

" adjust system undo levels
set undolevels=100

" use system clipboard
set clipboard=unnamed

" Set tab width and convert to spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Make vim shut up
set conceallevel=1
set noerrorbells

" visuals
set number " sets line numbers in gutter
set title "sets title at top of tab to be filename
syntax enable " syntax highlighting
hi LineNr   ctermfg=gray ctermbg=NONE

" search higlighting
set hlsearch

" space around screen edges
set scrolloff=1
set sidescrolloff=5
