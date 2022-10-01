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
autocmd bufwritepre * :%s/\s\+$//ge keybind
let mapleader = "\<space>"

" ctrl+<key>でタブの移動
nnoremap <c-h> <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <c-l> <c-w>l
tnoremap <c-h> <cmd>wincmd h<cr> 
tnoremap <c-j> <cmd>wincmd j<cr> 
tnoremap <c-k> <cmd>wincmd k<cr> 
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

"terminal mapping

let g:python3_host_prog = $pyenv_root.'/versions/neovim/bin/python'
" let g:ruby_host_prog = $rbenv_root.'/versions/3.0.1/bin/ruby'

" vim-Plugによるプラグイン管理
call plug#begin('~/.config/nvim/plugged')
    " thema
    Plug 'jacoborus/tender.vim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 't9md/vim-quickhl'
    " filer
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    " 移動
    Plug 'haya14busa/vim-edgemotion'
    Plug 'unblevable/quick-scope'
    " airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    "  editer
    Plug 'cohama/lexima.vim'
    Plug 'andymass/vim-matchup'
    Plug 'kien/rainbow_parentheses.vim'
    Plug 'tyru/caw.vim'
    " search
    Plug 'kevinhwang91/nvim-hlslens'
    " misc
    Plug 'goolord/alpha-nvim'
    " fzf
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    " git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    "copy and paste
    Plug 'AckslD/nvim-anywise-reg.lua'
    Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
    " coc 
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'antoinemadec/coc-fzf'
    Plug 'liuchengxu/vista.vim'
    " terminal
    Plug 'kassio/neoterm'
call plug#end()

" nerdtree settings
nmap <c-f> :NERDTreeToggle<cr>

" edge motion setting
map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)

" quick scope setting
let g:qs_highlight_on_keys = ['f', 'F']

" airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme = 'deus'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#coc#enabled = 0
map <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

" quick highlight setting
nmap <leader>m <Plug>(quickhl-manual-this)
xmap <leader>m <Plug>(quickhl-manual-this)
nmap <leader>M <Plug>(quickhl-manual-reset)
xmap <leader>M <Plug>(quickhl-manual-reset)

" fzf setting
let $FZF_DEFAULT_OPTS="--layout=reverse"
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>G :GFiles?<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>

" git
map <C-g> :Gvdiffsplit<CR>

" craw setting
nmap <C-/> <Plug>(caw:hatpos:toggle)
vmap <C-/> <Plug>(caw:hatpos:toggle)

" rainbow
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
let g:rbpt_loadcmd_toggle = 0
let g:rbpt_max = 16

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

"スペース2回でcoclist
nmap <silent> <space><space> :<c-u>CocFzfList<cr>
"スペースdfでdefinition
nmap <silent> <leader>d <plug>(coc-definition)
""スペースrfでreferences
nmap <silent> <leader>r <plug>(coc-references)
" format on save
aug python
  au!
  au BufWrite *.py call CocAction('format')
aug END

" terminal setting
tnoremap <Esc> <C-\><C-n>
let g:neoterm_default_mod = 'vertical'
let g:neoterm_default_mod = 'belowright'
let g:neoterm_autoinsert = 1
let g:neoterm_size = winheight(0)/4
nnoremap <c-t> :Tnew<CR>
tnoremap <c-t> <C-¥><C-n>:Tclose!<CR>

" color load tender
if (has("termguicolors"))
 set termguicolors
endif

" theme
syntax enable
colorscheme tender

" lua setting
lua <<EOF
-- treesitter setting
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,  -- syntax highlightを有効にするj
  },
  ensure_installed = 'all', -- :TSInstall allと同じ
  -- ensure_installed = 'maintained' とすることもできる
}

-- alpha-nvim setting
require'alpha'.setup(require'alpha.themes.startify'.config)
-- anywise-reg
require("anywise_reg").setup()
-- registers
require("registers").setup()
EOF

