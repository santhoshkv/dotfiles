if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
   endif
endif

set laststatus=2

set diffopt+=vertical " Set Gdiff to vertical

""""""""""""" Vundle stuff """""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required


" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


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

Plugin 'paranoida/vim-airlineish' "vim airline theme 

Plugin 'tpope/vim-fugitive'

Plugin 'The-NERD-tree'

Plugin 'airblade/vim-gitgutter'

Bundle 'klen/python-mode'

Plugin 'ctrlp.vim'

Bundle 'git://github.com/davidhalter/jedi-vim'

Plugin 'xuhdev/SingleCompile'

Plugin 'duff/vim-scratch'

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

set incsearch				" Turns on incremental search
set hlsearch				" Turns on search highlighting 
set history=1000			" Limit for command history
set autoread				" Turns on autoreload for files
set number				" Turns on line numbers
set showmatch				" Show matching paranthesis
set incsearch				" Turns on incremental search
set hidden				" Hides buffers instead of closing them preventing unsaved changes form dissapearino
"set autochdir				" Changes current working dir to current location of file
"set scrolloff=999       " Magic srolling center thingy
set nobackup		" No backup 
set noswapfile



" resize current buffer by +/- 5 
nnoremap <S-left> :vertical resize -5<cr>
nnoremap <S-down> :resize -5<cr>
nnoremap <S-up> :resize +5<cr>
nnoremap <S-right> :vertical resize +5<cr>

cabbr <expr> ,, expand("/Volumes/epsilon/lambda")
cabbr <expr> zz expand(":GundoToggle<CR>")
cabbr <expr> xx expand(":NERDTreeToggle<CR>")
cabbr <expr> bb expand(":CtrlPBuffer<CR>")

nmap <F9> :SCCompile<cr>		" Map F9 and F10 for C++ simplecompile
nmap <F10> :SCCompileRun<cr>
nmap <F2> :cn<cr>
nmap <S-F2> :cnfile<cr>
nmap <F1> :cp<cr>
nmap <S-F1> :cpfile<cr>

"Maps ,(l)cd to change pwd to current file dir and prints it
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
nnoremap ,lcd :lcd %:p:h<CR>:pwd<CR>


autocmd BufWritePre *.py normal m`:%s/\s\+$//e``
"Removed traling whitespaces from the ends of lines

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

let NERDTreeIgnore = ['\.pyc$','\.js$','\.css$','\.html$']

let g:ctrlp_working_path_mode = 'ra'
"When invoked, unless a starting directory is specified, CtrlP will set its local working directory according to this variable'c' - the directory of the current file. 'r' - the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs 'a' - like c, but only if the current working directory outside of CtrlP is not a direct ancestor of the directory of the current file. 0 or '' (empty string) - disable this feature.

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_max_height = 20

let g:ctrlp_max_files = 500000

let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|installer\|tmp$',
  \ 'file': '\v\.(exe|so|dll|js|pyc|css|html|ttf|jpeg|gif|mustache|png|md|wf)$' }

"""""""""""""" Python Mode


" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save


" Auto check on fly
let g:pymode_lint_on_fly = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Remap 'insert ped breakpoint' from <leader>b to <leader>pdb 

let g:pymode_breakpoint_bind = '<leader>pdb'

let g:pymode_rope = 0  " Turn of rope for jedi... Awesomeness 

let g:airline_powerline_fonts = 1

unlet g:airline#extensions#tabline#enabled 
let g:airline#extensions#tabline#enabled = 1  "Turn on tabline buffer on top

unlet g:airline#extensions#tabline#left_sep
let g:airline#extensions#tabline#left_sep = ' '
unlet g:airline#extensions#tabline#left_alt_sep
let g:airline#extensions#tabline#left_alt_sep = '>'

autocmd FileType python setlocal completeopt-=preview   " Disable the annoying docstring popup on completion 

"let g:jedi#auto_initialization = 0  " Truns off function definition popup
"http://unlogic.co.uk/2013/02/08/vim-as-a-python-ide/


" Ctr-p settings
nnoremap <F11> :CtrlP /Volumes/epsilon/lambda<cr>

let g:airline_theme = 'airlineish'


augroup NO_CURSOR_MOVE_ON_FOCUS
  au!
  au FocusLost * let g:oldmouse=&mouse | set mouse=
  au FocusGained * if exists('g:oldmouse') | let &mouse=g:oldmouse | unlet g:oldmouse | endif
augroup END


" Powerline settings
set guifont=Source\ Code\ Pro\ for\ Powerline:h12
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8


