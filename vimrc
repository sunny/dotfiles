" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Moving around, tabs and buffers

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin on
set nocompatible                                              " Makes vim behave in a more useful way than vi
set number                                                    " Line numbers
set ttyfast                                                   " Improve drawing
set lazyredraw                                                " Do not redraw while running macros
set autoread                                                  " Set to auto read when a file is changed from the outside
set bs=2                                                      " Fix backspace issues
set t_Co=256                                                  " Specifies that the terminal can support 256 colors

" Memory
set history=1000
set undolevels=1000
set maxmem=2000000
set maxmemtot=2000000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Scrolling
set scrolloff=3
set scrolljump=3

" Wild menu
set wildmenu
set wildmode=list:longest,full

" Visual options
set ruler                                                     " Show line cursor info
set cursorline
set cmdheight=1                                               " Command bar height
set linebreak
"
" For at least vim >= 7.4.338
if v:version > 704 || v:version == 704 && has('patch338')
  set breakindent
endif

" Set backspace configuration
set ww=b,s,<,>
set backspace=indent,eol,start
set tabstop=2 shiftwidth=2 expandtab

set hlsearch                                                  " Highlight search words
set ignorecase                                                " Ignore search case
set magic                                                     " For regular expressions
set showmatch                                                 " Show matching braces when text indicator is over them

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

set grepprg=git\ grep\ -n\ $*

" Character to precede line wraps
" Using let instead of set to be able to use quotes
let &showbreak='âª '

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on                                                     " Syntax coloration
set ffs=unix,dos,mac                                          " Set folding format to prevent from bad carriage return

if has("multi_byte")
  set encoding=utf-8
  setglobal fileencoding=utf-8
else
  echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Indentation
set autoindent                                                " Auto indent
set smartindent                                               " Smart indent

" Tabs
set softtabstop=2                                             " Tab width
set tabstop=2                                                 " Tab width
set shiftwidth=2                                              " Indent width
set expandtab                                                 " Use whitespace instead of tab

" Columns
set tw=80
set formatoptions+=t

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Switch to the next buffer
nmap <Tab> :bn<Enter>
" Switch to the previous buffer
nmap <S-Tab> :bp<Enter>
