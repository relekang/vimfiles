"
" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'reedes/vim-thematic'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'itspriddle/vim-marked'
Plugin 'flowtype/vim-flow'

Plugin 'scwood/vim-hybrid'
Plugin 'jscappini/material.vim'

call vundle#end()
filetype plugin indent on

set t_Co=256
set cc=100
set encoding=utf-8
set number
set cursorline
set modeline
set laststatus=2 " always show the status line
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2

syntax enable

set autoindent
set expandtab
set autoread  "Autoreload edited files
set cc=100

set splitbelow
set splitright

filetype plugin indent on

" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

"Search
set hlsearch  "Highlight
set incsearch "Incremental
set ignorecase

" Press Space to dismiss highlighting
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

set background=dark
colorscheme hybrid

" NERDTree
map + <plug>NERDTreeTabsToggle<CR>

" ctrlp
" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['eslint']

" Markdown
let g:vim_markdown_fenced_languages = ['viml=vim', 'bash=sh', 'ini=dosini', 'javascript=js', 'es=jsx', 'python=py']
let g:vim_markdown_folding_disabled = 1

" jsx
let g:jsx_ext_required = 0

" Move up and down in screen lines, not file lines:
nnoremap j gj
nnoremap k gk


imap jj <Esc>
cmap jj <Esc>

" Use hjkl instead
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Reset cursor on exit
autocmd VimLeave * silent !echo -ne "\033]112\007"

" Change cursor shape between insert and normal mode in iTerm and Hyper
if $TERM_PROGRAM =~ "iTerm" || $TERM_PROGRAM =~ "Hyper"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
