" #################  ENV settings ################
"
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"#########################################################
"##################  Vimplug settings ###################
"#########################################################

" Check and install vimplug
 if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'sickill/vim-monokai'

Plug 'phanviet/vim-monokai-pro'

Plug 'altercation/vim-colors-solarized'

Plug 'vim-scripts/Gundo'

Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdtree'

Plug 'airblade/vim-gitgutter'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'majutsushi/tagbar'

Plug 'joshdick/onedark.vim'

Plug 'sheerun/vim-polyglot'

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

call plug#end()


"#########################################################
"##################  Personal settings ###################
"#########################################################
"
" vimgrep /path_to_command/gj ./**/*.rb

:command -nargs=1 Greppy vimgrep /<args>/gj ./**/*.py
"
"#################### color settings
"
"
""Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
syntax enable
colorscheme onedark
"colorscheme monokai_pro


hi Search cterm=NONE ctermfg=grey ctermbg=125

"hi Normal ctermbg=grey ctermfg=Black guifg=Black guibg=grey
"


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
"let g:airline_solarized_bg='dark'
"let g:airline_theme='base16'
let g:airline_theme='onedark'



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


nnoremap <F10> :CtrlP /home/epsilon<cr>
nnoremap <F9> :CtrlPCurWD <cr>
nnoremap <leader>ep :CtrlP /home/epsilon<cr>
nnoremap <leader>po :CtrlP /home/policy<cr>

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

"When invoked, unless a starting directory is specified, CtrlP will set its local working directory according to this variable'c' - the directory of the current file. 'r' - the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs 'a' - like c, but only if the current working directory outside of CtrlP is not a direct ancestor of the directory of the current file. 0 or '' (empty string) - disable this feature.

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_max_height = 20

let g:ctrlp_max_files = 500000

let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|installer\|node_modules\|pylint.d\|build\|main-NH4\|tmp\|.vim\|github.com\|vendor\|mod$',
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

let g:go_bin_path = $GOBIN

"let g:go_def_mode='gopls'
"let g:go_info_mode='gopls'
"let g:go_autodetect_gopath = 1
"
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []


"#########################################################
"##################  Python settings #####################
"#########################################################
"
let g:python_highlight_all = 1

au BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=99 expandtab autoindent fileformat=unix
inoremap <silent><expr> <c-space> coc#refresh()

let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 0
" Auto check on save

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
let g:pymode_breakpoint_cmd = "import ipdb; ipdb.set_trace()  # XXX BREAKPOINT"

let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_lookup_project = 0

let g:pymode_options_max_line_length = 999


let g:pymode_python = 'python'

" FOLD settings
"
set foldlevelstart=20

"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
"
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>


" COC settings

inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gtd <Plug>(coc-type-definition)

" gi - go to implementation
nmap <silent> gi <Plug>(coc-implementation)

" gr - goto references
nmap <silent> gr <Plug>(coc-references)

" List errors
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<cr>

" list commands available in tsserver (and others)
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>

" restart when tsserver gets wonky
nnoremap <silent> <leader>cR  :<C-u>CocRestart<CR>

" view all errors
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<CR>

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-html', 'coc-css', 'coc-prettier', 'coc-tsserver', 'coc-eslint', 'coc-go', 'coc-highlight', 'coc-jedi', 'coc-swagger', 'coc-tsserver', 'coc-yaml']

set signcolumn=yes
