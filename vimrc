call pathogen#infect()

set t_Co=256
set cc=100
set encoding=utf-8
set number
set laststatus=2 " always show the status line
syntax enable

set autoindent
set expandtab
set autoread  "Autoreload edited files

filetype plugin on

"Load bashrc to !
set shellcmdflag=-ic

"Search
set hlsearch  "Highlight
set incsearch "Incremental
set ignorecase
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR> " Press Space to dismiss highlighting


"Solarized
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

"Syntastic
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_javascript_jslint_conf=""

"NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeIgnore=['\.vim$', '\~$', '.*\.egg-info', '.*\.pyc$', '.*\project.db$']

au vimenter,BufRead,BufNewFile *.pp              set filetype=puppet

" Binds moving of lines to 'Shift + [j/k]'
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Move up and down in screen lines, not file lines:
nnoremap j gj
nnoremap k gk
