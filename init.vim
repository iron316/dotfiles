set number
set backspace=indent,eol,start
set shiftwidth=4
set smartindent
set noswapfile
set title
set hidden
set cursorline
set cursorcolumn
set showmatch
set mouse=a
set expandtab
set clipboard=unnamed
syntax enable
set signcolumn=yes

set wildmode=list:longest

colorscheme lucario
set background=dark

nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
autocmd BufWritePre * :%s/\s\+$//ge

map <C-g> :GitGutterToggle<CR>
map <C-i> :Isort<CR>
let mapleader = "\<Space>"

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>m :bp<CR>

inoremap <silent> jj <ESC>:<C-u>w<CR>

if executable('pyls')
  augroup LspPython
    au!
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })

    " omnifunc
    autocmd FileType python setlocal omnifunc=lsp#complete
  augroup end
endif
let g:lsp_diagnostics_enabled = 0  " 警告やエラーの表示はALEに任せるのでOFF

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
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim/bin/python'
let s:dein_dir = expand('$HOME/.cache/dein')

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Let dein manage dein
  " Required:
  let s:toml_dir = expand('$HOME/.cache/dein/plugs/')
  call dein#load_toml(s:toml_dir . 'dein.toml',		{'lazy':0})
  call dein#add ('fisadev/vim-isort')
  call dein#add ('ryanolsonx/vim-lsp-python')
  call dein#add ('prabirshrestha/async.vim')
  call dein#add ('prabirshrestha/vim-lsp')
  call dein#add ('prabirshrestha/asyncomplete.vim')
  call dein#add ('prabirshrestha/asyncomplete-lsp.vim')

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

" defx Config: start -----------------

autocmd FileType defx call s:defx_my_settings()
    function! s:defx_my_settings() abort
     " Define mappings
      nnoremap <silent><buffer><expr> <CR>
     \ defx#do_action('open')
      nnoremap <silent><buffer><expr> c
     \ defx#do_action('copy')
      nnoremap <silent><buffer><expr> m
     \ defx#do_action('move')
      nnoremap <silent><buffer><expr> p
     \ defx#do_action('paste')
      nnoremap <silent><buffer><expr> l
     \ defx#do_action('open')
      nnoremap <silent><buffer><expr> E
     \ defx#do_action('open', 'vsplit')
      nnoremap <silent><buffer><expr> P
     \ defx#do_action('open', 'pedit')
      nnoremap <silent><buffer><expr> K
     \ defx#do_action('new_directory')
      nnoremap <silent><buffer><expr> N
     \ defx#do_action('new_file')
      nnoremap <silent><buffer><expr> d
     \ defx#do_action('remove')
      nnoremap <silent><buffer><expr> r
     \ defx#do_action('rename')
      nnoremap <silent><buffer><expr> x
     \ defx#do_action('execute_system')
      nnoremap <silent><buffer><expr> yy
     \ defx#do_action('yank_path')
      nnoremap <silent><buffer><expr> .
     \ defx#do_action('toggle_ignored_files')
      nnoremap <silent><buffer><expr> h
     \ defx#do_action('cd', ['..'])
      nnoremap <silent><buffer><expr> ~
     \ defx#do_action('cd')
      nnoremap <silent><buffer><expr> q
     \ defx#do_action('quit')
      nnoremap <silent><buffer><expr> <Space>
     \ defx#do_action('toggle_select') . 'j'
      nnoremap <silent><buffer><expr> *
     \ defx#do_action('toggle_select_all')
      nnoremap <silent><buffer><expr> j
     \ line('.') == line('$') ? 'gg' : 'j'
      nnoremap <silent><buffer><expr> k
     \ line('.') == 1 ? 'G' : 'k'
      nnoremap <silent><buffer><expr> <C-l>
     \ defx#do_action('redraw')
      nnoremap <silent><buffer><expr> <C-g>
     \ defx#do_action('print')
      nnoremap <silent><buffer><expr> cd
     \ defx#do_action('change_vim_cwd')
    endfunction

" defx Config: end -------------------
