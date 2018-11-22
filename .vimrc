set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Let Vundle manage Vundle
Bundle 'VundleVim/Vundle.vim'

" My Bundles

Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Bundle 'davidhalter/jedi-vim'
Bundle 'vim-scripts/Rename'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'scrooloose/nerdcommenter'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'python-mode/python-mode'
Bundle 'jceb/vim-orgmode'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'

call vundle#end()
filetype plugin indent on

"General Vim Settings
set expandtab
set shiftwidth=4
set tabstop=4
set number
set expandtab
set nowritebackup
set noswapfile
set nobackup
set mouse=a
set ruler
set shortmess=I
set autoindent
set incsearch
map <F5> :setlocal spell! spelllang=en_us<CR>
set nofoldenable
"set relativenumber

" NERDTree Settings
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

"Solarized Settings
syntax enable
set background=dark
set t_Co=16
let g:solarized_termtrans = 1 
colorscheme solarized
"let g:solarized_termcolors=256

"Airline Settings
set laststatus=2
set noshowmode
set guifont=Menlo\ for\ Powerline:h12
let g:airline_poweline_fonts = 1
let g:airline_enable_branch = 0
let g:airline_section_b = '%f%m'
let g:airline_sectionc = ''

" Syntactic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
map <C-u> :SyntasticToggleMode<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']

" python-mode settings
let g:pymode_rope_lookup_project = 0
let g:pymode_lint = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport = 0

" vim-orgmode settings
let g:org_heading_shade_leading_stars = 1

" utilsnippets

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>" 

