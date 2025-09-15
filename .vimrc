" ========================================
" Options
" ========================================


set encoding=UTF-8
set fileencoding=utf-8 " File encoding
set spelllang=en_us

set number " Enable line numbers
set relativenumber " Use relative line numbers

set clipboard=unnamedplus

set mouse=a " Enable mouse mode

set undofile " Save undo history
set undodir=~/.cache/vim/undo
set nobackup " Don't create a backup file
set noswapfile " Don't use a swap file
set nowritebackup " Don't write backup before overwriting

set smartcase " Enable smart case
set ignorecase " Case-insensitive searching unless \C or capital in search

" set nohlsearch " Disable highlight on search
set incsearch " Matched search is highlighted

set showmatch " show the matching part of pairs [] {} and ()

set signcolumn=yes " Keep signcolumn on by default

set updatetime=250 " Decrease update time
set timeoutlen=300 " Time to wait for a mapped sequence to complete (in milliseconds)

set completeopt=menuone,noselect " Better completion experience

set backspace=indent,eol,start " Configurable backspace behavior

set whichwrap+=<,>,[,],h,l " Allow certain keys to move to the next line

set nowrap " Display long lines as one line
set linebreak " Don't break words when wrapping

set scrolloff=2 " Keep 8 lines above/below cursor
set sidescrolloff=8 " Keep 8 columns to the left/right of cursor
set numberwidth=4 " Number column width

set shiftwidth=4 " Spaces per indentation
set tabstop=4 " Spaces per tab
set softtabstop=4 " Spaces per tab during editing ops
set expandtab " Convert tabs to spaces
set breakindent " Enable break indent
set smartindent " Smart indentation
set autoindent " Auto-indent new lines

"set nocursorline " Don't highlight the current line
set cursorline " Don't highlight the current line

set splitbelow " Horizontal splits below current window
set splitright " Vertical splits to the right

set conceallevel=0 " Make `` visible in markdown

set shortmess+=c " Don't show completion menu messages

set iskeyword+=- " Treat hyphenated words as whole words

set cmdheight=1 " Command line height
set pumheight=10 " Popup menu height

set laststatus=2 " Show status bar
set showtabline=2 " Always show tab line

set statusline=%f " Path to the file
set statusline+=%= " Switch to the right side
set statusline+=%l " Current line
set statusline+=/ " Separator
set statusline+=%L " Total lines
"set statusline=%f\ %y\ %m\ %r\ %= \ %l\ \ %c

" ========================================
" Keymaps
" ========================================

" Set leader key
let mapleader = " "
let maplocalleader = " "

" Disable the spacebar key's default behavior in Normal and Visual modes
nnoremap <Space> <Nop>
vnoremap <Space> <Nop>

" Allow moving the cursor through wrapped lines with j, k
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'

" clear highlights
nnoremap <Esc> :noh<CR>

" delete single character without copying into register
" nnoremap x "_x

" Vertical scroll and center
" When going down or up, centers cursor in the middle of the screen
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Find and center
" When searching and do n or N, cursor stays in the middle
nnoremap n nzzzv
nnoremap N Nzzzv

" Resize with arrows
nnoremap <C-Up> :resize -2<CR>
nnoremap <C-Down> :resize +2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" Window management
nnoremap <leader>wv <C-w>v
nnoremap <leader>wh <C-w>s
nnoremap <leader>we <C-w>=
nnoremap <leader>wq :close<CR>

" save file without auto-formatting
nnoremap <leader>ww :noautocmd w<CR>

" Navigate between splits
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-l> :wincmd l<CR>

" Navigate buffers
nnoremap <leader>be :enew<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bb :buffers<CR>:buffer<Space>
nnoremap <leader>bd :bdelete<CR>

" toggle line wrapping
nnoremap <leader>l :set wrap!<CR>

" Press jk fast to exit insert mode
inoremap jk <ESC>
inoremap kj <ESC>

" Stay in indent mode
vnoremap < <gv
vnoremap > >gv

" Keep last yanked when pasting
" vnoremap p "_dP

" Open file explorer
noremap <silent> <leader>fe :Lex<CR>

" Open FZF
noremap <silent> <leader>ff :FZF<CR>


" ========================================
" Other
" ========================================

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Syntax highlighting
syntax on

" Colorscheme
colorscheme catppuccin_mocha

set termguicolors
set background=dark

" Use a line cursor within insert mode and a block cursor everywhere else.
" Set cursor to line in insert mode
" let &t_SI = "\e[5 q"

" Set cursor to block in normal mode
" let &t_EI = "\e[2 q"

" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25 
" Use 'l' instead of <CR> to open files
augroup netrw_setup | au!
    au FileType netrw nmap <buffer> l <CR>
augroup END

set textwidth=120

" When in visual mode, you can move lines of text up and down
" Enter visual mode, select what you need to select and press J or K to move
" the section up or down
vmap J :m '>+1<CR>gv=gv
vmap K :m '<-2<CR>gv=gv 

" indicate when a line is wrapped by prefixing wrapped line with '> '
set showbreak=>>>

set viminfofile=NONE

