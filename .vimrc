set nocompatible              " be iMproved, required
filetype off                  " required

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'		" let Vundle manage Vundle, required

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree' 	    	" Project and file navigation
Plugin 'majutsushi/tagbar'          	" Class/module browser
Plugin 'terryma/vim-multiple-cursors'   " True Sublime Text style multiple selection for Vim
Plugin 'w0rp/ale'                       " Async linting/fixing for Vim and LSP integration
Plugin 'christoomey/vim-tmux-navigator' " Seamless navigation between tmux panes and vim splits

"------------------=== Other ===----------------------
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes' " Lean & mean status/tabline for vim
Plugin 'fisadev/FixedTaskList.vim'  	" Pending tasks list
Plugin 'rosenfeld/conque-term'      	" Consoles as buffers
Plugin 'tpope/vim-surround'	   	" Parentheses, brackets, quotes, XML tags, and more
Plugin 'rafi/awesome-vim-colorschemes'  " Collection of awesome color schemes for Neo/vim, merged for quick use.

"--------------=== Snippets support ===---------------
Plugin 'garbas/vim-snipmate'		" Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
Plugin 'tomtom/tlib_vim'		" dependencies #2
Plugin 'honza/vim-snippets'		" snippets repo

"---------------=== Languages support ===-------------
" --- Python ---
Plugin 'klen/python-mode'	        " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'mitsuhiko/vim-jinja'		" Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim

" --- Elixir ---
Plugin 'elixir-editors/vim-elixir'
Plugin 'slashmili/alchemist.vim'        " Elixir integration Into Vim

call vundle#end()            		" required

set background=dark
colorscheme deus

let mapleader = "\<Space>"

filetype on
filetype plugin on
filetype plugin indent on

nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>s :ConqueTermSplit bash<CR>

let g:pymod_python = 'python3'
set enc=utf-8
set smarttab
set tabstop=8

augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp,elixir highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType ruby,python,javascript,c,cpp,elixir match Excess /\%80v.*/
    autocmd FileType ruby,python,javascript,c,cpp,elixir set nowrap
augroup END

let g:snippets_dir = "~/.vim/vim-snippets/snippets"
set laststatus=2
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" === Hotkeys ===
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0
map <F2> :TaskList<CR>

"=====================================================
" Python-mode settings
"=====================================================
" Auto-complite
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" Docs
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'

" Lint
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"

" Lint after save
let g:pymode_lint_write = 1

" Support Virtualenv
let g:pymode_virtualenv = 0

" set breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'
 
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

let g:pymode_folding = 0

let g:pymode_run = 1

" Disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 0

nnoremap <F5> :ConqueTermSplit ipython<CR>

"=====================================================
" Languages support
"=====================================================
" --- Python ---
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
