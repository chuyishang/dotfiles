call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
let g:airline_powerline_fonts = 1
set rtp+=/usr/local/opt/fzf
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
call plug#end()
let g:airline_powerline_fonts = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable compatibility with vi which can cause unexpected issues
set nocompatible
" Sets number of commands saved in history
set history=500
" Load an indent file for detected file type
filetype indent on
" Enable plugins and load plugins for the detected file type
filetype plugin on
" Filetype on
filetype on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cursor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline
set cursorcolumn
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors, Fonts, and Visuals
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set number
colorscheme onedark
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set shift width to 4 spaces
set shiftwidth=4
" Set tab width to 4 columns
set tabstop=4
" Use space characters instead of tabs 
set expandtab
" Do not wrap lines. Allow lines to extend as far as they go
set nowrap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Navigation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't let cursor scroll below or above N number of lines
set scrolloff=10
" While searching through a file incrementally highlight matches
set incsearch
" Ignore capital letters during search
set ignorecase
" Override ignorecase option if searching for capital letters, allowing you to
" search for capital letters during search
set smartcase
" Show matching words during a search.
set showmatch
" Use highlighting when doing a search.
set hlsearch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Wildmenu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable auto completion menu after pressing TAB.
set wildmenu
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Remappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap jk <Esc>
nnoremap <space> :
" Yank from cursor to end of line
nnoremap Y y$
" Navigate split view easier using CTRL+j, CTRL+k, CTRL+h, CTRL+l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Resize split windows using arrow keys and pressing CTRL+UP, CTRL+DOWN,
" CTRL+LEFT, CTRL+RIGHT
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F3> :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']
