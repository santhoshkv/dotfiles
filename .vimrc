" #################  ENV settings ################
"
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

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

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
   endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"#########################################################
"##################  Vimplug settings ###################
"#########################################################

" Check and install vimplug
 if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')

Plug 'sickill/vim-monokai'

Plug 'vim-scripts/Gundo'

Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdtree'

Plug 'airblade/vim-gitgutter'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'vim-python/python-syntax'

Plug 'vim-scripts/indentpython.vim'

Plug 'w0rp/ale'

call plug#end()


"#########################################################
"##################  Personal settings ###################
"#########################################################
"
" vimgrep /path_to_command/gj ./**/*.rb 
"
"
"#################### color settings
"
syntax enable
set t_Co=256   " This is may or may not needed.
set background=dark
colorscheme monokai
hi Search cterm=NONE ctermfg=grey ctermbg=125
"hi Normal ctermbg=grey ctermfg=Black guifg=Black guibg=grey


nnoremap <F10> :CtrlP /home/epsilon<cr>
nnoremap <F11> :CtrlP /home/epsilon/policy-engine<cr>

" Map <leader>l to close localtion list
nnoremap <leader>l :lclose<cr>
nnoremap <C-w><C-w> : lclose<cr> <C-w>w


" Some things from https://gist.github.com/millermedeiros/1262085

" --- performance / buffer ---
set hidden                  " can put buffer to the background without writing
set lazyredraw              " don't update the display while executing macros
set ttyfast                 " Send more characters at a given time.
" --- history / file handling ---
set history=999             " Increase history (default = 20)
set undolevels=999          " Moar undo (default=100)
" --- backup and swap files ---
" annoying and unnecessary...
set nobackup
set nowritebackup
set noswapfile
set completeopt=longest,menuone
let g:airline_solarized_bg='dark'
let g:airline_theme='base16'


cabbr <expr> ,l expand("/Volumes/epsilon_share/lambda")
cabbr <expr> ,c expand("/Volumes/epsilon_share/calm")
cabbr <expr> ,o expand("/Volumes/epsilon_share/cloud")
cabbr <expr> zz expand(":GundoToggle<CR>")
cabbr <expr> xx expand(":NERDTreeToggle<CR>")
cabbr <expr> bb expand(":CtrlPBuffer<CR>")
nmap 1 :cp<cr>
nmap 2 :cn<cr>
nmap <C-m> :cp<cr>
nmap <C-n> :cn<cr>
nnoremap <F8> :TagbarToggle<CR>

"Maps ,(l)cd to change pwd to current file dir and prints it
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
nnoremap ,lcd :lcd %:p:h<CR>:pwd<CR>


"Removed traling whitespaces from the ends of lines
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``

"showcmd
"When you set showcmd in your vimrc, the bottom line in your editor will show you information about the current command going on. The part I like is that if you’re selecting things in visual mode it will show you the number of lines selected, or, if you’re doing it 2d-style with CTRL-V, it will show XxY for the block you’re selecting.
set showcmd
set wildmenu

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif


set nocompatible
set laststatus=2
set diffopt+=vertical " Set Gdiff to vertical

set mouse=a
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2
vmap <C-c> "+y
set list
set listchars=tab:T>
set smartcase  " case sensitive search only when searching for uppercases
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
set incsearch "Turns on incremental search
set hlsearch "Turns on search highlighting 
set history=1000 " Limit for command history
set autoread " Turns on autoreload for files
set number " Turns on line numbers
set showmatch " Show matching paranthesis
set incsearch " Turns on incremental search
set hidden " Hides buffers instead of closing them preventing unsaved changes form dissapearino
"set autochdir " Changes current working dir to current location of file
"set scrolloff=999       " Magic srolling center thingy
set nobackup " No backup 
set noswapfile
set ruler
highlight SpecialKey ctermfg=1

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Set backspace to default behaviour
set backspace=2



" resize current buffer by +/- 5 
nnoremap <S-left> :vertical resize -5<cr>
nnoremap <S-down> :resize -5<cr>
nnoremap <S-up> :resize +5<cr>
nnoremap <S-right> :vertical resize +5<cr>


" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

set encoding=utf-8

highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


"###########################################################
"##################  PLUGIN CONFIG SECTION #################
"###########################################################
"


"##################  CTRLP settings ###################
"
let g:ctrlp_working_path_mode = 'ra'
"When invoked, unless a starting directory is specified, CtrlP will set its local working directory according to this variable'c' - the directory of the current file. 'r' - the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs 'a' - like c, but only if the current working directory outside of CtrlP is not a direct ancestor of the directory of the current file. 0 or '' (empty string) - disable this feature.

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_max_height = 20

let g:ctrlp_max_files = 500000

let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|installer\|node_modules\|build\|main-NH4\|tmp\|vendor$',
  \ 'file': '\v\.(exe|so|dll|pyc|css|ttf|jpeg|gif|mustache|png|md|wf|svg)$' }


"#########################################################
"##################  GO settings #####################
"#########################################################
"

au! BufNewFile,BufRead *.go call s:FTgo()
function! s:FTgo()
    setlocal noexpandtab tabstop=4 shiftwidth=4
    set nolist
    set autowrite
    nmap <leader>b  <Plug>(go-build)
    nmap <leader>r  <Plug>(go-run)
    let g:go_list_type = "quickfix"
endfunction

"##################  vim-go settings ###################
let g:go_highlight_format_strings = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1

let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_variable_declarations = 1



"#########################################################
"##################  Python settings #####################
"#########################################################
"
let g:python_highlight_all = 1

au BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
