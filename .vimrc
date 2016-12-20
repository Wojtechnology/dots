set shell=bash " fish
" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'elixir-lang/vim-elixir'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'fatih/vim-go'
Plugin 'lervag/vimtex'
Plugin 'LaTeX-Box-Team/LaTeX-Box'

call vundle#end()
filetype plugin indent on

" Fugitive to status bar
set statusline=%f\ %{fugitive#statusline()}
let g:ycm_autoclose_preview_window_after_completion = 1

" ignore node modules, venv
let g:ctrlp_custom_ignore = 'node_modules\|venv'

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" leader key
let mapleader = " "

" Security
set modelines=0

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set formatoptions=tcqrn1
set tabstop=8
set shiftwidth=2
set softtabstop=0
set expandtab
set smarttab
set noshiftround

" Line numbering
set relativenumber
set number

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
set cc=100
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Remove extra whitespace before saving
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
      let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Color scheme (terminal)
" set background=dark
colorscheme dracula
" colorscheme solarized

set cursorline
