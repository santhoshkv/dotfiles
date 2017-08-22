let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
   endif
endif

set laststatus=2

"Load nvim from diff config file
if has('nvim')
    let s:editor_root=expand("~/.nvim")
else
    let s:editor_root=expand("~/.vim")
endif

"Python stuff switch for mac and unix
if has("unix")
    let s:uname = system("uname")
    let g:python_host_prog='/usr/bin/python'
    if s:uname == "Darwin\n"
        let g:python_host_prog='/usr/bin/python'
    endif
endif

" Setting up Vundle - the vim plugin bundler
let vundle_installed=1
let vundle_readme=s:editor_root . '/bundle/vundle/README.md'
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    " silent execute "! mkdir -p ~/." . s:editor_path_name . "/bundle"
    silent call mkdir(s:editor_root . '/bundle', "p")
    silent execute "!git clone https://github.com/gmarik/vundle " . s:editor_root . "/bundle/vundle"
    let vundle_installed=0
endif
" Set/copyfilesfrom default bundle dir from vim to neovim
let &rtp = &rtp . ',' . s:editor_root . '/bundle/vundle/'
call vundle#rc(s:editor_root . '/bundle')

set diffopt+=vertical " Set Gdiff to vertical

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

Plugin 'Lokaltog/powerline-fonts'

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

Plugin 'Syntastic'

Plugin 'majutsushi/tagbar'

Plugin 'pangloss/vim-javascript'

Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'elzr/vim-json' " For json stuff

Plugin 'sickill/vim-monokai'

Plugin 'NLKNguyen/papercolor-theme'

Plugin 'stefandtw/quickfix-reflector.vim'


if vundle_installed == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
    """"""""""""" Vundle stuff """""""""""""""""
    set nocompatible              " be iMproved, required
    filetype off                  " required
endif



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

"""""""""""""""""""""""""  COLOR SETTING """"""""""""""""""""""""""""""""""""
set t_Co=256   " This is may or may not needed.

set background=dark
"colorscheme PaperColor
colorscheme monokai
hi Search cterm=NONE ctermfg=grey ctermbg=125


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

cabbr <expr> ,l expand("/Volumes/epsilon_share/lambda")
cabbr <expr> ,c expand("/Volumes/epsilon_share/calm")
cabbr <expr> ,o expand("/Volumes/epsilon_share/cloud")
cabbr <expr> zz expand(":GundoToggle<CR>")
cabbr <expr> xx expand(":NERDTreeToggle<CR>")
cabbr <expr> bb expand(":CtrlPBuffer<CR>")

nmap <F2> :cn<cr>
nmap <S-F2> :cnfile<cr>
nmap <F1> :cp<cr>
nmap <S-F1> :cpfile<cr>

nmap 1 :cp<cr>
nmap 2 :cn<cr>

nmap <C-m> :cp<cr>
nmap <C-n> :cn<cr>

nnoremap <F8> :TagbarToggle<CR>



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


set ruler				" Turns on ruler
let NERDTreeIgnore = ['\.pyc$','\.js$','\.css$','\.html$']

let g:ctrlp_working_path_mode = 'ra'
"When invoked, unless a starting directory is specified, CtrlP will set its local working directory according to this variable'c' - the directory of the current file. 'r' - the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs 'a' - like c, but only if the current working directory outside of CtrlP is not a direct ancestor of the directory of the current file. 0 or '' (empty string) - disable this feature.

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_max_height = 20

let g:ctrlp_max_files = 500000

let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|installer\|node_modules\|build\|main-NH4\|tmp$',
  \ 'file': '\v\.(exe|so|dll|pyc|css|ttf|jpeg|gif|mustache|png|md|wf)$' }

"""""""""""""" Python Mode


" Python-mode
"  \ 'dir': '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|installer\|node_modules\|/home/epsilon/calm\|/home/epsilon/lambda\|/home/epsilon/cloud\|build\|tmp$',
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

let g:airline#extensions#tabline#enabled = 1  "Turn on tabline buffer on top

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'

autocmd FileType python setlocal completeopt-=preview   " Disable the annoying docstring popup on completion 

"let g:jedi#auto_initialization = 0  " Truns off function definition popup
"http://unlogic.co.uk/2013/02/08/vim-as-a-python-ide/
"
"
" Following settings are for quickfix reflector.vim
" If 1, automatically sets quickfix buffers 'modifiable'. If you prefer to do
" this manually, set the value to 0. Default: 1.
"
let g:qf_modifiable = 1
" If 1, changes within a single buffer will be joined using |:undojoin|,
" allowing them to be undone as a unit. Default: 0.
let g:qf_join_changes = 0
"
"
" If 1, writing the quickfix buffer will also write corresponding files. If 0,
" buffers of corresponding files will be changed but not written, allowing you
" to preview the changes before writing the individual buffers yourself.
" Default: 1

let g:qf_write_changes = 0

function! SetQuickFixEditOptions()
	:let &l:qf_modifiable = 1
	:let &l:qf_join_changes = 1
	:let &l:qf_write_changes = 1
	echom "Quickfix list is now editable and writeable"
endfunction

function! UnSetQuickFixEditOptions()
	:let &l:qf_modifiable = 0
	:let &l:qf_join_changes = 0
	:let &l:qf_write_changes = 0
	echom "Quickfix list changed to NOT eitable"
endfunction

nnoremap <leader>eq :call SetQuickFixEditOptions()
nnoremap <leader>neq :call UnSetQuickFixEditOptions()

" Ctr-p settings
nnoremap <F10> :CtrlP /home/epsilon<cr>

let g:airline_theme = 'airlineish'

" Map <leader>l to close localtion list
nnoremap <leader>l :lclose<cr>
nnoremap <C-w><C-w> : lclose<cr> <C-w>w


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

autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype js setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype json setlocal ts=2 sts=2 sw=2 expandtab
highlight SpecialKey ctermfg=1
set list
set listchars=tab:T>
set mouse=a
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2
vmap <C-c> "+y
set statusline+=col:\ %c, " col line goodness
set smartcase  " case sensitive search only when searching for uppercases

"autocmd FileType yaml call SetYamlOptions()
"
"function SetYamlOptions()
"		setlocal ai ts=2 sw=2 et
"			set foldmethod=indent
"		endfunction
"" vimgrep /path_to_command/gj ./**/*.rb 
