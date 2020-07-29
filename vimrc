
" **************************************************************************
" **************************************************************************
"
" Authors: Herb Leisenfelder
" Description: A minimal, but feature rich .vimrc. "
"
" ***************************************************************************
" ***************************************************************************
"
"-------------------------------------------------------------------------
" load Plugins
"-------------------------------------------------------------------------

"packloadall  "loads plugins

" auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    echo "Installing VimPlug..."
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

"VimPlug
call plug#begin('~/.vim/plugged')

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'morhetz/gruvbox'         " popilar color scheme
Plug 'michalbachowski/vim-wombat256mod'  " colors

Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}   " file bar a bottom of page
Plug 'tpope/vim-fugitive'     "  git wapper
Plug 'vim-airline/vim-airline'   " file git status to file bar
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sjl/gundo.vim'      " There showing all edits
Plug 'tomtom/tlib_vim'
Plug 'ntpeters/vim-better-whitespace'

Plug 'SirVer/ultisnipsc'  | Plug 'honza/vim-snippts'   "Useful language related snippts
Plug 'vim-scripts/AutoComplPop'       " Show vim's complete menu

" Python plugs
Plug 'vim-syntastic/syntastic'
Plug 'davidhalter/jedi-vim'
Plug 'nvie/vim-flake8'             " ckecks for PEP8
"Plug 'alfredodeza/pytest.vim'
Plug 'vim-scripts/indentpython'   " sets the indenting for Python
Plug 'sheerun/vim-polyglot'   " collection of language packs

"Plug ends
call plug#end()

"Plupin settings
filetype off
filetype plugin on          " Allows plugins for filetype specific.
filetype indent plugin on   " Attempt to determine the type of a file based on its name

"-------------------------------------------------------------------------
" Features - options and commands that enable features in Vim
"--------------------------------------------------------------------------

set nocompatible            " Checks for compatiblity issue in your distro
set nocp

" set lang for japan  "
set termencoding=utf-8
set fileencodings=utf-8
set ambiwidth=double
set fileformat=unix
set list

" Reloading vimrc
set exrc                    " forces vim to source .vimrc file
set secure                  " restrict usage of some commands in .vimrc file
autocmd! bufwritepost .vimrc source % ; " Automatic reloading of .vimrc

" Show whitespace (MUST be inserted BEFORE the colorscheme command)
 "autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
 "au InsertLeave * match ExtraWhitespace /\s\+$/

"Color scheme
colorscheme wombat256mod
colorscheme gruvbox
highlight Normal guibg=black guifg=white
set background=dark

