""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""
filetype plugin indent on


set laststatus=2                " Show status line always
set number                      " Show line numbers
set encoding=utf-8              " Set default encoding to UTF-8
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces


" Golang config "
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_highlight_types = 1


" Always set working directory to current file's directory "
autocmd BufEnter * lcd %:p:h


" NERDTree Config "
let g:NERDTreeNodeDelimiter = "\u00a0"
nnoremap <C-N>f :NERDTreeFocus<CR>
nnoremap <C-N>t :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1
let g:NERDTreeChDirMode=2
