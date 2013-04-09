" start of my options
set nocompatible
set modelines=0

" tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" extra random for sanity
set encoding=utf-8
set scrolloff=3
"set scrolloff=999
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set wildignore+=*.o,*.obj,.git,*.pyc
"set wildmode=longest:full
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set hlsearch
set splitright
set winheight=999
set winminheight=0
"set paste
"set relativenumber
"set undofile

" reset leader to ,
let mapleader = ","

" sane search/move
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
"set noshowmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" line handling
set wrap
set textwidth=79
set formatoptions=qrn1
"set colorcolumn=85

" Textmate friendly special chars
set list
set listchars=tab:▸\ ,eol:¬,trail:!,precedes:~,extends:~,nbsp:_

" I hate you help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" I hate you fat finger
nnoremap ; :

" Save on lose focus for ui
au FocusLost * :wa
autocmd BufLeave,FocusLost silent! wall
" Save auto when changing buff
:set autowrite

" :help oneoftheseoptions for more info.

" I don't like seeing .filename.swp files everywhere.
set backupdir=~/.vim/backup
set directory=~/.vim/swap

" Ctrl + hjkl moves to the window in that direction.
" map <C-j> <C-W>j<C-W>_
" map <C-k> <C-W>k<C-W>_
" map <C-h> <C-W>h<C-W>_
" map <C-l> <C-W>l<C-W>_
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" So does just pressing an arrow key.
map <Up> <C-W>k<C-W>_
map <Down> <C-W>j<C-W>_
map <Left> <C-W>h<C-W>_
map <Right> <C-W>l<C-W>_

" But not in insert mode.
imap <Up> <Nop>
imap <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>

" Shift left and right will push a window to that side.
" Good for maintaining two-column views.
map <S-Left> <C-W>H<C-W>_
map <S-Right> <C-W>L<C-W>_

" make j and k move up and down one visual line, not one text line
map j gj
map k gk

" LAAAAAZY remapping esc to jj
inoremap jj <ESC>

" kill highlights when I jump to insert mode. press n to see them again.
nnoremap i :noh<CR>i

" Custom file search function wildfind
nnoremap <Leader>w :setlocal buftype=nofile<CR>:%!wildfind<Space>

" \d will find the <<< === >>> boundaries in a conflict.
nnoremap <Leader>d /^<<<\\|^===\\|^>>><CR>

" \f will open the file under the cursor in a right-split.
nnoremap <Leader>f :vertical wincmd f<CR>

" F5 will just run the current script, assuming it's executable.
nnoremap <F5> :!clear; ./%<CR>

syntax on
set t_Co=256
colorscheme vividchalk

" now! is replaced with the current date, a newline, and a tab.
iab <expr> now! strftime("%A, %d %B %Y %I:%M%p\n\t")

" Adding support for https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" Run nerdtree if no files are passed
autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeIgnore = ['\.pyc$']

" Yankring mappings
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

" TagBar Toggle remap
" This guy causes vim to exit 1 with a git commit
" This command in git global fixes the issue
" git config --global core.editor /usr/bin/vim
nnoremap <silent> <Leader>b :TagbarToggle<CR>

nnoremap <silent> <Leader>f :NERDTreeFind<CR>
nnoremap <silent> <Leader>tt :NERDTreeToggle<CR>

" Magic for python related vimrc stuff
if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vimrc.python
endif
