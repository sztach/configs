" option-list or options
" activates filetype detection
filetype plugin indent on

" activates syntax highlighting among other things
syntax on


set number relativenumber
set hlsearch
set incsearch
set wildmenu
set ignorecase
set smartcase
set lbr
set expandtab
set nowrapscan
set hidden
set backspace=indent,eol,start

set scrolloff=10
set shiftwidth=4
set softtabstop=4

" resize windows easier
nnoremap + <C-W>+
nnoremap _ <C-W>-
nnoremap < <C-W><
nnoremap > <C-W>>

"move between windows easier
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

let mapleader="\<Space>"

" mappings for moving faster
noremap <leader>h :bp<CR>
noremap <leader>l :bn<CR>
noremap H 50j
noremap J 20j
noremap K 20k
noremap L 50k
noremap - $

" mapping to preserve default HJKL shorcuts
nnoremap <leader>H H
nnoremap <leader>J J
nnoremap <leader>K K
nnoremap <leader>L L

" delete unsued buffers easliy
nnoremap <leader>bd :bp<cr>:bd #<cr>
nnoremap <leader>bdq :bp<cr>:bd! #<cr>

" source changes from .vimrc easier
nnoremap <leader><leader>source :source ~/.vimrc<cr>

" options to send code lines to ipython console
nnoremap <leader><leader>load :call PyShellSendKey("%load_ext autoreload")<cr>:sleep 1<cr>:call PyShellSendKey("%autoreload 2")<cr>
nnoremap <leader><leader>start :call StartPyShell()<cr>
nnoremap <leader><leader>starte :call PyShellSendKey("jupyter console --existing")<cr>
nnoremap <leader><leader>stop :call StopPyShell()<cr>
noremap <leader>f :call PyShellSendLine()<cr>j
map <leader>x  <C-c><C-c><leader>avipvvj
map <leader>X ?# %%<cr>Vn<leader>x
noremap <leader>a :call PyShellSendKey("")<cr>


" some handy stuff for working with spark
nnoremap <leader>pd o<Space>.limit(1000).toPandas()<ESC>
nnoremap <leader>tr oset_trace()<ESC>k

call plug#begin()

Plug 'benmills/vimux'
Plug 'greghor/vim-pyShell'
"Plug 'julienr/vim-cellmode'
"Plug 'davidhalter/jedi-vim'
Plug 'jpalardy/vim-slime'
Plug 'ervandew/supertab'

call plug#end()

let g:cellmode_cell_delimiter='#%%'
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}
let g:slime_dont_ask_default = 1
let g:SuperTabDefaultCompletionType = "<c-n>"
"let g:jedi#popup_on_dot = 0
"let g:jedi#documentation_command = "<leader>U"
