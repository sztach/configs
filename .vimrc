" option-list or options
" activates filetype detection
filetype plugin indent on

" activates syntax highlighting among other things
syntax on


"testing
"set tabstop=4
"set textwidth=79
"set autoindent
"set smartindent
"set fileformat=unix

let python_highlight_all=1

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
colorscheme elflord

set scrolloff=10
set shiftwidth=4
set softtabstop=4

" resize windows easier
nnoremap + <C-W>+
nnoremap _ <C-W>-
nnoremap < <C-W><
nnoremap > <C-W>>

"move between windows easier
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l

let mapleader="\<Space>"

" mappings for moving faster
noremap H :bp<CR>
noremap J 20j
noremap K 20k
noremap L :bn<CR>
noremap - $

" move vim panes easier
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" mapping to preserve default HJKL shorcuts
nnoremap <leader>H H
nnoremap <leader>J J
nnoremap <leader>K K
nnoremap <leader>L L

" easier copying
nnoremap <leader>z :set nu! rnu! paste!<cr>

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

noremap <C-i> :call PyShellSendLine()<cr>j
nmap <C-u> vip:w! ~/.paste.py<cr>:call PyShellSendKey("%load -y ~/.paste.py")<cr>:call PyShellSendKey("")<cr>vipvvj
vmap <C-u> :w! ~/.paste.py<cr>:call PyShellSendKey("%load -y ~/.paste.py")<cr>:call PyShellSendKey("")<cr>'>
nmap <leader>ral ggVG<C-i><cr>:call PyShellSendKey("")<cr>
nmap <leader>rup Vgg<C-u>
" todo add ability to run chunks in code

" some handy stuff for working with spark
nnoremap <leader>pd o<Space>.limit(1000).toPandas()<ESC>
nnoremap <leader>tr oset_trace()<ESC>k
nnoremap <leader>sh yiw:call PyShellSendKey("<C-r>"")<left><left>

call plug#begin()

Plug 'benmills/vimux'
Plug 'greghor/vim-pyShell'
Plug 'davidhalter/jedi-vim'
Plug 'jpalardy/vim-slime'
Plug 'ervandew/supertab'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'morhetz/gruvbox'

call plug#end()

let g:cellmode_cell_delimiter='#%%'
let g:slime_python_ipython = 1
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}
let g:slime_dont_ask_default = 1
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:jedi#popup_on_dot = 0
let g:jedi#documentation_command = "<leader>U"

"set up linter and code formatter
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

nnoremap <leader>sr :call SyntasticReset()<cr>
nnoremap <leader>swq :w<cr>:call SyntasticCheck()<cr>
nnoremap <leader>sq :call SyntasticCheck()<cr>
nnoremap <leader>bl :!black %<cr>:e<cr>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_mode_map = {
        \ "mode": "passive",
        \ "active_filetypes": [],
        \ "passive_filetypes": [] }

let g:syntastic_quiet_messages = {
        \ "!level":  "errors",
       \ "regex":   'E501'}
