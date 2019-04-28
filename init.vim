set number
set backspace=indent,eol,start
set shiftwidth=4
set smartindent
set noswapfile
set title
set cursorline
set showmatch
set mouse=a
set expandtab
set clipboard=unnamed
syntax enable

colorscheme lucario

nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
autocmd BufWritePre * :%s/\s\+$//ge

map <C-g> :GitGutterToggle<CR>
map <C-t> :NERDTreeToggle<CR>
map <C-i> :Isort<CR>
let mapleader = "\<Space>"

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap <silent> jj <ESC>:<C-u>w<CR>


if executable('go-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'go-langserver',
        \ 'cmd': {server_info->['go-langserver', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
endif

nmap <silent> <Leader>d :LspDefinition<CR>
nmap <silent> <Leader>p :LspHover<CR>
nmap <silent> <Leader>r :LspReferences<CR>
nmap <silent> <Leader>i :LspImplementation<CR>
nmap <silent> <Leader>s :split \| :LspDefinition <CR>
nmap <silent> <Leader>v :vsplit \| :LspDefinition <CR>


"dein Scripts-----------------------------
if &compatible
  set nocompatible 	      	   " Be iMproved
endif

set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim
let g:python3_host_prog = expand('$HOME') . '/.pyenv/shims/python'
let s:dein_dir = expand('$HOME/.cache/dein')

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Let dein manage dein
  " Required:
  let s:toml_dir = expand('$HOME/.cache/dein/plugs/')
  call dein#load_toml(s:toml_dir . 'dein.toml',		{'lazy':0})
  call dein#add ('scrooloose/nerdtree')
  call dein#add ('fisadev/vim-isort')
  call dein#add ('airblade/vim-gitgutter')


  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


"End dein Scripts-------------------------"

