" main setting
set number
set title
set clipboard+=unnamedplus
set noswapfile
set cursorline
set cursorcolumn
set autochdir
set helplang=ja,en
set spelllang=en,cjk
set ambiwidth=double
set splitright
set wrapscan
set ruler
set hidden
set mouse=a
set cmdheight=2
set list

" encoding
set encoding=utf-8
scriptencoding utf-8
set termencoding=utf-8
set nobomb
set fileencodings=ucs-bom,utf-8,euc-jp,cp932,sjis,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213
set fileencoding=utf-8
set fileformats=unix,dos,mac

" color
set showmatch

" indent
set backspace=indent,eol,start
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent
set expandtab
set autoindent

" search
set ignorecase
set incsearch
set smartcase
set wrapscan
set hlsearch
set wildmode=list:full
nnoremap <esc><esc> :nohlsearch<cr><esc>

" remove space on wtit
autocmd bufwritepre * :%s/\s\+$//ge

"keybind
let mapleader = "\<space>"

" ctrl+<key>でタブの移動
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
tnoremap <c-h> <cmd>wincmd h<cr>
tnoremap <c-l> <cmd>wincmd l<cr>

" search keymap
nnoremap <s-p>  <s-n>
nnoremap <s-n>  n

" leader shortcut
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
" spilt
nnoremap <leader>v :vs<cr>

" jj -> esc
inoremap <silent> jj <esc>:<c-u>w<cr>

" highgight word
nnoremap <silent> <space><space> "zyiw:let @/ = '\<' . @z . '\>'<cr>:set hlsearch<cr>

"  UNIX shortcut
nnoremap <C-a> 0
nnoremap <C-e> $

" python setting
let g:python3_host_prog = $pyenv_root.'/versions/neovim/bin/python'
" vim-Plugによるプラグイン管理
call plug#begin('~/.config/nvim/plugged')
    Plug 'vim-jp/vimdoc-ja'
    " thema
    Plug 'sainnhe/gruvbox-material'
    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons'
    " treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'yioneko/nvim-yati', { 'tag': '*' }
    Plug 'p00f/nvim-ts-rainbow'
    " telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
    " filer
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    " " 移動
    Plug 'haya14busa/vim-edgemotion'
    " airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    "  editer
    Plug 'cohama/lexima.vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    " search
    Plug 'kevinhwang91/nvim-hlslens'
    " fzf
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    " " git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    "copy and paste
    Plug 'AckslD/nvim-anywise-reg.lua'
    Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
    " coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" nerdtree settings
" let NERDTreeShowHidden = 1
nmap <c-f> :NERDTreeToggleVCS<cr>

" git
map <C-g> :Gvdiffsplit<CR>
map <C-b> :Git blame<CR>

" edge motion setting
map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)

" color scheme
if has('termguicolors')
  set termguicolors
endif
set background=dark
let g:gruvbox_material_foreground = 'mix'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_disable_italic_comment = 0
colorscheme gruvbox-material

" airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox_material'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#coc#enabled = 0
map <C-p> <Plug>AirlineSelectPrevTab
map <C-n> <Plug>AirlineSelectNextTab

" telescope
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope git_files<cr>
nnoremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <leader>l <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>

" coc.nvim settings
highlight cocerrorsign ctermfg=15 ctermbg=196
highlight cocwarningsign ctermfg=0 ctermbg=172
let g:coc_global_extensions = [
      \'coc-pyright',
      \'coc-json',
      \'coc-go',
      \'coc-lists',
      \'coc-docker',
      \'coc-spell-checker',
      \'coc-yaml'
\]
" 定義ジャンプ
nmap <silent> <leader>d <plug>(coc-definition)

" Lua
lua <<EOF
-- treesitter setting
require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true,  -- syntax highlightを有効にする
  },
  ensure_installed = {"go", "python", "dockerfile", "vim", "lua"},
  -- ensure_installed = 'maintained' とすることもできる
}
require("nvim-treesitter.configs").setup {
  yati = {
    enable = true,
    default_lazy = true,
    default_fallback = "auto"
  },
  indent = {
    enable = false -- disable builtin indent module
  }
}
require("nvim-treesitter.configs").setup {
  highlight = {
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  }
}
-- hlslens
require("hlslens").setup()
-- anywise-reg
require("anywise_reg").setup()
-- registers
require("registers").setup()
EOF
