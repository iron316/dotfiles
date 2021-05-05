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

let mapleader = "\<Space>"

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>v :vs<CR>
nnoremap <Leader>h :sp<CR>

inoremap <silent> jj <ESC>:<C-u>w<CR>


let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim/bin/python'

" vim-plugによるプラグイン管理
call plug#begin('~/.config/nvim/plugged')
  Plug 'cohama/lexima.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'antoinemadec/coc-fzf'
  Plug 'airblade/vim-gitgutter'
  Plug 'liuchengxu/vista.vim'
  Plug 'w0rp/ale'
  Plug 'preservim/nerdtree'
call plug#end()


" NERDTree SETTINGS
nmap <C-f> :NERDTreeToggle<CR>

" GitGuitter SETTINGS
map <C-g> :GitGutterToggle<CR>

" Airline SETTINGS
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#coc#enabled = 0
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = 'E:'
let g:airline#extensions#ale#warning_symbol = 'W:'
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

" LightLine SETTINGS
let g:lightline = {
     \ 'colorscheme': 'wombat',
     \ 'active': {
     \   'right': [ ['coc'] ],
     \   'left': [ [ 'mode', 'paste' ],
     \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
     \ },
     \ 'component_function': {
     \   'cocstatus': 'coc#status'
     \ },
     \ }

" coc.nvim SETTINGS
highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172

"スペース2回でCocList
nmap <silent> <space><space> :<C-u>CocList<cr>
""スペースhでHover
nmap <silent> <space>h :<C-u>call CocAction('doHover')<cr>
"スペースdfでDefinition
nmap <silent> <Leader>d <Plug>(coc-definition)
""スペースrfでReferences
nmap <silent> <Leader>r <Plug>(coc-references)
"スペースrnでRename
nmap <silent> <space>rn <Plug>(coc-rename)

" ALE SETTINGS
let g:ale_linters = {
        \'python':['black','autopep8','isort'],
        \'HTML':['HTMLHint'],
        \'JavaScript':['eslint'],
        \'c':['gcc'],
        \'cpp':['gcc'],
  \'scala':['scalastyle'],
  \'go':['gofmt'],
        \}
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
        \'python':['autopep8', 'black', 'isort'],
        \'c':['clang-format'],
        \'cpp':['clang-format'],
  \'scala':['scalastyle'],
  \'go':['gofmt'],
        \}
let g:ale_python_flake8_executable = g:python3_host_prog
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_autopep8_executable = g:python3_host_prog
let g:ale_python_autopep8_options = '-m autopep8'
let g:ale_python_isort_executable = g:python3_host_prog
let g:ale_python_isort_options = '-m isort'
let g:ale_python_black_executable = g:python3_host_prog
let g:ale_python_black_options = '-m black'
let g:ale_use_global_executables = 1
nmap <S-f> <Plug>(ale_fix)"
let g:ale_python_flake8_args = '--config ~/.config/flake8'
let g:ale_python_autopep8_args = '--config ~/.config/pep8'
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'

