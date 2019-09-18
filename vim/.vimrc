" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
"
" " Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-syntastic/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'Raimondi/delimitMate'
Plug 'nathanaelkane/vim-indent-guides'


"
"YCM 
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

"NERDTree
map <C-n> :NERDTreeToggle<CR>
"let NERDTreeMapOpenInTab='\r'
:set guioptions-=L 
"NERDTreeTab
""map <Leader>n <plug>NERDTreeTabsToggle<CR>

"syntastic "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_scala_checkers = ['fsc']
let g:ycm_global_ycm_extra_conf = '/Users/Wooi/.ycm_extra_conf.py'
let g:syntastic_mode_map = { "mode": "active",
                           \ "active_filetypes": [],}

"YouCompleter
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu
let g:ycm_path_to_python_interpreter='/usr/bin/python'
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_complete_in_strings = 1
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:autopep8_disable_show_diff=1
nmap <F3> :call Autopep8()<CR>

map <c-u> :Ack<space>
let g:ackprg = 'ag --nogroup --column'
" MOLOKAI COLOR "
let g:molokai_original = 0

"IndentLine "
let g:indentLine_setColors = 0
" " List ends here. Plugins become visible to Vim after this call.
call plug#end()

" VIM "

" Set compatibility to Vim only.
set nocompatible
set foldcolumn=3

"syntax on"
syntax on 

"Colorsheme"
colorscheme gruvbox
let g:gruvbox_termcolors=16
set background=dark

" lignes "
set number

" indentation intelligente"
"set smartindent"
set cursorcolumn
set cursorline

"indentation lignes"
:set list

" sourie "
set mouse-=a

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
