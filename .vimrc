
set incsearch				" Turns on incremental search
set hlsearch				" Turns on search highlighting 
set history=1000			" Limit for command history
set autoread				" Turns on autoreload for files
set number				" Turns on line numbers
set showmatch				" Show matching paranthesis
set incsearch				" Turns on incremental search
set hidden				" Hides buffers instead of closing them preventing unsaved changes form dissapearino
"set autochdir				" Changes current working dir to current location of file


cabbr <expr> ,, expand("/Volumes/epsilon/lambda")
cabbr <expr> zz expand(":GundoToggle<CR>")
cabbr <expr> xx expand(":NERDTreeToggle<CR>")

"showcmd
"When you set showcmd in your vimrc, the bottom line in your editor will show you information about the current command going on. The part I like is that if you’re selecting things in visual mode it will show you the number of lines selected, or, if you’re doing it 2d-style with CTRL-V, it will show XxY for the block you’re selecting.
set showcmd
set wildmenu

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" solarized settings
syntax enable
set background=dark 			" Colour scheme
colorscheme solarized
set ruler				" Turns on ruler

let NERDTreeIgnore = ['*.pyc']

"""""Powerline settings

"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2

""""""""""""" Vundle stuff """""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'Gundo'

Plugin 'solarized'

"Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

Plugin 'bling/vim-airline'

Plugin 'tpope/vim-fugitive'

Plugin 'The-NERD-tree'

"" The following are examples of different formats supported.
"" Keep Plugin commands between vundle#begin/end.
"" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
"" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line






""""" Syntastic stuff
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_checker_args='--ignore=E501,E225'
let g:syntastic_check_on_open = 1



""http://sontek.net/blog/detail/turning-vim-into-a-modern-python-ide
