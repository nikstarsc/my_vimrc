" Right now default leader key is \ key
" ------------------Plugin Manager----------------------
set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Download plug-ins to the ~/.vim/plugged/ directory
call vundle#begin('~/.vim/plugged')

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Plugin for syntax highlighting
Plugin 'sheerun/vim-polyglot'

" color schemes. For more color schemes go to
" https://github.com/rafi/awesome-vim-colorschemes
Plugin 'cocopon/iceberg.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'Badacadabra/vim-archery'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'scheakur/vim-scheakur'

" Plugin for automatic pair completion
Plugin 'jiangmiao/auto-pairs'

" Plugin for file system explorer
Plugin 'preservim/nerdtree'

" Plugin of Nerdterr showing git status
Plugin 'xuyuanp/nerdtree-git-plugin'

" The tagbar plugin provides a way to browse the tags of
" the currently opened file.
Plugin 'preservim/tagbar'

" CtrlFS is a powerful plug-in that searches for files on
" the file system asynchronously.
Plugin 'dyng/ctrlsf.vim'

"  FSwitch and provides functionality for quickly switching
"  between a header and implementation file.
Plugin 'derekwyatt/vim-fswitch'

"  vim-protodef plug-in can pull in function prototypes from a
"  C++ header (.h) file into a corresponding implementation (.cpp) file.
Plugin 'derekwyatt/vim-protodef'

" vim-move plugin for moving line/lines horizontally and vertially
" Usage <A-h>, <A-j>, <A-k>, <A-l> for left, down, up, right. A stands for Alt
" key
Plugin 'matze/vim-move'

" indentline Plugin is used for displaying thin vertical lines at each
" indentation level for code indented with spaces.
Plugin 'Yggdroot/indentLine'

" vim plugin for Git.
Plugin 'tpope/vim-fugitive'

" Surround plugin is all about surroundings: parentheses, brackets, quotes,
" XML tags and more.
Plugin 'tpope/vim-surround'

" Syntastic is a syntax checking plugin for Vim.
Plugin 'scrooloose/syntastic'

" vim-gitgutter plugin shows a git diff in the sign column. It shows which
" line have been added, modified, or removed.
Plugin 'airblade/vim-gitgutter'

" Highlights trailing whitespace in red and provides: FixWhitespace to fix it.
Plugin 'bronson/vim-trailing-whitespace'

" ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax checking and semantic errors)
Plugin 'w0rp/ale'

call vundle#end()
filetype plugin indent on

" ------------------Various Settings---------------------

set nu 			" Enable line numbers
syntax on		" Enable

set lcs+=space:·    " Show whitespaces as .
set list

" How many columns of whitespace a \t is worth
" set tabstop=4

" How many columns of whitespace a 'level of indentation' is worth
" set shoftwidth=4

" Use spaces when tabbing
set expandtab

" Enable incremantal search
set incsearch

" Enable highlight search
set hlsearch

" Set terminal size
set termwinsize=12x0

" Always split below
set splitbelow

" Enable mouse drag on window splits
set mouse=a

" Enable dark or light background
set background=dark

" Enable your favourite colorscheme
colorscheme slate

" Enable relative number
set relativenumber

" ----------------Powerline Settings--------------------
set laststatus=2           " Always display the status bar
" set powerline_cmd="py3"    " Tell powerline to use Python 3
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" ----------------Custom Keybindings--------------------
" Toggle autopair plugin functionality
let g:AutoPairsShortcutToggle = '<C-P>'
" ~~~~~~~~~~~~~~
" KeyBindings for nerdtree plugin commands
let NERDTreeShowBookmarks = 1   " Show the bookmarks table
let NERDTreeShowHidden = 1      " Show hidden files
let NERDTreeShowLineNumbers = 0 " Hide line numbers
let NERDTreeMinimalMenu = 1     " Use the minimal menu (m)
let NERDTreeWinPos = 'left'     " Panel opens on the left side
let NERDTreeWinSize = 31        " Set panel width to 31 columns
" Nerd Tree Toggle using <F2> function key.
nmap <F2> :NERDTreeToggle<CR>
" ~~~~~~~~~~~~~~
" Overriding tagbar plugin settings
let g:tagbar_autofocus = 1      " Focus the panel when opening it
let g:tagbar_autoshowtag = 1    " Highlight the active tag
let g:tagbar_position = 'botright vertical' " Make panel vertical and place on the right
" Mapping to open and close the panel using <F8> key
nmap <F8> :TagbarToggle<CR>
" ~~~~~~~~~~~~~~
" Twikings for CtrlFS plugin
" Use the ack tool as the backend
let g:ctrlsf_backend = 'ack'
" Auto close the results panel when opening a file
let g:ctrlsf_auto_close = { "normal":0, "compact":0 }
" Immediately switch focus to the search window
let g:ctrlsf_auto_focus = { "at":"start" }
" Don't open the preview window automatically
let g:ctrlsf_auto_preview = 0
" Use the smart case sensitivity search scheme
let g:ctrlsf_case_sensitive = 'smart'
" Normal mode, not compact mode
let g:ctrlsf_default_view = 'normal'
" Use absoulte search by default
let g:ctrlsf_regex_pattern = 0
" Position of the search window
let g:ctrlsf_position = 'right'
" Width or height of search window
let g:ctrlsf_winsize = '46'
" Search from the current working directory
let g:ctrlsf_default_root = 'cwd'
" (Ctrl+F) Open search prompt (Normal Mode)
nmap <C-F>f <Plug>CtrlSFPrompt
" (Ctrl-F + f) Open search prompt with selection (Visual Mode)
xmap <C-F>f <Plug>CtrlSFVwordPath
" (Ctrl-F + F) Perform search with selection (Visual Mode)
xmap <C-F>F <Plug>CtrlSFVwordExec
" (Ctrl-F + n) Open search prompt with current word (Normal Mode)
nmap <C-F>n <Plug>CtrlSFCwordPath
" (Ctrl-F + o )Open CtrlSF window (Normal Mode)
nnoremap <C-F>o :CtrlSFOpen<CR>
" (Ctrl-F + t) Toggle CtrlSF window (Normal Mode)
nnoremap <C-F>t :CtrlSFToggle<CR>
" (Ctrl-F + t) Toggle CtrlSF window (Insert Mode)
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
" ~~~~~~~~~~~~~~
" Twikings for FSwitch plugin
" These lines specify that:
" When the loaded buffer is a .cpp file, the companion is of type hpp or h.
" When the loaded buffer is a .h file, the companion is of type cpp or c.
au! BufEnter *.cpp let b:fswitchdst = 'hpp,h'
au! BufEnter *.h let b:fswitchdst = 'cpp,c'
" mapping that splits the active window vertically and loads
" the companion file on the right side of the split.
nmap <C-Z> :vsplit <bar> :wincmd l <bar> :FSRight<CR>
" ~~~~~~~~~~~~~~
" Twikings for vim-protodef plugin
" Pull in prototypes example (\ + PP)
nmap <buffer> <silent> <leader> ,PP
" Pull in prototypes without namespace definition, example (\ + PN)
nmap <buffer> <silent> <leader> ,PN
" ~~~~~~~~~~~~~~
