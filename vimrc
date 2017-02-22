" Call plugins
call plug#begin('~/.vim/plugged')

" solarized color scheme
Plug 'crusoexia/vim-monokai'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

" first some settings copied from Debian config
set nocompatible                        " no compatibility with old-skool vi
set backspace=indent,eol,start          " define behavior of backspace key
set history=500                         " keep the last 500 commands (was 50 in Debian config)

" and some other default options, just to be sure
set encoding=utf-8                      " by default set the encoding to UTF-8

" then my own
set nowrap                              " disable wrapping of text
set number                              " show line numbers by default

colorscheme monokai
set t_Co=256                            " force the terminal to use 256 colors
set termguicolors                       " use fancy background colors
try
    let g:monokai_term_italic = 1           " use italic font where possible
endtry

set showcmd                             " show the current command in the statusline
set foldlevelstart=99                   " by default, open all folds
set foldmethod=indent                   " indent fold method by default
set mouse=a                             " enable the mouse
set mousemodel=popup                    " produce pop up for right click
set list                                " show special chars, such as tab and eol
set listchars=tab:→\ ,eol:·,trail:☐,extends:❱,precedes:❰ " chars to show for list
set laststatus=2                        " always show the statusline
set title                               " set the title
set ruler                               " show cursor position in left bottom corner
set splitbelow                          " open a new horizontal window below the current window instead of above
set scrolloff=3                         " minimal number of screen lines to keep above and below the cursor.
set sidescrolloff=3                     " minimal number of screen columns to keep next to the cursor
set sidescroll=5                        " horizontally scroll 5 characters, instead of centering the cursor
set wildmenu                            " show command line completions
set wildmode=longest:full               " complete mode for wildmenu
set wildmode+=full                      " when pressing tab a second time, fully complete
set wildignorecase                      " ignore case when completing filenames
set linebreak                           " only wrap after words, not inside words
set cursorline                          " highlight the current line
set cursorcolumn                        " highlight the current column
set completeopt=menu,longest,preview    " options for insert mode completion
" set spell                               " enable spell check by default

set tabstop=4                           " number of spaces that a tab counts for
set shiftwidth=4                        " number of spaces to use for each step of indent
set softtabstop=4                       " number of spaces that a tab counts for while editing
set shiftround                          " round the indent to a multiple of shiftwidth
set expandtab                           " expand tabs to spaces
set autoindent                          " automatically indent a new line
set formatoptions+=r                    " automatic formatting: auto insert current comment leader after enter
set virtualedit=block,onemore           " allow cursor after end of line in visual block mode and allow cursor one char after line end
set display=lastline                    " display wrapped lines at bottom instead of @ symbols

if v:version > '702'
    set colorcolumn=80,120              " show a vertical line at these positions
    let &colorcolumn=join(range(121,999),",")
endif

set diffopt+=iwhite                     " diff options: ignore whitespace

set incsearch                           " while searching, immediately show first match
set ignorecase                          " ignore case in (search) patterns
set smartcase                           " when the (search) pattern contains uppercase chars, don't ignore case
set hlsearch                            " highlight all the matches for the search (disable until next search with :noh)

set directory=~/.vimswaps,.,/tmp        " where to store the swap files
set noswapfile                          " disable swap files, most of the time they are just annoying
set nobackup                            " don't make a (permanent) backup when saving files
set nowritebackup                       " don't make a (temporary) backup while saving files
if v:version > '702'
    set undofile                        " save undo history to an external file
    set undodir=~/.vimundo,.,/tmp       " where to save undo history files
    set relativenumber                  " use relative line numbering
    set nonumber                        " and disable default line numbering
endif
set updatetime=500                      " wait this many milliseconds before firing the CursorHold autocmd (and write swap files)

set autoread                            " automatically reload the file when modified outside and not modified inside vim
set autowrite                           " write the modified file when switching to another file
set hidden                              " allow Vim to switch to another buffer while the current is not saved

set tags=tags;/                         " where to find the tags file: current directory and up

if exists('+autochdir')
  set autochdir                         " automatically change to the current directory when loading a file
endif

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize GVim window.
  set lines=37 columns=135
  " remove the menu bar
  set guioptions-=m
  " and remove the toolbar
  set guioptions-=T
  " and enable the horizontal scrollbar
  "set guioptions+=b
  " and remove the vertical scrollbar
  set guioptions-=r
  " no left scrollbar
  set guioptions-=L
  " use console style dialogs
  set guioptions+=c
  " but always show the tabline (window otherwise resizes when first showing tabline)
  set showtabline=2

endif


" enable filetype detection and indentation specific for filetype
syntax on
filetype plugin indent on

" Key mappings {{{
noremap <Esc><Esc> :nohlsearch<CR> " Double Escape un-highlights search marks
inoremap jj <Esc> " map jj in insert mode to ESC, saves from reaching for Esc itself
" }}}

" Settings for lightline {{{
function! FileSize()
  let bytes = getfsize(expand("%:p"))
  if bytes <= 0
    return ""
  endif
  if bytes < 1024
    return bytes . "b"
  else
    return (bytes / 1024) . "k"
  endif
endfunction

let g:lightline = {
    \ 'active'       : {
    \   'left' : [ [ 'mode', 'paste' ],
    \              [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
    \   'right' : [ [ 'lineinfo' ],
    \               [ 'percent' ],
    \               [ 'fileformat', 'fileencoding', 'filetype' ] ] },
    \ 'colorscheme'  : 'wombat',
    \ 'separator'    : { 'left': '', 'right': '' },
    \ 'subseparator' : { 'left': '', 'right': '' },
    \ 'component'    : {
    \   'fugitive' : '%{exists("*fugitive#head")?fugitive#head():""}',
    \ },
    \ 'component_visible_condition': {
    \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
    \ },
    \ }
set noshowmode " Remove superfluous mode indicator
" }}}

" Settings for NERDTree
map <C-n> :NERDTreeToggle<CR> " Toggle NERDTree
" }}}

" vim: fdm=marker fdl=0
