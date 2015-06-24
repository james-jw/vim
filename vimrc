set t_Co=256
set laststatus=2 " Permanent status bar
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
set completeopt=longest,menuone,preview
colorscheme ir_black
" Colors for the diffs
hi DiffAdd guifg=#aaeeaa ctermfg=157 guibg=#447744 ctermbg=28 gui=none cterm=none 
hi DiffChange guifg=black ctermfg=16 guibg=#ddbb55 ctermbg=179 gui=none cterm=none 
hi DiffDelete guifg=#336633 ctermfg=22 guibg=#aaccaa ctermbg=red gui=none cterm=none 
hi Difftext guifg=black ctermfg=16 guibg=#cc7733 ctermbg=172 gui=none cterm=none 

" Enable power line fonts.
let g:Powerline_symbols = 'fancy'
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified',
      \   'filename': 'MyFilename'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

let g:ycm_semantic_triggers = {
\ 'xquery': [':']
\ }

" Enable syntastic output
let g:syntastic_enable_signs=1

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_balloons=0

" Easy window resize when more than one window
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" Fugitive auto delete hidden buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

nnoremap j gj
nnoremap k gk

hi Folded ctermfg=darkgreen
hi Pmenu ctermbg=darkgray ctermfg=white
hi PmenuSel ctermbg=blue ctermfg=black

" Auto Fold based on syntax 
set foldmethod=syntax
" NerdTree AutoClose when only tree open
map <C-n> :NERDTreeToggle<CR>

" Highlight current line
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR></CR></Leader>

" Rename : to ;
nnoremap ; :

" Sticky Highlight
" nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR></CR></Leader></silent>
autocmd VimEnter * silent! Tmuxline lightline

" configuration for dispatch
autocmd FileType xquery let b:dispatch = 'basex -t %'
nnoremap <F7> :Dispatch<CR>
