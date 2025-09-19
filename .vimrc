"------------------SETTINGS------------------

" Get correct colors in terminal, comment out in tty
set termguicolors

set showtabline=0 " Always show tab line

set cmdheight=1 " Command line height

set pumheight=10 " Popup menu height

" indicate when a line is wrapped by prefixing wrapped line with '> '
set showbreak=>>>

" Use a line cursor within insert mode and a block cursor everywhere else.
" Set cursor to line in insert mode
let &t_SI = "\e[5 q"

" Set cursor to block in normal mode
let &t_EI = "\e[2 q"

set clipboard=unnamedplus

" Configurable backspace behavior
set backspace=indent,eol,start

" Allow certain keys to move to the next line
set whichwrap+=<,>,[,],h,l

" Display long lines as one line
set nowrap

" Don't break words when wrapping
set linebreak

" Keep 8 lines above/below cursor
set scrolloff=2

" Keep 8 columns to the left/right of cursor
set sidescrolloff=8

" Keep signcolumn on by default
set signcolumn=yes

" Disable compatibility with vi which can cause unexpected issues.
	set nocompatible

" Disable the vim bell
	set visualbell

" Disable auto commenting in a new line
	autocmd Filetype * setlocal formatoptions-=c formatoptions-=r  formatoptions-=o

" Setting the character encoding of Vim to UTF-8
	set encoding=UTF-8

" Enable type file detection. Vim will be able to try to detect the type of file is use.
	filetype on

" Smart tab
	set smarttab

" Search down to subfolders
	set path+=**

" Enable plugins and load plugin for the detected file type.
	filetype plugin on

" Load an indent file for the detected file type.
	filetype indent on

" Turn syntax highlighting on.
	syntax on

" Add numbers to the file.
	set number relativenumber

" Mouse functionality
	set mouse=a

" Set shift width to 4 spaces.Set tab width to 4 columns.
	set shiftwidth=4
	set tabstop=4
  set numberwidth=4 " Number column width
  set softtabstop=4 " Spaces per tab during editing ops
  set expandtab " Convert tabs to spaces
  set smartindent " Smart indentation
  set autoindent " Auto-indent new lines

  set conceallevel=0 " Make `` visible in markdown

" If the current file type is HTML, set indentation to 2 spaces.
	autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" Do not save backup files.
	set nobackup
	set viminfo='10,<100,:100,%,n~/.cache/vim/.viminfo
	let g:netrw_home='~/.cache/vim/netrwhist'
	set noswapfile
	set nowritebackup

" While searching though a file incrementally highlight matching characters as you type.
	set incsearch
	set hlsearch

" Ignore capital letters during search.
	set ignorecase

" Show partial command you type in the last line of the screen.
	set showcmd

" Show the mode you are on the last line.
	set showmode

" Show matching words during a search.
	set showmatch

" Set the commands to save in history default number is 20.
	set history=1000

" Setting the split window to open as i like (like in a WM - qtile)
	set splitbelow splitright

" Enable auto completion menu after pressing TAB.
	set wildmenu

" There are certain files that we would never want to edit with Vim.
" Wild menu will ignore files with these extensions.
	set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" If Vim version is equal to or greater than 7.3 enable undo file.
" This allows you to undo changes to a file even after saving it.
	if version >= 703
    	set undodir=~/.cache/vim/undo
    	set undofile
    	set undoreload=10000
	endif

" File Browsing settings
	let g:netrw_banner=0
	let g:netrw_liststyle=3
	let g:netrw_winsize=20
    let g:netrw_showhide=1

" Auto Completion - Enable Omni complete features
	set omnifunc=syntaxcomplete#Complete
	
" Enable Spelling Suggestions for Auto-Completion:
	set complete+=k
	set completeopt=menu,menuone,noinsert

" Minimalist-Tab Complete
	inoremap <expr> <Tab> TabComplete()
	fun! TabComplete()
	    if getline('.')[col('.') - 2] =~ '\K' || pumvisible()
	        return "\<C-N>"
	    else
	        return "\<Tab>"
	    endif
	endfun

" Minimalist-Autocomplete 
	inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
	autocmd InsertCharPre * call AutoComplete()
	fun! AutoComplete()
	    if v:char =~ '\K'
	        \ && getline('.')[col('.') - 4] !~ '\K'
	        \ && getline('.')[col('.') - 3] =~ '\K'
	        \ && getline('.')[col('.') - 2] =~ '\K'
	        \ && getline('.')[col('.') - 1] !~ '\K'
	
	        call feedkeys("\<C-N>", 'n')
	    end
	endfun

