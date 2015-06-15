set nocompatible
set backspace=indent,eol,start
set textwidth=0
set nobackup
execute pathogen#infect()
set history=1200
set undolevels=1000
set visualbell
set noerrorbells
set title
set ruler
set nobackup
set noswapfile
syntax on
filetype plugin on
filetype plugin indent on
set showcmd
set showmatch
set ignorecase
set smartcase
set smarttab
set incsearch
set background=dark
set autoindent
set copyindent
set autoread
set hidden
set shiftround
set expandtab
set tabstop=2
set shiftwidth=2
set nowrap
set nu 
set iskeyword+=-,36,37,47,58,60,64

let g:ycm_semantic_triggers = {
\ 'xquery': [':']
\ }

" Fugitive auto delete hidden buffers
autocmd BufReadPost fugitive://* bufhidden=delete
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%1,%c%V%)\ %P

nnoremap j gj
nnoremap k gk

" Popup
hi PmenuSel ctermbg=gray ctermfg=blue
hi Pmenu ctermbg=red  ctermfg=gray

" Seperator
set fillchars+=vert:\ 
set fillchars+=fold:\ 
hi VertSplit ctermbg=gray

hi Folded ctermbg=blue
hi Folded ctermfg=darkgray

" Auto Fold based on syntax 
set foldmethod=syntax

" NerdTree AutoClose when only tree open
map <C-n> :NERDTreeToggle<CR>

" Highlight current line
hi CursorLine   cterm=NONE ctermbg=darkgray 
hi CursorColumn cterm=NONE ctermbg=darkgray 
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR></CR></Leader>

" Rename : to ;
nnoremap ; :

" Only show current line on active window
augroup CursorLine
au!
au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
au WinLeave * setlocal nocursorline
augroup END

" Sticky Highlight
nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR></CR></Leader></silent>

" Highlight row numbers
highlight LineNr ctermfg=gray ctermbg=red

" Auto Close
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i

" autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
   if getline('.')[col('.') - 1] == a:char
      return "\<Right>"
   else
      return a:char
   endif
endf

function CloseBracket()
	if match(getline(line('.') + 1), '\s*}') < 0
      return "\<CR>}"
	else
      return "\<Esc>j0f}a"
	endif
endf

function QuoteDelim(char)
	let line = getline('.')
	let col = col('.')
	if line[col - 2] == "\\"
      "Inserting a quoted quotation mark into the string
	return a:char
	elseif line[col - 1] == a:char
      "Escaping out of the string
	return "\<Right>"
	else
      "Starting a string
      return a:char.a:char."\<Esc>i"
	endif
endf	 

