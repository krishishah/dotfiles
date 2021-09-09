"----------------------------------------------
" Plugin management
"
" Download vim-plug from the URL below and follow the installation
" instructions:
" https://github.com/junegunn/vim-plug
"----------------------------------------------
call plug#begin('~/.vim/plugged')

" General plugins
Plug 'bling/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'sprockmonty/vim-please'
Plug 'rafi/awesome-vim-colorschemes'

" Language support
" Plug 'fatih/vim-go', {  'tag': 'v1.24', 'do': ':GoUpdateBinaries' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()

""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""
filetype plugin indent on


set laststatus=2                " Show status line always
set number                      " Show line numbers
set encoding=utf-8              " Set default encoding to UTF-8
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set tabstop=4       " The width of a TAB is set to 8.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 8.

set shiftwidth=4    " Indentation amount for < and > commands.
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
set smarttab

" Golang local config. Found here: https://www.reddit.com/r/golang/comments/unc7a/match_go_fmt_to_settings_in_vim_with_4space_tabs/c4ww8p8/
autocmd BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4 

autocmd BufRead,BufNewFile *.md setlocal spell " Spellcheck .md files
set complete+=kspell " Switch on word completion using CTRL-N and CTRL-P in insert mode
set spelllang=en_gb

" neovim specific settings
if has('nvim')
    " Set the Python binaries neovim is using. Please note that you will need to
    " install the neovim package for these binaries separately like this for
    " example:
    " pip3.6 install -U neovim
    let g:python_host_prog = '/usr/bin/python2'
    let g:python3_host_prog = '/usr/bin/python3'
endif

" Allow vim to set a custom font or color for a word
syntax enable


"----------------------------------------------
" Golang
"----------------------------------------------
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" automatic import management
let g:go_fmt_command ='goimports'
" syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
" status bar
let g:go_auto_info = 0 
" matching identifiers
let g:go_auto_sameids = 0 

" let g:go_fmt_fail_silently = 1
" let g:go_fmt_autosave = 0

" debugging vim-go
" let g:go_debug=['lsp']

" show function all function and struct names in file
" nmap <leader>gd :GoDecls <CR>

" show function all function and struct names in file
" nmap <leader>gD :GoDeclsDir <CR>

"----------------------------------------------
" Coc.nvim Config 
"----------------------------------------------

" Smaller updatetime for CursorHold & CursorHoldI                                                                        
set updatetime=300                                                                                                       
" don't give |ins-completion-menu| messages.                                                                             
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Remap for rename current word - workspace wide renaming
" The default leader key is \ so in this case the command would be \r 
nmap <leader>r <Plug>(coc-rename)

nmap <silent> gd <Plug>(coc-definition)

nmap <silent> [c :call CocAction('diagnosticNext')<cr>
nmap <silent> ]c :call CocAction('diagnosticPrevious')<cr>

"----------------------------------------------
" Please Build Syntax Highlighting
"----------------------------------------------
au BufRead,BufNewFile BUILD,*.build_def set filetype=please
au BufRead,BufNewFile BUILD,*.build_def,*.build_defs set syntax=python

" -----------------------------
" NERDTree Config
" -----------------------------
let g:NERDTreeNodeDelimiter = "\u00a0"
nnoremap <C-N>f :NERDTreeFind<CR>
let g:NERDTreeShowHidden=1
let g:NERDTreeChDirMode=2


"----------------------------------------------
" Yank to OS clipboard 
"----------------------------------------------
" set clipboard=unnamedplus


"----------------------------------------------
" Disable annoying swap files 
"----------------------------------------------
set noswapfile

"----------------------------------------------
" Plugin: bling/vim-airline
"----------------------------------------------
" Show status bar by default.
set laststatus=2

" Enable top tabline.
let g:airline#extensions#tabline#enabled = 1

" Disable showing tabs in the tabline. This will ensure that the buffers are
" what is shown in the tabline at all times.
let g:airline#extensions#tabline#show_tabs = 0

" Enable powerline fonts.
let g:airline_powerline_fonts = 1 

" Explicitly define some symbols that did not work well for me in Linux.
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.maxlinenr = ''


"----------------------------------------------
" Colors
"----------------------------------------------
if exists('+termguicolors')                                                                                              
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"                                                                                 
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"                                                                                 
  set termguicolors                                                                                                      
endif                                                                                                                    
                                                                                                                         
let g:gruvbox_contrast_dark='hard'
set bg=dark 
colorscheme gruvbox                                                                                               