" Closing compaction in insert mode
	inoremap [ []<left>
	inoremap ( ()<left>
	inoremap { {}<left>
	inoremap /* /**/<left><left>

" set timeoutlen=1000
" set ttimeoutlen=10
augroup FastEscape
  autocmd!
  au InsertEnter * set timeoutlen=10
  au InsertLeave * set timeoutlen=1000
augroup END


" Use 'l' instead of <CR> to open files
" augroup netrw_setup | au!
"     au FileType netrw nmap <buffer> l <CR>
" augroup END

" Decrease update time
" set updatetime=10
" Time to wait for a mapped sequence to complete (in milliseconds)
" set timeoutlen=400
" Enable spell check
	" set spell
" Color scheme
	" colorscheme slate 
" Highlight cursor line underneath the cursor horizontally.
	" set cursorline
" Highlight cursor line underneath the cursor vertically.
	" set cursorcolumn

"------------------GVIM - GUI VERSION------------------

	if has('gui_running')
		" Font
			if has("macvim")
    			set guifont=Menlo\ Regular:h14
			elseif has("win32")
				set guifont="Consolas 14"
			else
				set guifont=JetBrainsMonoNerdFont\ 14
			endif

		" Hide the toolbar.
			set guioptions-=T

    	" Hide the right-side scroll bar.
    		set guioptions-=r

    	" Set the color scheme.
    		" color slate
		" Start Lex Tree
			" autocmd VimEnter * :Lexplore
	endif

"------------------STATUS_LINE------------------

" Status line
	set laststatus=2
	set statusline=
	set statusline+=%2*
	set statusline+=%{StatuslineMode()}
	set statusline+=\ 
	set statusline+=%{SpellCheckStatus()}
	set statusline+=%1*
	set statusline+=\ 
	set statusline+=%3*
	set statusline+=<
	set statusline+=-
	set statusline+=\ 
	set statusline+=%f
	set statusline+=\ 
	set statusline+=-
	set statusline+=>
	set statusline+=\ 
	set statusline+=%4*
	set statusline+=%m
	set statusline+=%=
	set statusline+=%h
	set statusline+=%r
	set statusline+=%4*
	set statusline+=%c
	set statusline+=/
	set statusline+=%l
	set statusline+=/
	set statusline+=%L
	set statusline+=\ 
	set statusline+=%1*
	set statusline+=|
	set statusline+=%y
	set statusline+=\ 
	set statusline+=%4*
	set statusline+=%P
	set statusline+=\ 
	set statusline+=%3*
	set statusline+=t:
	set statusline+=%n
	set statusline+=\ 

" Mode
	function! StatuslineMode()
	  let l:mode=mode()
	  if l:mode==#"n"
	    return "N"
	  elseif l:mode==#"V"
	    return "V-LINE"
	  elseif l:mode==?"v"
	    return "V"
	  elseif l:mode==#"i"
	    return "I"
	  elseif l:mode ==# "\<C-V>"
		return "V-BLOCK"
	  elseif l:mode==#"R"
	    return "R"
	  elseif l:mode==?"s"
	    return "S"
	  elseif l:mode==#"t"
	    return "T"
	  elseif l:mode==#"c"
	    return "C"
	  elseif l:mode==#"!"
	    return "SHELL"
	  else
		  return "VIM"
	  endif
	endfunction
	
" Spell Check Status
	function! SpellCheckStatus()
		if &spell 
			return "[SPELL]"
		else
			return ''
		endif	
	endfunction

"------------------KEY_BINDINGS------------------

" Set the space  as the leader key.
  let mapleader = " "
  let maplocalleader = " "

" Disable the spacebar key's default behavior in Normal and Visual modes
  nnoremap <Space> <Nop>
  vnoremap <Space> <Nop>

  nnoremap <C-c> :noh<CR>

" Spell-check on\off
	map <leader>s :setlocal spell! spelllang=en_us<CR>

" Word-wrap on\off
	map <leader>p :setlocal wrap!<CR>

" Type jj or kk to exit insert mode quickly.
	inoremap jk <Esc>
	inoremap kj <Esc>

" Opening a file explore 
	map <leader>e :Lex<CR>

" Opening a file from explorer
	map <leader>o :Explore<CR>

" Opening a terminal window
	map <c-t> :ter<CR>

" Closing the terminal window
	tnoremap <c-t> exit<CR>

" CTRL+I OR Esc to make the terminal scrollable and I to input mode
	tnoremap <c-i> <c-w><s-n> 
	tnoremap <Esc> <C-\><C-n>

" You can split the window in Vim. y - in the y access , x - in the x access
	map <leader>' :split<space>
	map <leader>\ :vsplit<space>

" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
	nnoremap <c-j> <c-w>j
	nnoremap <c-k> <c-w>k
	nnoremap <c-h> <c-w>h
	nnoremap <c-l> <c-w>l

" Window management
    nnoremap <leader>wv <C-w>v
    nnoremap <leader>wh <C-w>s
    nnoremap <leader>we <C-w>=
    nnoremap <leader>wc :close<CR>

" Resize split windows using arrow keys by pressing:
" ALT+UP, ALT+DOWN, ALT+LEFT, or ALT+RIGHT.
	noremap <a-up> <c-w>+
	noremap <a-down> <c-w>-
	noremap <a-left> <c-w><
	noremap <a-right> <c-w>>

" Navigate buffers
  nnoremap <leader>bn :bnext<CR>
  nnoremap <leader>bp :bprevious<CR>
  nnoremap <leader>bb :buffers<CR>:buffer<Space>
  nnoremap <leader>bd :bdelete<CR>

" Allow moving the cursor through wrapped lines with j, k
  nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
  nnoremap <expr> k v:count == 0 ? 'gk' : 'k'

" Moving lines in visual mode
  vnoremap J :m '>+1<CR>gv=gv
  vnoremap K :m '<-2<CR>gv=gv

" Stay in indent mode
  vnoremap < <gv
  vnoremap > >gv

" Vertical scroll and center
" When going down or up, centers cursor in the middle of the screen
  nnoremap <C-d> <C-d>zz
  nnoremap <C-u> <C-u>zz

" Find and center
" When searching and do n or N, cursor stays in the middle
  nnoremap n nzzzv
  nnoremap N Nzzzv

  " Moving between tabs
  map <leader>t gt

  " Opening\Creating a file in a new tab - write the tab to open
  nnoremap <leader>c :tabedit<space>

  " Saving a file using CTRL+s
  map <C-s> :w<CR>

" Quitting and saving a file using CTRL+q
  map <C-q> :wq<CR>

" Surround word with a wanted character
  nnoremap <leader>sw <cmd>echo "Press a character: " \| let c = nr2char(getchar()) \| exec "normal viwo\ei" . c . "\eea" . c . "\e" \| redraw<CR>

" Replace all occurrences of a word
  nnoremap <leader>rw :%s/\<<c-r><c-w>\>//g<left><left>

" Seeing the registers
  nnoremap <leader>r <cmd>registers<CR>

" Select all the text
  nnoremap <leader>a ggVG

"------------------COLOR-SCHEMES------------------

" ========================================
" Color Scheme - Catppuccin Mocha
" ========================================

set background=dark

hi clear

if exists('syntax on')
    syntax reset
endif

set t_Co=256

let s:rosewater = "#F5E0DC"
let s:flamingo = "#F2CDCD"
let s:pink = "#F5C2E7"
let s:mauve = "#CBA6F7"
let s:red = "#F38BA8"
let s:maroon = "#EBA0AC"
let s:peach = "#FAB387"
let s:yellow = "#F9E2AF"
let s:green = "#A6E3A1"
let s:teal = "#94E2D5"
let s:sky = "#89DCEB"
let s:sapphire = "#74C7EC"
let s:blue = "#89B4FA"
let s:lavender = "#B4BEFE"

let s:text = "#CDD6F4"
let s:subtext1 = "#BAC2DE"
let s:subtext0 = "#A6ADC8"
let s:overlay2 = "#9399B2"
let s:overlay1 = "#7F849C"
let s:overlay0 = "#6C7086"
let s:surface2 = "#585B70"
let s:surface1 = "#45475A"
let s:surface0 = "#313244"

let s:base = "#1E1E2E"
let s:mantle = "#181825"
let s:crust = "#11111B"

function! s:hi(group, guisp, guifg, guibg, gui, cterm)
  let cmd = ""
  if a:guisp != ""
    let cmd = cmd . " guisp=" . a:guisp
  endif
  if a:guifg != ""
    let cmd = cmd . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    let cmd = cmd . " guibg=" . a:guibg
  endif
  if a:gui != ""
    let cmd = cmd . " gui=" . a:gui
  endif
  if a:cterm != ""
    let cmd = cmd . " cterm=" . a:cterm
  endif
  if cmd != ""
    exec "hi " . a:group . cmd
  endif
endfunction

call s:hi("Normal", "NONE", s:text, s:base, "NONE", "NONE")
call s:hi("Visual", "NONE", "NONE", s:surface1,"bold", "bold")
call s:hi("Conceal", "NONE", s:overlay1, "NONE", "NONE", "NONE")
call s:hi("ColorColumn", "NONE", "NONE", s:surface0, "NONE", "NONE")
call s:hi("Cursor", "NONE", s:base, s:text, "NONE", "NONE")
call s:hi("lCursor", "NONE", s:base, s:text, "NONE", "NONE")
call s:hi("CursorIM", "NONE", s:base, s:text, "NONE", "NONE")
call s:hi("CursorColumn", "NONE", "NONE", s:mantle, "NONE", "NONE")
call s:hi("CursorLine", "NONE", "NONE", s:surface0, "NONE", "NONE")
call s:hi("Directory", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("DiffAdd", "NONE", s:base, s:green, "NONE", "NONE")
call s:hi("DiffChange", "NONE", s:base, s:yellow, "NONE", "NONE")
call s:hi("DiffDelete", "NONE", s:base, s:red, "NONE", "NONE")
call s:hi("DiffText", "NONE", s:base, s:blue, "NONE", "NONE")
call s:hi("EndOfBuffer", "NONE", "NONE", "NONE", "NONE", "NONE")
call s:hi("ErrorMsg", "NONE", s:red, "NONE", "bolditalic"    , "bold,italic")
call s:hi("VertSplit", "NONE", s:crust, "NONE", "NONE", "NONE")
call s:hi("Folded", "NONE", s:blue, s:surface1, "NONE", "NONE")
call s:hi("FoldColumn", "NONE", s:overlay0, s:base, "NONE", "NONE")
call s:hi("SignColumn", "NONE", s:surface1, s:base, "NONE", "NONE")
call s:hi("IncSearch", "NONE", s:surface1, s:pink, "NONE", "NONE")
call s:hi("CursorLineNR", "NONE", s:lavender, "NONE", "NONE", "NONE")
call s:hi("LineNr", "NONE", s:surface1, "NONE", "NONE", "NONE")
call s:hi("MatchParen", "NONE", s:peach, "NONE", "bold", "bold")
call s:hi("ModeMsg", "NONE", s:text, "NONE", "bold", "bold")
call s:hi("MoreMsg", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("NonText", "NONE", s:overlay0, "NONE", "NONE", "NONE")
call s:hi("Pmenu", "NONE", s:overlay2, s:surface0, "NONE", "NONE")
call s:hi("PmenuSel", "NONE", s:text, s:surface1, "bold", "bold")
call s:hi("PmenuSbar", "NONE", "NONE", s:surface1, "NONE", "NONE")
call s:hi("PmenuThumb", "NONE", "NONE", s:overlay0, "NONE", "NONE")
call s:hi("Question", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("QuickFixLine", "NONE", "NONE", s:surface1, "bold", "bold")
call s:hi("Search", "NONE", s:pink, s:surface1, "bold", "bold")
call s:hi("SpecialKey", "NONE", s:subtext0, "NONE", "NONE", "NONE")
call s:hi("SpellBad", "NONE", s:base, s:red, "NONE", "NONE")
call s:hi("SpellCap", "NONE", s:base, s:yellow, "NONE", "NONE")
call s:hi("SpellLocal", "NONE", s:base, s:blue, "NONE", "NONE")
call s:hi("SpellRare", "NONE", s:base, s:green, "NONE", "NONE")
call s:hi("StatusLine", "NONE", s:text, s:mantle, "NONE", "NONE")
call s:hi("StatusLineNC", "NONE", s:surface1, s:mantle, "NONE", "NONE")
call s:hi("StatusLineTerm", "NONE", s:text, s:mantle, "NONE", "NONE")
call s:hi("StatusLineTermNC", "NONE", s:surface1, s:mantle, "NONE", "NONE")
call s:hi("TabLine", "NONE", s:surface1, s:mantle, "NONE", "NONE")
call s:hi("TabLineFill", "NONE", "NONE", s:mantle, "NONE", "NONE")
call s:hi("TabLineSel", "NONE", s:green, s:surface1, "NONE", "NONE")
call s:hi("Title", "NONE", s:blue, "NONE", "bold", "bold")
call s:hi("VisualNOS", "NONE", "NONE", s:surface1, "bold", "bold")
call s:hi("WarningMsg", "NONE", s:yellow, "NONE", "NONE", "NONE")
call s:hi("WildMenu", "NONE", "NONE", s:overlay0, "NONE", "NONE")
call s:hi("Comment", "NONE", s:overlay0, "NONE", "NONE", "NONE")
call s:hi("Constant", "NONE", s:peach, "NONE", "NONE", "NONE")
call s:hi("Identifier", "NONE", s:flamingo, "NONE", "NONE", "NONE")
call s:hi("Statement", "NONE", s:mauve, "NONE", "NONE", "NONE")
call s:hi("PreProc", "NONE", s:pink, "NONE", "NONE", "NONE")
call s:hi("Type", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("Special", "NONE", s:pink, "NONE", "NONE", "NONE")
call s:hi("Underlined", "NONE", s:text, s:base, "underline", "underline")
call s:hi("Error", "NONE", s:red, "NONE", "NONE", "NONE")
call s:hi("Todo", "NONE", s:base, s:flamingo, "bold", "bold")

call s:hi("String", "NONE", s:green, "NONE", "NONE", "NONE")
call s:hi("Character", "NONE", s:teal, "NONE", "NONE", "NONE")
call s:hi("Number", "NONE", s:peach, "NONE", "NONE", "NONE")
call s:hi("Boolean", "NONE", s:peach, "NONE", "NONE", "NONE")
call s:hi("Float", "NONE", s:peach, "NONE", "NONE", "NONE")
call s:hi("Function", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("Conditional", "NONE", s:red, "NONE", "NONE", "NONE")
call s:hi("Repeat", "NONE", s:red, "NONE", "NONE", "NONE")
call s:hi("Label", "NONE", s:peach, "NONE", "NONE", "NONE")
call s:hi("Operator", "NONE", s:sky, "NONE", "NONE", "NONE")
call s:hi("Keyword", "NONE", s:pink, "NONE", "NONE", "NONE")
call s:hi("Include", "NONE", s:pink, "NONE", "NONE", "NONE")
call s:hi("StorageClass", "NONE", s:yellow, "NONE", "NONE", "NONE")
call s:hi("Structure", "NONE", s:yellow, "NONE", "NONE", "NONE")
call s:hi("Typedef", "NONE", s:yellow, "NONE", "NONE", "NONE")
call s:hi("debugPC", "NONE", "NONE", s:crust, "NONE", "NONE")
call s:hi("debugBreakpoint", "NONE", s:overlay0, s:base, "NONE", "NONE")

hi link Define PreProc
hi link Macro PreProc
hi link PreCondit PreProc
hi link SpecialChar Special
hi link Tag Special
hi link Delimiter Special
hi link SpecialComment Special
hi link Debug Special
hi link Exception Error
hi link StatusLineTerm StatusLine
hi link StatusLineTermNC StatusLineNC
hi link Terminal Normal
hi link Ignore Comment

" Set terminal colors for playing well with plugins like fzf
let g:terminal_ansi_colors = [
  \ s:surface1, s:red, s:green, s:yellow, s:blue, s:pink, s:teal, s:subtext1,
  \ s:surface2, s:red, s:green, s:yellow, s:blue, s:pink, s:teal, s:subtext0
\ ]

"-----------------------------------------------------------------------------
"-----------------------------------------------------------------------------
"-----------------------------------------------------------------------------

" Name:         Rosé Pine
" Description:  All natural pine, faux fur and a bit of soho vibes for the classy minimalist
" Author:       Prateek Tade <prateek.tade@gmail.com>
" Maintainer:   Prateek Tade <prateek.tade@gmail.com>
" Website:      https://github.com/rose-pine/vim
" License:      Vim License (see `:help license`)
" Last Updated: Sun Jan 15 20:43:06 2023

" Generated by Colortemplate v2.2.0

" set background=dark
" 
" hi clear
" let g:colors_name = 'rosepine'
" 
" let s:t_Co = exists('&t_Co') && !has('gui_running') ? (&t_Co ?? 0) : -1
" let s:italics = (&t_ZH != '' && &t_ZH != '[7m') || has('gui_running')
" 
" hi! link CurSearch IncSearch
" hi! link diffAdded DiffAdd
" hi! link diffChanged DiffChange
" hi! link diffRemoved DiffDelete
" hi! link StatusLineTerm StatusLine
" hi! link StatusLineTermNC StatusLineNC
" hi! link WildMenu IncSearch
" hi! link markdownH1Delimiter markdownH1
" hi! link markdownH2Delimiter markdownH2
" hi! link markdownH3Delimiter markdownH3
" hi! link markdownH4Delimiter markdownH4
" hi! link markdownH5Delimiter markdownH5
" hi! link markdownH6Delimiter markdownH6
" hi! link markdownURL markdownLinkText
" hi! link mkdLink mkdInlineURL
" hi! link mkdLinkDef mkdInlineURL
" hi! link mkdURL mkdInlineURL
" 
" if (has('termguicolors') && &termguicolors) || has('gui_running')
"   let g:terminal_ansi_colors = ['#26233a', '#eb6f92', '#31748f', '#f6c177', '#9ccfd8', '#c4a7e7', '#ebbcba', '#e0def4', '#908caa', '#eb6f92', '#31748f', '#f6c177', '#9ccfd8', '#c4a7e7', '#ebbcba', '#e0def4']
" endif
" if get(g:,'disable_bg',0)
"   hi Normal guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
"   hi NormalNC guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
"   hi SignColumn guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
"   hi StatusLineNC guifg=#6e6a86 guibg=NONE gui=NONE cterm=NONE
" else
"   hi Normal guifg=#e0def4 guibg=#191724 gui=NONE cterm=NONE
"   hi NormalNC guifg=#e0def4 guibg=#191724 gui=NONE cterm=NONE
"   hi SignColumn guifg=#e0def4 guibg=#191724 gui=NONE cterm=NONE
"   hi StatusLineNC guifg=#6e6a86 guibg=#191724 gui=NONE cterm=NONE
" endif
" if get(g:,'disable_float_bg',0)
"   hi DarkenedPanel guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
"   hi DarkenedStatusline guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
"   hi Folded guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
"   hi NormalFloat guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
"   hi Pmenu guifg=#908caa guibg=NONE gui=NONE cterm=NONE
"   hi StatusLine guifg=#908caa guibg=NONE gui=NONE cterm=NONE
"   hi TabLine guifg=#908caa guibg=NONE gui=NONE cterm=NONE
"   hi TabLineFill guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
" else
"   hi DarkenedPanel guifg=NONE guibg=#1f1d2e gui=NONE cterm=NONE
"   hi DarkenedStatusline guifg=NONE guibg=#1f1d2e gui=NONE cterm=NONE
"   hi Folded guifg=#e0def4 guibg=#1f1d2e gui=NONE cterm=NONE
"   hi NormalFloat guifg=#e0def4 guibg=#1f1d2e gui=NONE cterm=NONE
"   hi Pmenu guifg=#908caa guibg=#1f1d2e gui=NONE cterm=NONE
"   hi StatusLine guifg=#908caa guibg=#1f1d2e gui=NONE cterm=NONE
"   hi TabLine guifg=#908caa guibg=#1f1d2e gui=NONE cterm=NONE
"   hi TabLineFill guifg=NONE guibg=#1f1d2e gui=NONE cterm=NONE
" endif
" if !s:italics 
"   hi Comment guifg=#6e6a86 guibg=NONE gui=NONE cterm=NONE
" else
"   hi Comment guifg=#6e6a86 guibg=NONE gui=italic cterm=italic
"   if !s:italics
"     hi Comment gui=NONE cterm=NONE
"   endif
" endif
" hi ColorColumn guifg=NONE guibg=#26233a gui=NONE cterm=NONE
" hi Conceal guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
" hi CursorColumn guifg=NONE guibg=#21202e gui=NONE cterm=NONE
" hi CursorLine guifg=NONE guibg=#21202e gui=NONE cterm=NONE
" hi CursorLineNr guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
" hi DiffAdd guifg=NONE guibg=#333c48 gui=NONE cterm=NONE
" hi DiffChange guifg=NONE guibg=#26233a gui=NONE cterm=NONE
" hi DiffDelete guifg=NONE guibg=#43293a gui=NONE cterm=NONE
" hi DiffText guifg=NONE guibg=#433842 gui=NONE cterm=NONE
" hi Directory guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
" hi ErrorMsg guifg=#eb6f92 guibg=NONE gui=bold cterm=bold
" hi FloatBorder guifg=#403d52 guibg=NONE gui=NONE cterm=NONE
" hi FloatTitle guifg=#6e6a86 guibg=NONE gui=NONE cterm=NONE
" hi FoldColumn guifg=#6e6a86 guibg=NONE gui=NONE cterm=NONE
" hi IncSearch guifg=#191724 guibg=#ebbcba gui=NONE cterm=NONE
" hi LineNr guifg=#6e6a86 guibg=NONE gui=NONE cterm=NONE
" hi MatchParen guifg=#e0def4 guibg=#403d52 gui=NONE cterm=NONE
" hi ModeMsg guifg=#908caa guibg=NONE gui=NONE cterm=NONE
" hi MoreMsg guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
" hi NonText guifg=#6e6a86 guibg=NONE gui=NONE cterm=NONE
" hi PmenuSbar guifg=NONE guibg=#21202e gui=NONE cterm=NONE
" hi PmenuSel guifg=#e0def4 guibg=#26233a gui=NONE cterm=NONE
" hi PmenuThumb guifg=NONE guibg=#403d52 gui=NONE cterm=NONE
" hi PmenuMatch guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
" hi Question guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
" hi Search guifg=NONE guibg=#403d52 gui=NONE cterm=NONE
" hi SpecialKey guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
" hi SpellBad guifg=NONE guibg=NONE guisp=#908caa gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
" hi SpellCap guifg=NONE guibg=NONE guisp=#908caa gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
" hi SpellLocal guifg=NONE guibg=NONE guisp=#908caa gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
" hi SpellRare guifg=NONE guibg=NONE guisp=#908caa gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
" hi TabLineSel guifg=#e0def4 guibg=#26233a gui=NONE cterm=NONE
" hi Title guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
" hi VertSplit guifg=#403d52 guibg=NONE gui=NONE cterm=NONE
" hi Visual guifg=NONE guibg=#403d52 gui=NONE cterm=NONE
" hi WarningMsg guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
" hi Boolean guifg=#ebbcba guibg=NONE gui=NONE cterm=NONE
" hi Character guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
" hi Conditional guifg=#31748f guibg=NONE gui=NONE cterm=NONE
" hi Constant guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
" hi Debug guifg=#ebbcba guibg=NONE gui=NONE cterm=NONE
" hi Define guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
" hi Delimiter guifg=#908caa guibg=NONE gui=NONE cterm=NONE
" hi Error guifg=#eb6f92 guibg=NONE gui=NONE cterm=NONE
" hi Exception guifg=#31748f guibg=NONE gui=NONE cterm=NONE
" hi Float guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
" hi Function guifg=#ebbcba guibg=NONE gui=NONE cterm=NONE
" hi Identifier guifg=#ebbcba guibg=NONE gui=NONE cterm=NONE
" hi Include guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
" hi Keyword guifg=#31748f guibg=NONE gui=NONE cterm=NONE
" hi Label guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
" hi Macro guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
" hi Number guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
" hi Operator guifg=#908caa guibg=NONE gui=NONE cterm=NONE
" hi PreCondit guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
" hi PreProc guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
" hi Repeat guifg=#31748f guibg=NONE gui=NONE cterm=NONE
" hi Special guifg=#ebbcba guibg=NONE gui=NONE cterm=NONE
" hi SpecialChar guifg=#ebbcba guibg=NONE gui=NONE cterm=NONE
" hi SpecialComment guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
" hi Statement guifg=#31748f guibg=NONE gui=NONE cterm=NONE
" hi StorageClass guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
" hi String guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
" hi Structure guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
" hi Tag guifg=#ebbcba guibg=NONE gui=NONE cterm=NONE
" hi Todo guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
" hi Type guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
" hi Typedef guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
" hi Underlined guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
" hi htmlArg guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
" hi htmlBold guifg=NONE guibg=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
" hi htmlEndTag guifg=#908caa guibg=NONE gui=NONE cterm=NONE
" hi htmlH1 guifg=#c4a7e7 guibg=NONE gui=bold cterm=bold
" hi htmlH2 guifg=#9ccfd8 guibg=NONE gui=bold cterm=bold
" hi htmlH3 guifg=#ebbcba guibg=NONE gui=bold cterm=bold
" hi htmlH4 guifg=#f6c177 guibg=NONE gui=bold cterm=bold
" hi htmlH5 guifg=#31748f guibg=NONE gui=bold cterm=bold
" if !s:italics 
"   hi htmlItalic guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
" else
"   hi htmlItalic guifg=NONE guibg=NONE gui=italic ctermfg=NONE ctermbg=NONE cterm=italic
"   if !s:italics
"     hi htmlItalic gui=NONE cterm=NONE
"   endif
" endif
" hi htmlLink guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
" hi htmlTag guifg=#908caa guibg=NONE gui=NONE cterm=NONE
" hi htmlTagN guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
" hi htmlTagName guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
" hi markdownDelimiter guifg=#908caa guibg=NONE gui=NONE cterm=NONE
" hi markdownH1 guifg=#c4a7e7 guibg=NONE gui=bold cterm=bold
" hi markdownH2 guifg=#9ccfd8 guibg=NONE gui=bold cterm=bold
" hi markdownH3 guifg=#ebbcba guibg=NONE gui=bold cterm=bold
" hi markdownH4 guifg=#f6c177 guibg=NONE gui=bold cterm=bold
" hi markdownH5 guifg=#31748f guibg=NONE gui=bold cterm=bold
" hi markdownH6 guifg=#9ccfd8 guibg=NONE gui=bold cterm=bold
" hi markdownLinkText guifg=#c4a7e7 guibg=NONE gui=underline cterm=underline
" if !s:italics 
"   hi mkdCode guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
" else
"   hi mkdCode guifg=#9ccfd8 guibg=NONE gui=italic cterm=italic
"   if !s:italics
"     hi mkdCode gui=NONE cterm=NONE
"   endif
" endif
" hi mkdCodeDelimiter guifg=#ebbcba guibg=NONE gui=NONE cterm=NONE
" hi mkdCodeEnd guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
" hi mkdCodeStart guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
" hi mkdFootnotes guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
" hi mkdID guifg=#9ccfd8 guibg=NONE gui=underline cterm=underline
" hi mkdInlineURL guifg=#c4a7e7 guibg=NONE gui=underline cterm=underline
" hi mkdListItemLine guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
" hi mkdRule guifg=#908caa guibg=NONE gui=NONE cterm=NONE
" hi VimwikiHR guifg=#908caa guibg=NONE gui=NONE cterm=NONE
" hi VimwikiHeader1 guifg=#c4a7e7 guibg=NONE gui=bold cterm=bold
" hi VimwikiHeader2 guifg=#9ccfd8 guibg=NONE gui=bold cterm=bold
" hi VimwikiHeader3 guifg=#ebbcba guibg=NONE gui=bold cterm=bold
" hi VimwikiHeader4 guifg=#f6c177 guibg=NONE gui=bold cterm=bold
" hi VimwikiHeader5 guifg=#31748f guibg=NONE gui=bold cterm=bold
" hi VimwikiHeader6 guifg=#9ccfd8 guibg=NONE gui=bold cterm=bold
" hi VimwikiHeaderChar guifg=#31748f guibg=NONE gui=NONE cterm=NONE
" hi VimwikiLink guifg=#c4a7e7 guibg=NONE gui=underline cterm=underline
" hi VimwikiList guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
" hi VimwikiNoExistsLink guifg=#eb6f92 guibg=NONE gui=NONE cterm=NONE
" 
" if s:t_Co >= 256
"   if get(g:,'disable_bg',0)
"     hi Normal ctermfg=189 ctermbg=NONE cterm=NONE
"     hi NormalNC ctermfg=189 ctermbg=NONE cterm=NONE
"     hi SignColumn ctermfg=189 ctermbg=NONE cterm=NONE
"     hi StatusLineNC ctermfg=60 ctermbg=NONE cterm=NONE
"   else
"     hi Normal ctermfg=189 ctermbg=234 cterm=NONE
"     hi NormalNC ctermfg=189 ctermbg=234 cterm=NONE
"     hi SignColumn ctermfg=189 ctermbg=234 cterm=NONE
"     hi StatusLineNC ctermfg=60 ctermbg=234 cterm=NONE
"   endif
"   if get(g:,'disable_float_bg',0)
"     hi DarkenedPanel ctermfg=NONE ctermbg=NONE cterm=NONE
"     hi DarkenedStatusline ctermfg=NONE ctermbg=NONE cterm=NONE
"     hi Folded ctermfg=189 ctermbg=NONE cterm=NONE
"     hi NormalFloat ctermfg=189 ctermbg=NONE cterm=NONE
"     hi Pmenu ctermfg=103 ctermbg=NONE cterm=NONE
"     hi StatusLine ctermfg=103 ctermbg=NONE cterm=NONE
"     hi TabLine ctermfg=103 ctermbg=NONE cterm=NONE
"     hi TabLineFill ctermfg=NONE ctermbg=NONE cterm=NONE
"   else
"     hi DarkenedPanel ctermfg=NONE ctermbg=234 cterm=NONE
"     hi DarkenedStatusline ctermfg=NONE ctermbg=234 cterm=NONE
"     hi Folded ctermfg=189 ctermbg=234 cterm=NONE
"     hi NormalFloat ctermfg=189 ctermbg=234 cterm=NONE
"     hi Pmenu ctermfg=103 ctermbg=234 cterm=NONE
"     hi StatusLine ctermfg=103 ctermbg=234 cterm=NONE
"     hi TabLine ctermfg=103 ctermbg=234 cterm=NONE
"     hi TabLineFill ctermfg=NONE ctermbg=234 cterm=NONE
"   endif
"   if !s:italics 
"     hi Comment ctermfg=60 ctermbg=NONE cterm=NONE
"   else
"     hi Comment ctermfg=60 ctermbg=NONE cterm=italic
"     if !s:italics
"       hi Comment cterm=NONE
"     endif
"   endif
"   hi ColorColumn ctermfg=NONE ctermbg=235 cterm=NONE
"   hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
"   hi CursorColumn ctermfg=NONE ctermbg=235 cterm=NONE
"   hi CursorLine ctermfg=NONE ctermbg=235 cterm=NONE
"   hi CursorLineNr ctermfg=189 ctermbg=NONE cterm=NONE
"   hi DiffAdd ctermfg=NONE ctermbg=237 cterm=NONE
"   hi DiffChange ctermfg=NONE ctermbg=235 cterm=NONE
"   hi DiffDelete ctermfg=NONE ctermbg=236 cterm=NONE
"   hi DiffText ctermfg=NONE ctermbg=237 cterm=NONE
"   hi Directory ctermfg=152 ctermbg=NONE cterm=NONE
"   hi ErrorMsg ctermfg=204 ctermbg=NONE cterm=bold
"   hi FloatBorder ctermfg=238 ctermbg=NONE cterm=NONE
"   hi FloatTitle ctermfg=60 ctermbg=NONE cterm=NONE
"   hi FoldColumn ctermfg=60 ctermbg=NONE cterm=NONE
"   hi IncSearch ctermfg=234 ctermbg=181 cterm=NONE
"   hi LineNr ctermfg=60 ctermbg=NONE cterm=NONE
"   hi MatchParen ctermfg=189 ctermbg=238 cterm=NONE
"   hi ModeMsg ctermfg=103 ctermbg=NONE cterm=NONE
"   hi MoreMsg ctermfg=183 ctermbg=NONE cterm=NONE
"   hi NonText ctermfg=60 ctermbg=NONE cterm=NONE
"   hi PmenuSbar ctermfg=NONE ctermbg=235 cterm=NONE
"   hi PmenuSel ctermfg=189 ctermbg=235 cterm=NONE
"   hi PmenuThumb ctermfg=NONE ctermbg=238 cterm=NONE
"   hi Question ctermfg=222 ctermbg=NONE cterm=NONE
"   hi Search ctermfg=NONE ctermbg=238 cterm=NONE
"   hi SpecialKey ctermfg=152 ctermbg=NONE cterm=NONE
"   hi SpellBad ctermfg=NONE ctermbg=NONE cterm=undercurl
"   hi SpellCap ctermfg=NONE ctermbg=NONE cterm=undercurl
"   hi SpellLocal ctermfg=NONE ctermbg=NONE cterm=undercurl
"   hi SpellRare ctermfg=NONE ctermbg=NONE cterm=undercurl
"   hi TabLineSel ctermfg=189 ctermbg=235 cterm=NONE
"   hi Title ctermfg=189 ctermbg=NONE cterm=NONE
"   hi VertSplit ctermfg=238 ctermbg=NONE cterm=NONE
"   hi Visual ctermfg=NONE ctermbg=238 cterm=NONE
"   hi WarningMsg ctermfg=222 ctermbg=NONE cterm=NONE
"   hi Boolean ctermfg=181 ctermbg=NONE cterm=NONE
"   hi Character ctermfg=222 ctermbg=NONE cterm=NONE
"   hi Conditional ctermfg=31 ctermbg=NONE cterm=NONE
"   hi Constant ctermfg=222 ctermbg=NONE cterm=NONE
"   hi Debug ctermfg=181 ctermbg=NONE cterm=NONE
"   hi Define ctermfg=183 ctermbg=NONE cterm=NONE
"   hi Delimiter ctermfg=103 ctermbg=NONE cterm=NONE
"   hi Error ctermfg=204 ctermbg=NONE cterm=NONE
"   hi Exception ctermfg=31 ctermbg=NONE cterm=NONE
"   hi Float ctermfg=222 ctermbg=NONE cterm=NONE
"   hi Function ctermfg=181 ctermbg=NONE cterm=NONE
"   hi Identifier ctermfg=181 ctermbg=NONE cterm=NONE
"   hi Include ctermfg=183 ctermbg=NONE cterm=NONE
"   hi Keyword ctermfg=31 ctermbg=NONE cterm=NONE
"   hi Label ctermfg=152 ctermbg=NONE cterm=NONE
"   hi Macro ctermfg=183 ctermbg=NONE cterm=NONE
"   hi Number ctermfg=222 ctermbg=NONE cterm=NONE
"   hi Operator ctermfg=103 ctermbg=NONE cterm=NONE
"   hi PreCondit ctermfg=183 ctermbg=NONE cterm=NONE
"   hi PreProc ctermfg=183 ctermbg=NONE cterm=NONE
"   hi Repeat ctermfg=31 ctermbg=NONE cterm=NONE
"   hi Special ctermfg=181 ctermbg=NONE cterm=NONE
"   hi SpecialChar ctermfg=181 ctermbg=NONE cterm=NONE
"   hi SpecialComment ctermfg=183 ctermbg=NONE cterm=NONE
"   hi Statement ctermfg=31 ctermbg=NONE cterm=NONE
"   hi StorageClass ctermfg=152 ctermbg=NONE cterm=NONE
"   hi String ctermfg=222 ctermbg=NONE cterm=NONE
"   hi Structure ctermfg=152 ctermbg=NONE cterm=NONE
"   hi Tag ctermfg=181 ctermbg=NONE cterm=NONE
"   hi Todo ctermfg=183 ctermbg=NONE cterm=NONE
"   hi Type ctermfg=152 ctermbg=NONE cterm=NONE
"   hi Typedef ctermfg=152 ctermbg=NONE cterm=NONE
"   hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
"   hi htmlArg ctermfg=183 ctermbg=NONE cterm=NONE
"   hi htmlBold ctermfg=NONE ctermbg=NONE cterm=bold
"   hi htmlEndTag ctermfg=103 ctermbg=NONE cterm=NONE
"   hi htmlH1 ctermfg=183 ctermbg=NONE cterm=bold
"   hi htmlH2 ctermfg=152 ctermbg=NONE cterm=bold
"   hi htmlH3 ctermfg=181 ctermbg=NONE cterm=bold
"   hi htmlH4 ctermfg=222 ctermbg=NONE cterm=bold
"   hi htmlH5 ctermfg=31 ctermbg=NONE cterm=bold
"   if !s:italics 
"     hi htmlItalic ctermfg=NONE ctermbg=NONE cterm=NONE
"   else
"     hi htmlItalic ctermfg=NONE ctermbg=NONE cterm=italic
"     if !s:italics
"       hi htmlItalic cterm=NONE
"     endif
"   endif
"   hi htmlLink ctermfg=183 ctermbg=NONE cterm=NONE
"   hi htmlTag ctermfg=103 ctermbg=NONE cterm=NONE
"   hi htmlTagN ctermfg=189 ctermbg=NONE cterm=NONE
"   hi htmlTagName ctermfg=152 ctermbg=NONE cterm=NONE
"   hi markdownDelimiter ctermfg=103 ctermbg=NONE cterm=NONE
"   hi markdownH1 ctermfg=183 ctermbg=NONE cterm=bold
"   hi markdownH2 ctermfg=152 ctermbg=NONE cterm=bold
"   hi markdownH3 ctermfg=181 ctermbg=NONE cterm=bold
"   hi markdownH4 ctermfg=222 ctermbg=NONE cterm=bold
"   hi markdownH5 ctermfg=31 ctermbg=NONE cterm=bold
"   hi markdownH6 ctermfg=152 ctermbg=NONE cterm=bold
"   hi markdownLinkText ctermfg=183 ctermbg=NONE cterm=underline
"   if !s:italics 
"     hi mkdCode ctermfg=152 ctermbg=NONE cterm=NONE
"   else
"     hi mkdCode ctermfg=152 ctermbg=NONE cterm=italic
"     if !s:italics
"       hi mkdCode cterm=NONE
"     endif
"   endif
"   hi mkdCodeDelimiter ctermfg=181 ctermbg=NONE cterm=NONE
"   hi mkdCodeEnd ctermfg=152 ctermbg=NONE cterm=NONE
"   hi mkdCodeStart ctermfg=152 ctermbg=NONE cterm=NONE
"   hi mkdFootnotes ctermfg=152 ctermbg=NONE cterm=NONE
"   hi mkdID ctermfg=152 ctermbg=NONE cterm=underline
"   hi mkdInlineURL ctermfg=183 ctermbg=NONE cterm=underline
"   hi mkdListItemLine ctermfg=189 ctermbg=NONE cterm=NONE
"   hi mkdRule ctermfg=103 ctermbg=NONE cterm=NONE
"   hi VimwikiHR ctermfg=103 ctermbg=NONE cterm=NONE
"   hi VimwikiHeader1 ctermfg=183 ctermbg=NONE cterm=bold
"   hi VimwikiHeader2 ctermfg=152 ctermbg=NONE cterm=bold
"   hi VimwikiHeader3 ctermfg=181 ctermbg=NONE cterm=bold
"   hi VimwikiHeader4 ctermfg=222 ctermbg=NONE cterm=bold
"   hi VimwikiHeader5 ctermfg=31 ctermbg=NONE cterm=bold
"   hi VimwikiHeader6 ctermfg=152 ctermbg=NONE cterm=bold
"   hi VimwikiHeaderChar ctermfg=31 ctermbg=NONE cterm=NONE
"   hi VimwikiLink ctermfg=183 ctermbg=NONE cterm=underline
"   hi VimwikiList ctermfg=183 ctermbg=NONE cterm=NONE
"   hi VimwikiNoExistsLink ctermfg=204 ctermbg=NONE cterm=NONE
"   unlet s:t_Co s:italics
"   finish
" endif

" Background: dark
" Color: base           #191724 ~
" Color: surface        #1f1d2e ~
" Color: overlay        #26233a ~
" Color: muted          #6e6a86 ~
" Color: subtle         #908caa ~
" Color: text           #e0def4 ~
" Color: love           #eb6f92 ~
" Color: gold           #f6c177 ~
" Color: rose           #ebbcba ~
" Color: pine           #31748f ~
" Color: foam           #9ccfd8 ~
" Color: iris           #c4a7e7 ~
" Color: highlight_low  #21202e ~
" Color: highlight_med  #403d52 ~
" Color: highlight_high #524f67 ~
" Color: diff_add       #333c48 ~
" Color: diff_delete    #43293a ~
" Color: diff_text      #433842 ~
" Term colors: overlay love pine gold
" Term colors: foam    iris rose text
" Term colors: subtle  love pine gold
" Term colors: foam    iris rose text

"-----------------------------------------------------------------------------
"-----------------------------------------------------------------------------
"-----------------------------------------------------------------------------

" Name:         Rosé Pine Moon
" Description:  All natural pine, faux fur and a bit of soho vibes for the classy minimalist
" Author:       Prateek Tade <prateek.tade@gmail.com>
" Maintainer:   Prateek Tade <prateek.tade@gmail.com>
" Website:      https://github.com/rose-pine/vim
" License:      Vim License (see `:help license`)
" Last Updated: Sun Jan 15 20:43:11 2023

" Generated by Colortemplate v2.2.0

" set background=dark
" 
" hi clear
" let g:colors_name = 'rosepine_moon'
" 
" let s:t_Co = exists('&t_Co') && !has('gui_running') ? (&t_Co ?? 0) : -1
" let s:italics = (&t_ZH != '' && &t_ZH != '[7m') || has('gui_running')
" 
" hi! link CurSearch IncSearch
" hi! link diffAdded DiffAdd
" hi! link diffChanged DiffChange
" hi! link diffRemoved DiffDelete
" hi! link StatusLineTerm StatusLine
" hi! link StatusLineTermNC StatusLineNC
" hi! link WildMenu IncSearch
" hi! link markdownH1Delimiter markdownH1
" hi! link markdownH2Delimiter markdownH2
" hi! link markdownH3Delimiter markdownH3
" hi! link markdownH4Delimiter markdownH4
" hi! link markdownH5Delimiter markdownH5
" hi! link markdownH6Delimiter markdownH6
" hi! link markdownURL markdownLinkText
" hi! link mkdLink mkdInlineURL
" hi! link mkdLinkDef mkdInlineURL
" hi! link mkdURL mkdInlineURL
" 
" if (has('termguicolors') && &termguicolors) || has('gui_running')
"   let g:terminal_ansi_colors = ['#393552', '#eb6f92', '#3e8fb0', '#f6c177', '#9ccfd8', '#c4a7e7', '#ea9a97', '#e0def4', '#908caa', '#eb6f92', '#3e8fb0', '#f6c177', '#9ccfd8', '#c4a7e7', '#ea9a97', '#e0def4']
" endif
" if get(g:,'disable_bg',0)
"   hi Normal guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
"   hi NormalNC guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
"   hi SignColumn guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
"   hi StatusLineNC guifg=#6e6a86 guibg=NONE gui=NONE cterm=NONE
" else
"   hi Normal guifg=#e0def4 guibg=#232136 gui=NONE cterm=NONE
"   hi NormalNC guifg=#e0def4 guibg=#232136 gui=NONE cterm=NONE
"   hi SignColumn guifg=#e0def4 guibg=#232136 gui=NONE cterm=NONE
"   hi StatusLineNC guifg=#6e6a86 guibg=#232136 gui=NONE cterm=NONE
" endif
" if get(g:,'disable_float_bg',0)
"   hi DarkenedPanel guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
"   hi DarkenedStatusline guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
"   hi Folded guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
"   hi NormalFloat guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
"   hi Pmenu guifg=#908caa guibg=NONE gui=NONE cterm=NONE
"   hi StatusLine guifg=#908caa guibg=NONE gui=NONE cterm=NONE
"   hi TabLine guifg=#908caa guibg=NONE gui=NONE cterm=NONE
"   hi TabLineFill guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
" else
"   hi DarkenedPanel guifg=NONE guibg=#2a273f gui=NONE cterm=NONE
"   hi DarkenedStatusline guifg=NONE guibg=#2a273f gui=NONE cterm=NONE
"   hi Folded guifg=#e0def4 guibg=#2a273f gui=NONE cterm=NONE
"   hi NormalFloat guifg=#e0def4 guibg=#2a273f gui=NONE cterm=NONE
"   hi Pmenu guifg=#908caa guibg=#2a273f gui=NONE cterm=NONE
"   hi StatusLine guifg=#908caa guibg=#2a273f gui=NONE cterm=NONE
"   hi TabLine guifg=#908caa guibg=#2a273f gui=NONE cterm=NONE
"   hi TabLineFill guifg=NONE guibg=#2a273f gui=NONE cterm=NONE
" endif
" if !s:italics 
"   hi Comment guifg=#6e6a86 guibg=NONE gui=NONE cterm=NONE
" else
"   hi Comment guifg=#6e6a86 guibg=NONE gui=italic cterm=italic
"   if !s:italics
"     hi Comment gui=NONE cterm=NONE
"   endif
" endif
" hi ColorColumn guifg=NONE guibg=#393552 gui=NONE cterm=NONE
" hi Conceal guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
" hi CursorColumn guifg=NONE guibg=#2a283e gui=NONE cterm=NONE
" hi CursorLine guifg=NONE guibg=#2a283e gui=NONE cterm=NONE
" hi CursorLineNr guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
" hi DiffAdd guifg=NONE guibg=#3b4456 gui=NONE cterm=NONE
" hi DiffChange guifg=NONE guibg=#393552 gui=NONE cterm=NONE
" hi DiffDelete guifg=NONE guibg=#4b3148 gui=NONE cterm=NONE
" hi DiffText guifg=NONE guibg=#4b3949 gui=NONE cterm=NONE
" hi Directory guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
" hi ErrorMsg guifg=#eb6f92 guibg=NONE gui=bold cterm=bold
" hi FloatBorder guifg=#44415a guibg=NONE gui=NONE cterm=NONE
" hi FloatTitle guifg=#6e6a86 guibg=NONE gui=NONE cterm=NONE
" hi FoldColumn guifg=#6e6a86 guibg=NONE gui=NONE cterm=NONE
" hi IncSearch guifg=#232136 guibg=#ea9a97 gui=NONE cterm=NONE
" hi LineNr guifg=#6e6a86 guibg=NONE gui=NONE cterm=NONE
" hi MatchParen guifg=#e0def4 guibg=#44415a gui=NONE cterm=NONE
" hi ModeMsg guifg=#908caa guibg=NONE gui=NONE cterm=NONE
" hi MoreMsg guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
" hi NonText guifg=#6e6a86 guibg=NONE gui=NONE cterm=NONE
" hi PmenuSbar guifg=NONE guibg=#2a283e gui=NONE cterm=NONE
" hi PmenuSel guifg=#e0def4 guibg=#393552 gui=NONE cterm=NONE
" hi PmenuThumb guifg=NONE guibg=#44415a gui=NONE cterm=NONE
" hi PmenuMatch guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
" hi Question guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
" hi Search guifg=NONE guibg=#44415a gui=NONE cterm=NONE
" hi SpecialKey guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
" hi SpellBad guifg=NONE guibg=NONE guisp=#908caa gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
" hi SpellCap guifg=NONE guibg=NONE guisp=#908caa gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
" hi SpellLocal guifg=NONE guibg=NONE guisp=#908caa gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
" hi SpellRare guifg=NONE guibg=NONE guisp=#908caa gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
" hi TabLineSel guifg=#e0def4 guibg=#393552 gui=NONE cterm=NONE
" hi Title guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
" hi VertSplit guifg=#44415a guibg=NONE gui=NONE cterm=NONE
" hi Visual guifg=NONE guibg=#44415a gui=NONE cterm=NONE
" hi WarningMsg guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
" hi Boolean guifg=#ea9a97 guibg=NONE gui=NONE cterm=NONE
" hi Character guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
" hi Conditional guifg=#3e8fb0 guibg=NONE gui=NONE cterm=NONE
" hi Constant guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
" hi Debug guifg=#ea9a97 guibg=NONE gui=NONE cterm=NONE
" hi Define guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
" hi Delimiter guifg=#908caa guibg=NONE gui=NONE cterm=NONE
" hi Error guifg=#eb6f92 guibg=NONE gui=NONE cterm=NONE
" hi Exception guifg=#3e8fb0 guibg=NONE gui=NONE cterm=NONE
" hi Float guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
" hi Function guifg=#ea9a97 guibg=NONE gui=NONE cterm=NONE
" hi Identifier guifg=#ea9a97 guibg=NONE gui=NONE cterm=NONE
" hi Include guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
" hi Keyword guifg=#3e8fb0 guibg=NONE gui=NONE cterm=NONE
" hi Label guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
" hi Macro guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
" hi Number guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
" hi Operator guifg=#908caa guibg=NONE gui=NONE cterm=NONE
" hi PreCondit guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
" hi PreProc guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
" hi Repeat guifg=#3e8fb0 guibg=NONE gui=NONE cterm=NONE
" hi Special guifg=#ea9a97 guibg=NONE gui=NONE cterm=NONE
" hi SpecialChar guifg=#ea9a97 guibg=NONE gui=NONE cterm=NONE
" hi SpecialComment guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
" hi Statement guifg=#3e8fb0 guibg=NONE gui=NONE cterm=NONE
" hi StorageClass guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
" hi String guifg=#f6c177 guibg=NONE gui=NONE cterm=NONE
" hi Structure guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
" hi Tag guifg=#ea9a97 guibg=NONE gui=NONE cterm=NONE
" hi Todo guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
" hi Type guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
" hi Typedef guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
" hi Underlined guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
" hi htmlArg guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
" hi htmlBold guifg=NONE guibg=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
" hi htmlEndTag guifg=#908caa guibg=NONE gui=NONE cterm=NONE
" hi htmlH1 guifg=#c4a7e7 guibg=NONE gui=bold cterm=bold
" hi htmlH2 guifg=#9ccfd8 guibg=NONE gui=bold cterm=bold
" hi htmlH3 guifg=#ea9a97 guibg=NONE gui=bold cterm=bold
" hi htmlH4 guifg=#f6c177 guibg=NONE gui=bold cterm=bold
" hi htmlH5 guifg=#3e8fb0 guibg=NONE gui=bold cterm=bold
" if !s:italics 
"   hi htmlItalic guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
" else
"   hi htmlItalic guifg=NONE guibg=NONE gui=italic ctermfg=NONE ctermbg=NONE cterm=italic
"   if !s:italics
"     hi htmlItalic gui=NONE cterm=NONE
"   endif
" endif
" hi htmlLink guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
" hi htmlTag guifg=#908caa guibg=NONE gui=NONE cterm=NONE
" hi htmlTagN guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
" hi htmlTagName guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
" hi markdownDelimiter guifg=#908caa guibg=NONE gui=NONE cterm=NONE
" hi markdownH1 guifg=#c4a7e7 guibg=NONE gui=bold cterm=bold
" hi markdownH2 guifg=#9ccfd8 guibg=NONE gui=bold cterm=bold
" hi markdownH3 guifg=#ea9a97 guibg=NONE gui=bold cterm=bold
" hi markdownH4 guifg=#f6c177 guibg=NONE gui=bold cterm=bold
" hi markdownH5 guifg=#3e8fb0 guibg=NONE gui=bold cterm=bold
" hi markdownH6 guifg=#9ccfd8 guibg=NONE gui=bold cterm=bold
" hi markdownLinkText guifg=#c4a7e7 guibg=NONE gui=underline cterm=underline
" if !s:italics 
"   hi mkdCode guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
" else
"   hi mkdCode guifg=#9ccfd8 guibg=NONE gui=italic cterm=italic
"   if !s:italics
"     hi mkdCode gui=NONE cterm=NONE
"   endif
" endif
" hi mkdCodeDelimiter guifg=#ea9a97 guibg=NONE gui=NONE cterm=NONE
" hi mkdCodeEnd guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
" hi mkdCodeStart guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
" hi mkdFootnotes guifg=#9ccfd8 guibg=NONE gui=NONE cterm=NONE
" hi mkdID guifg=#9ccfd8 guibg=NONE gui=underline cterm=underline
" hi mkdInlineURL guifg=#c4a7e7 guibg=NONE gui=underline cterm=underline
" hi mkdListItemLine guifg=#e0def4 guibg=NONE gui=NONE cterm=NONE
" hi mkdRule guifg=#908caa guibg=NONE gui=NONE cterm=NONE
" hi VimwikiHR guifg=#908caa guibg=NONE gui=NONE cterm=NONE
" hi VimwikiHeader1 guifg=#c4a7e7 guibg=NONE gui=bold cterm=bold
" hi VimwikiHeader2 guifg=#9ccfd8 guibg=NONE gui=bold cterm=bold
" hi VimwikiHeader3 guifg=#ea9a97 guibg=NONE gui=bold cterm=bold
" hi VimwikiHeader4 guifg=#f6c177 guibg=NONE gui=bold cterm=bold
" hi VimwikiHeader5 guifg=#3e8fb0 guibg=NONE gui=bold cterm=bold
" hi VimwikiHeader6 guifg=#9ccfd8 guibg=NONE gui=bold cterm=bold
" hi VimwikiHeaderChar guifg=#3e8fb0 guibg=NONE gui=NONE cterm=NONE
" hi VimwikiLink guifg=#c4a7e7 guibg=NONE gui=underline cterm=underline
" hi VimwikiList guifg=#c4a7e7 guibg=NONE gui=NONE cterm=NONE
" hi VimwikiNoExistsLink guifg=#eb6f92 guibg=NONE gui=NONE cterm=NONE
" 
" if s:t_Co >= 256
"   if get(g:,'disable_bg',0)
"     hi Normal ctermfg=189 ctermbg=NONE cterm=NONE
"     hi NormalNC ctermfg=189 ctermbg=NONE cterm=NONE
"     hi SignColumn ctermfg=189 ctermbg=NONE cterm=NONE
"     hi StatusLineNC ctermfg=60 ctermbg=NONE cterm=NONE
"   else
"     hi Normal ctermfg=189 ctermbg=235 cterm=NONE
"     hi NormalNC ctermfg=189 ctermbg=235 cterm=NONE
"     hi SignColumn ctermfg=189 ctermbg=235 cterm=NONE
"     hi StatusLineNC ctermfg=60 ctermbg=235 cterm=NONE
"   endif
"   if get(g:,'disable_float_bg',0)
"     hi DarkenedPanel ctermfg=NONE ctermbg=NONE cterm=NONE
"     hi DarkenedStatusline ctermfg=NONE ctermbg=NONE cterm=NONE
"     hi Folded ctermfg=189 ctermbg=NONE cterm=NONE
"     hi NormalFloat ctermfg=189 ctermbg=NONE cterm=NONE
"     hi Pmenu ctermfg=103 ctermbg=NONE cterm=NONE
"     hi StatusLine ctermfg=103 ctermbg=NONE cterm=NONE
"     hi TabLine ctermfg=103 ctermbg=NONE cterm=NONE
"     hi TabLineFill ctermfg=NONE ctermbg=NONE cterm=NONE
"   else
"     hi DarkenedPanel ctermfg=NONE ctermbg=235 cterm=NONE
"     hi DarkenedStatusline ctermfg=NONE ctermbg=235 cterm=NONE
"     hi Folded ctermfg=189 ctermbg=235 cterm=NONE
"     hi NormalFloat ctermfg=189 ctermbg=235 cterm=NONE
"     hi Pmenu ctermfg=103 ctermbg=235 cterm=NONE
"     hi StatusLine ctermfg=103 ctermbg=235 cterm=NONE
"     hi TabLine ctermfg=103 ctermbg=235 cterm=NONE
"     hi TabLineFill ctermfg=NONE ctermbg=235 cterm=NONE
"   endif
"   if !s:italics 
"     hi Comment ctermfg=60 ctermbg=NONE cterm=NONE
"   else
"     hi Comment ctermfg=60 ctermbg=NONE cterm=italic
"     if !s:italics
"       hi Comment cterm=NONE
"     endif
"   endif
"   hi ColorColumn ctermfg=NONE ctermbg=237 cterm=NONE
"   hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
"   hi CursorColumn ctermfg=NONE ctermbg=235 cterm=NONE
"   hi CursorLine ctermfg=NONE ctermbg=235 cterm=NONE
"   hi CursorLineNr ctermfg=189 ctermbg=NONE cterm=NONE
"   hi DiffAdd ctermfg=NONE ctermbg=238 cterm=NONE
"   hi DiffChange ctermfg=NONE ctermbg=237 cterm=NONE
"   hi DiffDelete ctermfg=NONE ctermbg=53 cterm=NONE
"   hi DiffText ctermfg=NONE ctermbg=237 cterm=NONE
"   hi Directory ctermfg=152 ctermbg=NONE cterm=NONE
"   hi ErrorMsg ctermfg=204 ctermbg=NONE cterm=bold
"   hi FloatBorder ctermfg=60 ctermbg=NONE cterm=NONE
"   hi FloatTitle ctermfg=60 ctermbg=NONE cterm=NONE
"   hi FoldColumn ctermfg=60 ctermbg=NONE cterm=NONE
"   hi IncSearch ctermfg=235 ctermbg=174 cterm=NONE
"   hi LineNr ctermfg=60 ctermbg=NONE cterm=NONE
"   hi MatchParen ctermfg=189 ctermbg=60 cterm=NONE
"   hi ModeMsg ctermfg=103 ctermbg=NONE cterm=NONE
"   hi MoreMsg ctermfg=183 ctermbg=NONE cterm=NONE
"   hi NonText ctermfg=60 ctermbg=NONE cterm=NONE
"   hi PmenuSbar ctermfg=NONE ctermbg=235 cterm=NONE
"   hi PmenuSel ctermfg=189 ctermbg=237 cterm=NONE
"   hi PmenuThumb ctermfg=NONE ctermbg=60 cterm=NONE
"   hi Question ctermfg=222 ctermbg=NONE cterm=NONE
"   hi Search ctermfg=NONE ctermbg=60 cterm=NONE
"   hi SpecialKey ctermfg=152 ctermbg=NONE cterm=NONE
"   hi SpellBad ctermfg=NONE ctermbg=NONE cterm=undercurl
"   hi SpellCap ctermfg=NONE ctermbg=NONE cterm=undercurl
"   hi SpellLocal ctermfg=NONE ctermbg=NONE cterm=undercurl
"   hi SpellRare ctermfg=NONE ctermbg=NONE cterm=undercurl
"   hi TabLineSel ctermfg=189 ctermbg=237 cterm=NONE
"   hi Title ctermfg=189 ctermbg=NONE cterm=NONE
"   hi VertSplit ctermfg=60 ctermbg=NONE cterm=NONE
"   hi Visual ctermfg=NONE ctermbg=60 cterm=NONE
"   hi WarningMsg ctermfg=222 ctermbg=NONE cterm=NONE
"   hi Boolean ctermfg=174 ctermbg=NONE cterm=NONE
"   hi Character ctermfg=222 ctermbg=NONE cterm=NONE
"   hi Conditional ctermfg=31 ctermbg=NONE cterm=NONE
"   hi Constant ctermfg=222 ctermbg=NONE cterm=NONE
"   hi Debug ctermfg=174 ctermbg=NONE cterm=NONE
"   hi Define ctermfg=183 ctermbg=NONE cterm=NONE
"   hi Delimiter ctermfg=103 ctermbg=NONE cterm=NONE
"   hi Error ctermfg=204 ctermbg=NONE cterm=NONE
"   hi Exception ctermfg=31 ctermbg=NONE cterm=NONE
"   hi Float ctermfg=222 ctermbg=NONE cterm=NONE
"   hi Function ctermfg=174 ctermbg=NONE cterm=NONE
"   hi Identifier ctermfg=174 ctermbg=NONE cterm=NONE
"   hi Include ctermfg=183 ctermbg=NONE cterm=NONE
"   hi Keyword ctermfg=31 ctermbg=NONE cterm=NONE
"   hi Label ctermfg=152 ctermbg=NONE cterm=NONE
"   hi Macro ctermfg=183 ctermbg=NONE cterm=NONE
"   hi Number ctermfg=222 ctermbg=NONE cterm=NONE
"   hi Operator ctermfg=103 ctermbg=NONE cterm=NONE
"   hi PreCondit ctermfg=183 ctermbg=NONE cterm=NONE
"   hi PreProc ctermfg=183 ctermbg=NONE cterm=NONE
"   hi Repeat ctermfg=31 ctermbg=NONE cterm=NONE
"   hi Special ctermfg=174 ctermbg=NONE cterm=NONE
"   hi SpecialChar ctermfg=174 ctermbg=NONE cterm=NONE
"   hi SpecialComment ctermfg=183 ctermbg=NONE cterm=NONE
"   hi Statement ctermfg=31 ctermbg=NONE cterm=NONE
"   hi StorageClass ctermfg=152 ctermbg=NONE cterm=NONE
"   hi String ctermfg=222 ctermbg=NONE cterm=NONE
"   hi Structure ctermfg=152 ctermbg=NONE cterm=NONE
"   hi Tag ctermfg=174 ctermbg=NONE cterm=NONE
"   hi Todo ctermfg=183 ctermbg=NONE cterm=NONE
"   hi Type ctermfg=152 ctermbg=NONE cterm=NONE
"   hi Typedef ctermfg=152 ctermbg=NONE cterm=NONE
"   hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
"   hi htmlArg ctermfg=183 ctermbg=NONE cterm=NONE
"   hi htmlBold ctermfg=NONE ctermbg=NONE cterm=bold
"   hi htmlEndTag ctermfg=103 ctermbg=NONE cterm=NONE
"   hi htmlH1 ctermfg=183 ctermbg=NONE cterm=bold
"   hi htmlH2 ctermfg=152 ctermbg=NONE cterm=bold
"   hi htmlH3 ctermfg=174 ctermbg=NONE cterm=bold
"   hi htmlH4 ctermfg=222 ctermbg=NONE cterm=bold
"   hi htmlH5 ctermfg=31 ctermbg=NONE cterm=bold
"   if !s:italics 
"     hi htmlItalic ctermfg=NONE ctermbg=NONE cterm=NONE
"   else
"     hi htmlItalic ctermfg=NONE ctermbg=NONE cterm=italic
"     if !s:italics
"       hi htmlItalic cterm=NONE
"     endif
"   endif
"   hi htmlLink ctermfg=183 ctermbg=NONE cterm=NONE
"   hi htmlTag ctermfg=103 ctermbg=NONE cterm=NONE
"   hi htmlTagN ctermfg=189 ctermbg=NONE cterm=NONE
"   hi htmlTagName ctermfg=152 ctermbg=NONE cterm=NONE
"   hi markdownDelimiter ctermfg=103 ctermbg=NONE cterm=NONE
"   hi markdownH1 ctermfg=183 ctermbg=NONE cterm=bold
"   hi markdownH2 ctermfg=152 ctermbg=NONE cterm=bold
"   hi markdownH3 ctermfg=174 ctermbg=NONE cterm=bold
"   hi markdownH4 ctermfg=222 ctermbg=NONE cterm=bold
"   hi markdownH5 ctermfg=31 ctermbg=NONE cterm=bold
"   hi markdownH6 ctermfg=152 ctermbg=NONE cterm=bold
"   hi markdownLinkText ctermfg=183 ctermbg=NONE cterm=underline
"   if !s:italics 
"     hi mkdCode ctermfg=152 ctermbg=NONE cterm=NONE
"   else
"     hi mkdCode ctermfg=152 ctermbg=NONE cterm=italic
"     if !s:italics
"       hi mkdCode cterm=NONE
"     endif
"   endif
"   hi mkdCodeDelimiter ctermfg=174 ctermbg=NONE cterm=NONE
"   hi mkdCodeEnd ctermfg=152 ctermbg=NONE cterm=NONE
"   hi mkdCodeStart ctermfg=152 ctermbg=NONE cterm=NONE
"   hi mkdFootnotes ctermfg=152 ctermbg=NONE cterm=NONE
"   hi mkdID ctermfg=152 ctermbg=NONE cterm=underline
"   hi mkdInlineURL ctermfg=183 ctermbg=NONE cterm=underline
"   hi mkdListItemLine ctermfg=189 ctermbg=NONE cterm=NONE
"   hi mkdRule ctermfg=103 ctermbg=NONE cterm=NONE
"   hi VimwikiHR ctermfg=103 ctermbg=NONE cterm=NONE
"   hi VimwikiHeader1 ctermfg=183 ctermbg=NONE cterm=bold
"   hi VimwikiHeader2 ctermfg=152 ctermbg=NONE cterm=bold
"   hi VimwikiHeader3 ctermfg=174 ctermbg=NONE cterm=bold
"   hi VimwikiHeader4 ctermfg=222 ctermbg=NONE cterm=bold
"   hi VimwikiHeader5 ctermfg=31 ctermbg=NONE cterm=bold
"   hi VimwikiHeader6 ctermfg=152 ctermbg=NONE cterm=bold
"   hi VimwikiHeaderChar ctermfg=31 ctermbg=NONE cterm=NONE
"   hi VimwikiLink ctermfg=183 ctermbg=NONE cterm=underline
"   hi VimwikiList ctermfg=183 ctermbg=NONE cterm=NONE
"   hi VimwikiNoExistsLink ctermfg=204 ctermbg=NONE cterm=NONE
"   unlet s:t_Co s:italics
"   finish
" endif

" Background: dark
" Color: base           #232136 ~
" Color: surface        #2a273f ~
" Color: overlay        #393552 ~
" Color: muted          #6e6a86 ~
" Color: subtle         #908caa ~
" Color: text           #e0def4 ~
" Color: love           #eb6f92 ~
" Color: gold           #f6c177 ~
" Color: rose           #ea9a97 ~
" Color: pine           #3e8fb0 ~
" Color: foam           #9ccfd8 ~
" Color: iris           #c4a7e7 ~
" Color: highlight_low  #2a283e ~
" Color: highlight_med  #44415a ~
" Color: highlight_high #56526e ~
" Color: diff_add       #3b4456 ~
" Color: diff_delete    #4b3148 ~
" Color: diff_text      #4b3949 ~
" Term colors: overlay love pine gold
" Term colors: foam    iris rose text
" Term colors: subtle  love pine gold
" Term colors: foam    iris rose text
" vim: et ts=2 sw=2

"------------------END_KEY------------------

