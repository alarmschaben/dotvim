
" first some settings copied from Debian config
set nocompatible                        " no compatibility with old-skool vi
set backspace=indent,eol,start          " define behavior of backspace key
set history=500                         " keep the last 500 commands (was 50 in Debian config)

" and some other default options, just to be sure
set encoding=utf-8                      " by default set the encoding to UTF-8

" then my own
set nowrap                              " disable wrapping of text
set number                              " show line numbers by default
set t_Co=256                            " force the terminal to use 256 colors
set showcmd                             " show the current command in the statusline
set foldlevelstart=99                   " by default, open all folds
set foldmethod=indent                   " indent fold method by default
