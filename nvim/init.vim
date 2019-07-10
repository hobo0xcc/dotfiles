scriptencoding utf-8
set encoding=utf-8
set nocompatible
set number
set title
set ruler
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set mouse=a
set clipboard+=unnamedplus
set nowrap

syntax on
set noswapfile
set t_Co=256
set visualbell
set noerrorbells
set nobackup
set noundofile
set relativenumber
set scrolloff=999
set background=dark

colorscheme gruvbox
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif

let g:gruvbox_contrast_dark='hard'

" highlight Normal ctermbg=NONE

let g:plug_url_format = 'https://github.com/%s.git'
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#python_path = 'python3'

call plug#begin('~/VimPlugin')

Plug 'scrooloose/nerdtree'
Plug 'Shougo/unite.vim'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'tomasr/molokai'
Plug 'crusoexia/vim-monokai'
Plug 'joshdick/onedark.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/vimshell.vim'
Plug 'Shougo/vimproc.vim'
Plug 'mattn/emmet-vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-pathogen'
Plug 'vim-syntastic/syntastic'
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deol.nvim'
Plug 'ziglang/zig.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'zah/nim.vim'
Plug 'cohama/lexima.vim'
Plug 'ap/vim-buftabline'
Plug 'fidian/hexmode'
Plug 'Shougo/vinarise.vim'
Plug 'keith/swift.vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'deoplete-plugins/deoplete-clang'
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
" autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt=noinsert,menuone,noselect
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
" Plug 'prabirshrestha/async.vim'
" Plug 'natebosch/vim-lsc'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf'
Plug 'derekwyatt/vim-scala'
Plug 'terryma/vim-multiple-cursors'
Plug 'neoclide/coc.nvim', { 'do': 'install.sh nightly' }
" Plug 'dbgx/lldb.nvim'

call plug#end()

let NERDTreeWinSize=20
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max=8
let g:rbpt_loadcmd_toggle=0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']
let g:deoplete#sources#clang#libclang_path = "/usr/local/opt/llvm/lib/libclang.dylib"
let g:deoplete#sources#clang#clang_header = "/usr/local/opt/llvm/include/clang/"

" let g:LanguageClient_serverCommands = {
"       \ 'go': ['go-langserver'],
"       \ 'rust': ['rustup', 'run', 'stable', 'rls'],
"       \ 'scala': ['metals-vim'],
"       \ 'c': ['cquery'],
"       \ 'cpp': ['cquery'],
"       \}

let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0

" let g:LanguageClient_loadSettings = 1
" let g:LanguageClient_settingPath = '~/.config/nvim/settings.json'
" set completefunc=LanguageClient#complete
set omnifunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()
 

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition({'gotoCmd': 'split'})<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd BufRead,BufNewFile *.asm let b:deoplete_disable_auto_complete = 0

nnoremap <space>t :NERDTreeToggle<CR>
nnoremap <space>/ :vsplit<CR>
nnoremap <space>- :split<CR>
nnoremap <space>4 :vsplit<CR>:split<CR><C-w>l:split<CR><C-w>h
nnoremap <space>c <C-w>c
nnoremap <space>lf $
nnoremap <space>le ^
nnoremap <space>a <C-w>h
nnoremap <space>w <C-w>k
nnoremap <space>s <C-w>j
nnoremap <space>d <C-w>l

let g:airline_powerline_fonts=1
let g:airline_theme='base16'

let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key="\\"
let g:EasyMotion_grouping=1
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade ctermbg=none ctermfg=blue

inoremap <C-a> <Left>
inoremap <C-w> <Up>
inoremap <C-s> <Down>
inoremap <C-d> <Right>
inoremap <CR> <Return>
nnoremap <C-c> i
nnoremap <space>rc :e ~/.config/nvim/init.vim<CR>
nnoremap <space><space> ldiwh
inoremap <S-Left> <ESC>^i
inoremap <S-Right> <ESC>$a
inoremap <S-Up> <Up><Up><Up><Up><Up>
inoremap <S-Down> <Down><Down><Down><Down><Down>
nnoremap <S-Left> <ESC>^i
nnoremap <S-Right> <ESC>$a
nnoremap <S-Up> <Up><Up><Up><Up><Up>
nnoremap <S-Down> <Down><Down><Down><Down><Down>
nnoremap <space>n :bnext<CR>
nnoremap <space>b :bprev<CR>
tnoremap <C-c> <C-\><C-n>
nnoremap <space>j :w !trans -b -sl=en -tl=ja<CR>

autocmd BufRead,BufNewFile *.asm set ft=nasm

nnoremap <space>w1 1k
nnoremap <space>w2 2k
nnoremap <space>w3 3k
nnoremap <space>w4 4k
nnoremap <space>w5 5k
nnoremap <space>w6 6k
nnoremap <space>w7 7k
nnoremap <space>w8 8k
nnoremap <space>w9 9k

nnoremap <space>s1 1j
nnoremap <space>s2 2j
nnoremap <space>s3 3j
nnoremap <space>s4 4j
nnoremap <space>s5 5j
nnoremap <space>s6 6j
nnoremap <space>s7 7j
nnoremap <space>s8 8j
nnoremap <space>s9 9j

nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>[c <Plug>(coc-diagnostic-prev)
nmap <silent>]c <Plug>(coc-diagnostic-next)

nnoremap ; :
