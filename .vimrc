" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'airblade/vim-gitgutter'
Plugin 'ajmwagar/vim-deus'
Plugin 'ayu-theme/ayu-vim'
Plugin 'dense-analysis/ale'
Plugin 'ervandew/supertab'
Plugin 'fatih/vim-go'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'powerline/powerline'
Plugin 'tpope/vim-fugitive'

call vundle#end()

let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1

let g:ale_fixers = ['rustfmt']
let g:ale_linters = {'rust': ['rls']}
nnoremap <C-n> :ALENextWrap<CR>
nnoremap <C-j> :ALEGoToDefinition<CR>

" Remap ctrl-p to start FZF
let g:fzf_command_prefix = 'Fzf'
nnoremap <C-p> :FzfFiles<CR>
nnoremap <C-g> :FzfRg<CR>

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Encoding
set encoding=utf-8

" Whitespace
set nowrap
set textwidth=79
set formatoptions=qrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
" set t_Co=256

" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
" set t_Co=256
" set background=dark
" colorscheme deus

set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
silent! colorscheme ayu

" Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePost * GitGutter

" Powerline
set rtp+=/home/wojtek/.local/lib/python3.8/site-packages/powerline/bindings/vim/
set laststatus=2
