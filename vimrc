call pathogen#infect()

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

filetype plugin indent on

"Load bashrc to !
"set shellcmdflag=-ic

"Search
set hlsearch  "Highlight
set incsearch "Incremental
set ignorecase

" Press Space to dismiss highlighting
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR> 


" Solarized
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Syntastic
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_javascript_checkers = ['jshint']

" NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeIgnore=[ '\.vim$', '\~$', '.*\.egg-info', '.*\.pyc$', '.*\project.db$', '.*\.aux', '.*\.log', '.*\.lof', '.*\.lot', '.*\.toc', '.*\.synctex\.gz' ]
map + <plug>NERDTreeTabsToggle<CR>

" File types
au BufRead,BufNewFile *.pp set ft=puppet
au BufRead,BufNewFile *.py set cc=100
au BufRead,BufNewFile {Rakefile,Gemfile,Vagrantfile,Thorfile,config.ru} set ft=ruby
au BufReadPost,BufNewFile *.coffee setl shiftwidth=2 expandtab
au BufRead,BufNewFile *.tex set tw=79 cc=80 spell wrap lbr
au BufRead,BufNewFile *.tex let g:syntastic_auto_loc_list=0
" au BufWritePost *.tex silent !pdflatex % > /dev/null && open %:r.pdf

" Binds moving of lines to 'Shift + [j/k]'
"nnoremap J :m .+1<CR>==
"nnoremap K :m .-2<CR>==
"vnoremap J :m '>+1<CR>gv=gv
"vnoremap K :m '<-2<CR>gv=gv

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
