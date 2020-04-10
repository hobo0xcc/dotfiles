scriptencoding utf-8
set encoding=utf-8
set nocompatible
set number
set title
set ruler
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
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
set shortmess+=I
set ignorecase

colorscheme molokai " afterglow
let g:afterglow_blackout=1
let g:afterglow_inherit_background=1
let s:background = "#000000"
if (has("nvim"))
  set termguicolors
  " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

let g:gruvbox_contrast_dark='hard'

" highlight Normal ctermbg=NONE

let g:plug_url_format = 'https://github.com/%s.git'
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#python_path = 'python3'

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction

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
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/vimshell.vim'
Plug 'Shougo/vimproc.vim'
Plug 'mattn/emmet-vim'
Plug 'kien/rainbow_parentheses.vim'
" Plug 'easymotion/vim-easymotion'
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
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'honza/vim-snippets'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'derekwyatt/vim-scala'
Plug 'terryma/vim-multiple-cursors'
Plug 'SirVer/ultisnips'
Plug 'dbgx/lldb.nvim'
Plug 'ElmCast/elm-vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
" Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'jvoorhis/coq.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'danilo-augusto/vim-afterglow'
Plug 'itchyny/lightline.vim'

call plug#end()

let NERDTreeWinSize=20
let NERDTreeShowHidden=1
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
call deoplete#custom#option('auto_complete', v:false)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <Leader>d :<C-u>CocList diagnostics<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:LanguageClient_serverCommands = {
      \ 'go': ['go-langserver'],
      \ 'rust': ['ra_lsp_server'],
      \ 'scala': ['metals-vim'],
      \ 'c': ['clangd'],
      \ 'cpp': ['clangd'],
      \ 'python': ['/usr/local/bin/pyls'],
      \ 'haskell': ['hie-wrapper']
      \}

let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0

let g:lightline = {
        \ 'colorscheme': 'simpleblack',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightlineModified',
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode'
        \ }
        \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" let g:LanguageClient_loadSettings = 1
" let g:LanguageClient_settingPath = '~/.config/nvim/settings.json'
" set completefunc=LanguageClient#complete
" set omnifunc=LanguageClient#complete
" set formatexpr=LanguageClient_textDocument_rangeFormatting()
 

" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition({'gotoCmd': 'split'})<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

autocmd CompleteDone * if pumvisible() == 0 | pclose | endif

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
nnoremap <Leader>t :FZF<CR>
nnoremap <Leader>h :Rg<CR>

let g:airline_powerline_fonts=1
let g:airline_theme="afterglow" "'base16'

let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key="\\"
let g:EasyMotion_grouping=1
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade ctermbg=none ctermfg=blue

" inoremap <C-a> <Left>
" inoremap <C-w> <Up>
" inoremap <C-s> <Down>
" inoremap <C-d> <Right>
inoremap <CR> <Return>
nnoremap <C-c> i
nnoremap <space>rc :e ~/.config/nvim/init.vim<CR>
nnoremap <space><space> :terminal<CR>
nnoremap <S-Left> b
nnoremap <S-Right> w
" nnoremap <S-Left> <ESC>^i
" nnoremap <S-Right> <ESC>$a
" inoremap <S-Left> <ESC>^i
" inoremap <S-Right> <ESC>$a
nnoremap <S-Up> 10k
nnoremap <S-Down> 10j
nnoremap <space><Right> :bnext<CR>
nnoremap <space><Left> :bprev<CR>
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

nnoremap <C-a> G$vgg

nmap <C-s> <Plug>(vinarise_next_screen)
nmap <C-w> <Plug>(vinarise_prev_screen)

nnoremap ; :
