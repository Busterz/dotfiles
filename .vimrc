" Display & Navigation
set number                  " Show line numbers
set relativenumber        " Show relative line numbers (essential for Vim jumping)
set cursorline              " Highlight current line
set scrolloff=8             " Keep 8 lines visible above/below cursor when scrolling

" Tabs & Indentation
set tabstop=4               " Number of visual spaces per TAB
set softtabstop=4           " Number of spaces in tab when editing
set shiftwidth=4            " Indents with >> and <<
set expandtab               " Tabs are spaces

" Quality of Life
set ignorecase              " Case insensitive searching...
set smartcase               " ...unless query contains uppercase letters
set clipboard=unnamedplus   " Sync Vim clipboard with system clipboard (requires xclip or xsel)
set undofile                " Save undo history across session restarts
set undodir=~/.vim/undodir

" Improve Markdown & Text editing experience
" Wraps long lines visually at word boundaries without inserting physical line breaks into the raw file
autocmd FileType markdown,text setlocal wrap linebreak
" Highlights misspelled english words in red. Use 'z=' over a word to see correction suggestions, and 'zg' to add a word to your personal dictionary
autocmd FileType markdown,text setlocal spell spelllang=en_us
" Makes movement keys (j and k) move line-by-line down wrapped visual text, rather than jumping over the whole block to the next actual newline
autocmd FileType markdown,text nnoremap <buffer> j gj
autocmd FileType markdown,text nnoremap <buffer> k gk

"Change cursor shape based on current Vim mode
let &t_SI = "\e[5 q"                            " Insert mode: Thin vertical bar / beam
let &t_SR = "\e[4 q"                            " Replace mode: Underline
let &t_EI = "\e[2 q"                            " Normal mode: Solid block

" Soften the highlight colour
set cursorline                                  " Highlight the line the cursor is on
highlight CursorLine cterm=None ctermbg=236     " Subtle gray background line

" Automatically set relativenumber off in Insert mode, on in Normal mode
" autocmd InsertEnter * :set norelativenumber
" autocmd InsertLeave * :set relativenumber