if &term=="xterm"
     set t_Co=256                " set the color scheme using wombat256
     set t_Sb=^[[4%dm
     set t_Sf=^[[3%dm
endif

highlight ColorColums ctermbg=darkgray

set visualbell             " Use visual bell instead of beeping when doing something wrong
set t_vb=

"Leader key settings
let mapleader = ","         " changes the default leader from \ to ,
let timeoutlen=500          " changer the default timeout for <leader> command to 500 msec

"Buffer settings
set hidden                " Allows you to re-use the same window and switch from an unsaved buffer without saving it first.

"Pasting and clipboard settings
set pastetoggle=<F2>      " pastes blocks of text in inserts mode
set clipboard=unnamed
set showmode

"
"-------------------------------------------------------------------------
" options
"-------------------------------------------------------------------------
"
let python_highlight_all=1
syntax on

"History settings
set history=700           " set the history limit
set undolevels=700        "

" Settings for line numbers and length
set number                " Display line numbers on the left
set tw=79                 " set width of dcoment
set nowrap                "no automatically wraping on load
set fo-=t                  " don't automatically wrap text when typing
set columns=180
set ruler                 " Displays cursor positionin the status line
set relativenumber        " change the line numbers to the number relative to your current line
set wrapmargin=8          "sets number of letters on the edge of left margin
set showbreak=++++         " Setting up the margin line
set colorcolumn=110

"filename completion
if has("wildmenu")                     "checks if wildmenu is avliable
    set wildignore+=*.a,*.o            "excludes filenames that are not edited
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
    set wildmenu                         "sets the completion menu
    set wildmode=longest,list            "completion menu options
endif

"Setting for command windows
set statusline=%f         " Path to the file
"set statusline+=%=        " Switch to the right side
set statusline+=%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines
set laststatus=2          " Always display the status line, even if only one window is displayed
set showcmd               " Show partial commands in the last line of the screen
set cmdheight=2           " Set the command window height to 2 lines,

"Seatch settings
set hlsearch              " Use <C-L> to temporarily turn off highlighting; see mapping
set ignorecase            " Use case insensitive search, except when using capital letters
set incsearch
set smartcase

set nostartofline          " typing G while in visual mode will go to the bottom
set confirm               " dialogue asking if you wish to save changed files.

"Mouse and backspace
set mouse=a               " Enable use of the mouse for all modes
set bs=2                  "make backspace behave like normal
set backspace=indent,eol,start  " Allow backspacing over autoindent, line breaks and start of insert action

set notimeout ttimeout ttimeoutlen=200  " Quickly time out on keycodes, but never time out on mappings

"Tab Settings and indenting
set tabstop=4
set shiftwidth=4          " Indentation settings according to personal preference.
set softtabstop=4
set shiftround
set expandtab
set autoindent             "Keeps the same indent as the line you're currently on.
set smartindent
"nmap <S-Enter> O<Esc>set cindent

" set spell                 " spell checking on
" set dictionary=/usr/share/dict/words
"
"--------------------------------------------------------------------------------------
" Mappings
"--------------------------------------------------------------------------------------
"
map Y y$                             " to yank until EOL, rather than act as yy,

" Quick run via
if &filetype == 'c'
   map <F9> :w<CR>:!gcc % -o %<CR>        " exc gcc from the shell
   map <F10> :<CR>:!Make %<CR> " exc make
elseif &filetype == 'cpp'
   map <F9> :w<CR>:!g++ -std=c++11 % -o %<CR>        " exc c++ from the shell
   map <F10> :<CR>:!Make %<CR> " exc make
elseif &filetype == 'python'
   map <F9> :w<CR>:!python3 %<CR>        " exc python from the shell
   map <F10> :<CR>:!python3 -m pdb %<CR> " exc python in the bebugger
endif

"move  through split windows
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>l <C-w>l
map <Leader>h <C-w>h
map <Leader>\ <C-w>v
map <Leader>- <C-w>s

" move through buffers
nmap <Leader>[ :bp!<CR>
nmap <Leader>] :bn!<CR>
nmap <Leader>x :bd<CR>


" Ex mode config
nnoremap Q <nop>                    " stop entering Ex mode when hitting Q

"Maps for visual mode
vnoremap <Leader>s :sort<CR>        " map sort funtion to a key

"Maps for insert ode
inoremap :; <Esc>
" maps C-X  C-F for completions in insert to tab

inoremap <tab> <c-x><c-f>

" *************************************************************************************************
" *************************************************************************************************
"
" Vim Plug-ins
"
" *************************************************************************************************
" *************************************************************************************************
"
"------------------------------------------------------------
"fugitive: key maps
"------------------------------------------------------------
"
nnoremap \gd :<C-u>Gdiff<CR>
nnoremap \gs :<C-u>Gstatus<CR>
nnoremap \gl :<C-u>Glog<CR>
nnoremap \ga :<C-u>Gwrite<CR>
nnoremap \gc :<C-u>Gcommit<CR>
nnoremap \gC :<C-u>Git commit --amend<CR>
nnoremap \gb :<C-u>Gblame<CR>

"------------------------------------------------------------
"bbetter-white
"------------------------------------------------------------

let g:strip_whitespace_confirm=0
let g:strip_whitelines_at_eof=1
let g:strip_whitespace_on_save=1

"------------------------------------------------------------
"browsing this ridiculously powerful undo tree"
"------------------------------------------------------------

nnoremap <F1> :GundoToggle<CR>
let g:gundo_prefer_python3 = 1
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1

"------------------------------------------------------------
" NERDTree
"-----------------------------------------------------------
"
let g:nerdtree_tabs_open_on_console_startup=1   "run NERDTreeTabs on console vim startup
let g:nerdtree_tabs_autofind=1                  "Automatically find and select currently opened file in NERDTree
"
"Maps for normal mode
nnoremap <C-n> :NERDTreeToggle<CR>        " Map CTPL-n to NERDTree
nnoremap <C-L> :nohl<CR><C-L>       " Map <C-L> (redraw screen) to also turn off search highlighting until the next search

map <Leader>n :tabn<CR>              " n now move forward through the tabs in NREEDTree
map <Leader>m :tabp<CR>              " m now move back through the tabs in NREEDTree
map <Leader>o :tabnew<CR>            " o opens new tab in NREEDTree
map <CR> O<Esc>                " Insert newline without entering insert mode


"-----------------------------------------------------------
" Ctrl - P
"-----------------------------------------------------------
"
set runtimepath^=~/.vim/pack/plugins/start/ctrlp.vim
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*

"-----------------------------------------------------------
" Snipmate
"-----------------------------------------------------------
"
let g:snips_author = 'Herb Leisenfelder'
let g:snipMate =get(g:, 'snipMate', {}) " allow for vimrc re-sourcinge
let g:snipMate.scope_aliases = {}
"
"-----------------------------------------------------------
" Settings for jedi-vim
"-----------------------------------------------------------
"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

let g:jedi#completions_enabled = 0

"-----------------------------------------------------------
" Settings for Python-mode
"-----------------------------------------------------------
"
let g:pymode_rope = 0                          "turns off rope tp use Jedi

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'                      " K  Show python docs

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"

" Auto check on save
let g:pymode_lint_write = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'    "<Leader>bSet, unset breakpoint

let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0

" Don't autofold code
let g:pymode_folding = 0
"
"-----------------------------------------------------------
" Settings for syntastic
"-----------------------------------------------------------
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_shell = "/bin/zsh"

let g:pymode_lint_on_write = 0

"
"-----------------------------------------------------------
" Settings for complete
"-----------------------------------------------------------
"
set complete+=kspell          " checks words from ksept dictionary
set completeopt=menuone,longest
set shortmess+=c               " don't update keyy key bar with selections
