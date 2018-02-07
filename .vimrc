colo monokai
syntax on

" remember more commands and search history
set history=10000

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent

set laststatus=2

set showmatch
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

" highlight current line
set cursorline

let mapleader = ','
let maplocalleader = ',,'

inoremap jk <esc>
nnoremap <enter> :nohl<enter>
set number
set relativenumber

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.hbs set filetype=html

call plug#begin('~/.vim/plugged')
Plug 'vimoutliner/vimoutliner'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-pencil'
Plug 'gabrielelana/vim-markdown'
Plug 'embear/vim-localvimrc'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'abaldwin88/roamer.vim'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
"Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'
" --plug
call plug#end()

function DistractionFree()
  Goyo
  Limelight
  Pencil
endfunction

function DistractionsFreed()
  PencilOff
  Limelight!
  Goyo!
endfunction

command NoDistract call DistractionFree()
command Distract call DistractionsFreed()

" autocmd FileType votl :NoDistract

let g:localvimrc_persistent=1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components\|dist\|tmp'

"let g:tsuquyomi_disable_quickfix=1
"let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
"
"let g:syntastic_javascript_checkers = ['eslint']
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
""let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

let g:ale_linters = {'javascript': ['eslint', 'flow']}

" I has regrets...
" autocmd BufWritePre,BufRead *.dot :echo system("graph-easy " . expand("%"))
command Graph echo system("graph-easy " . expand("%"))
command -nargs=1 GraphOut w | echo system("dot -T" . <f-args> . " " . expand("%") . " -o " . expand("%:r") . "." . <f-args>)
