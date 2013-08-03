call pathogen#infect()

set t_Co=256
set cc=100
set number
syntax enable

set autoindent
set expandtab

filetype plugin on

"Load bashrc to !
set shellcmdflag=-ic

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
