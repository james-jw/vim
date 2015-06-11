set nocompatible
set backspace=indent,eol,start
set textwidth=0
set nobackup
set history=200
set ruler
syntax on
filetype plugin on
set showcmd
set showmatch
set ignorecase
set incsearch
set background=dark
set autoindent

set expandtab
set tabstop=3
set shiftwidth=3

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O<TAB>
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
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

