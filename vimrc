if has('nvim')
  call plug#begin('~/.nvim-plugins')
else
  call plug#begin('~/.vim-plugins')
endif

Plug 'NLKNguyen/papercolor-theme'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'w0rp/ale'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'sbdchd/neoformat'

if !has('nvim')
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'HerringtonDarkholme/yats.vim'
Plug 'ncm2/ncm2'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'wokalski/autocomplete-flow'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

Plug 'plasticboy/vim-markdown'
Plug 'reasonml-editor/vim-reason-plus'

call plug#end()


set t_Co=256
set cc=100
set mouse=a
set encoding=utf-8
set cursorline
set modeline
set laststatus=2 " always show the status line
set backspace=indent,eol,start

set tabstop=2
set shiftwidth=2
set expandtab

syntax enable

set autoindent
set autoread  "Autoreload edited files

set splitbelow
set splitright

filetype plugin indent on


" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

set number
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

"Search
set hlsearch  "Highlight
set incsearch "Incremental
set ignorecase

" Press Space to dismiss highlighting
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Makefiles should have tabs
autocmd filetype make setlocal noexpandtab

colorscheme PaperColor

if $VIM_BACKGROUND == "light"
  set background=light
else
  set background=dark
endif

" NERDTree
map + <plug>NERDTreeTabsToggle<CR>


" ctrlp
" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Markdown
let g:vim_markdown_fenced_languages = ['viml=vim', 'bash=sh', 'ini=dosini', 'javascript=js', 'es=jsx', 'python=py']
let g:vim_markdown_folding_disabled = 1

" jsx
let g:jsx_ext_required = 0

let g:ackprg = 'ag --vimgrep --smart-case'

let g:LanguageClient_autoStart = 1


"\ 'reason': ['/Users/rolf/.local/bin/reason-language-server.exe'],
"\ 'reason': ['ocaml-language-server', '--stdio'],

let g:LanguageClient_serverCommands = {
    \ 'reason': ['/Users/rolf/.local/bin/reason-language-server.exe'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ 'python': ['pyls'],
    \ }

nnoremap <silent> <cr> :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> td :call LanguageClient_textDocument_typeDefinition()<CR>
nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>

let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\}
let g:ale_fixers = {
\   'typescript': ['eslint'],
\   'javascript': ['eslint'],
\   'reason': ['refmt'],
\}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1

" Move up and down in screen lines, not file lines:
nnoremap j gj
nnoremap k gk


imap jj <Esc>
cmap jj <Esc>

" Use hjkl instead
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

" Reset cursor on exit
autocmd VimLeave * silent !echo -ne "\033]112\007"

" Change cursor shape between insert and normal mode in iTerm and Hyper
if $TERM_PROGRAM =~ "iTerm" || $TERM_PROGRAM =~ "Hyper"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
