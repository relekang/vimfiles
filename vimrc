set t_Co=256
set cc=100
set encoding=utf-8
set spell
set number
set modeline
set laststatus=2 " always show the status line
syntax enable

set autoindent
set expandtab
set autoread  "Autoreload edited files
set cc=100

filetype plugin indent on

"Load bashrc to !
"set shellcmdflag=-ic

"Search
set hlsearch  "Highlight
set incsearch "Incremental
set ignorecase

" Press Space to dismiss highlighting
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR> 

colorscheme default 

map + <plug>NERDTreeTabsToggle<CR>

" Move up and down in screen lines, not file lines:
nnoremap j gj
nnoremap k gk

" Use hjkl instead
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
