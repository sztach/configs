""" general

" activates filetype detection
filetype plugin indent on

" activates syntax highlighting among other things
syntax on

"cursor is steady block or blinking bar depending on mode
let &t_EI = "\e[2 q"
let &t_SI = "\e[5 q"

"perhaps for further consideration
"set tabstop=4
"set textwidth=79
"set autoindent
"set smartindent
"set fileformat=unix
"colorscheme elflord

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
set paste
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
nnoremap , `

" mapping to preserve default HJKL shorcuts
noremap <leader>H H
noremap <leader>J J
noremap <leader>K K
noremap <leader>L L

" move between vim panes easier
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" delete unused buffers easliy
nnoremap <leader>bd :bp<cr>:bd #<cr>
nnoremap <leader>bdq :bp<cr>:bd! #<cr>
nnoremap <leader>Q :qall!<cr>

" source changes from .vimrc easier
nnoremap <leader><leader>source :source ~/.vimrc<cr>

" map easymotion shortcuts
nmap W <leader><leader>w
nmap B <leader><leader>b

" selection and yanking
nnoremap <leader>z :set nu! rnu! paste!<cr>
nnoremap Y v$y
nnoremap <leader>nh :nohls<cr>
vnoremap <leader>cp :w! ~/.temp_copy<cr><cr>:!pbcopy < ~/.temp_copy<cr><cr>:!rm ~/.temp_copy<cr><cr>

""" python

" options to send code lines to jupyter console
nnoremap <leader><leader>load :call PyShellSendKey("%load_ext autoreload")<cr>:sleep 1<cr>:call PyShellSendKey("%autoreload 2")<cr>
nnoremap <leader><leader>start :call StartPyShell()<cr>
nnoremap <leader><leader>starte :call PyShellSendKey("jupyter console --existing")<cr>
nnoremap <leader><leader>stop :call StopPyShell()<cr>
noremap <C-i> :call PyShellSendLine()<cr>j
" todo remove jupyter console and add chunks from ipython
nmap <C-u> vip:w! ~/.paste.py<cr>:call PyShellSendKey("%load -y ~/.paste.py")<cr>:call PyShellSendKey("")<cr>vipvvj
vmap <C-u> :w! ~/.paste.py<cr>:call PyShellSendKey("%load -y ~/.paste.py")<cr>:call PyShellSendKey("")<cr>'>
nmap <leader>ral ggVG<C-u>
nmap <leader>rup Vgg<C-u>
nmap <leader>rdo VG<C-u>
nmap <leader>rbl ?#$%<cr>VN<C-u>
nmap <leader>rfu ?def<cr>V/return<cr><C-u>
vnoremap <leader>i <leader>J:call PyShellSendLine()<cr>u

" some handy stuff for working with spark
nnoremap <leader>tr oset_trace()<ESC>k
nnoremap <leader>pd yiw:call PyShellSendKey("<C-r>".limit(100).toPandas()")<cr>
nnoremap <leader>cnt yiw:call PyShellSendKey("<C-r>".count()")<cr>
nnoremap <leader>sh yiw:call PyShellSendKey("<C-r>"")<left><left>


call plug#begin()
" Last version has some bug that doesn't allow to send code lines to jupyter console
Plug 'benmills/vimux', {'commit': '37f41195e6369ac602a08ec61364906600b771f1'}
Plug 'greghor/vim-pyShell'
Plug 'davidhalter/jedi-vim'
Plug 'easymotion/vim-easymotion'
Plug 'jpalardy/vim-slime'
Plug 'ervandew/supertab'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'morhetz/gruvbox'

call plug#end()

""" python IDE-like settings

let python_highlight_all=1
let g:cellmode_cell_delimiter='#%%'
let g:slime_python_ipython = 1
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}
let g:slime_dont_ask_default = 1
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:jedi#popup_on_dot = 0
let g:jedi#documentation_command = "<leader>U"

" set up linter and code formatter
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
nnoremap <leader>sr :call SyntasticReset()<cr>
nnoremap <leader>swq :w<cr>:call SyntasticCheck()<cr>
nnoremap <leader>sq :call SyntasticCheck()<cr>
nnoremap <leader>for :!black %<cr>:e<cr>

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
       \ "regex":   'E501\|E402'}
