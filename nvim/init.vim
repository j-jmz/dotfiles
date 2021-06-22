set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
" set noshowmode
set signcolumn=yes
set isfname+=@-@
" set ls=0

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

call plug#begin('~/.vim/plugged')
" LSP Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'

" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Telescope fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" Colorscheme
Plug 'drewtempelmeyer/palenight.vim'
Plug 'sainnhe/edge'
Plug 'glepnir/zephyr-nvim'
Plug 'airblade/vim-gitgutter'

" File explorer
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Status line
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'akinsho/nvim-bufferline.lua'

" Misc
Plug 'tpope/vim-surround'
Plug 'qpkorr/vim-bufkill'
Plug 'yggdroot/indentline'
Plug 'windwp/nvim-autopairs'

call plug#end()

lua require("jjimenez")
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
lua require('nvim-autopairs').setup()
lua require("bufferline").setup {}

if (has("termguicolors"))
  set termguicolors
endif

"let g:edge_style = 'aura'
"let g:edge_enable_italic = 1
"let g:edge_disable_italic_comment = 1
"colorscheme edge

set background=dark
"colorscheme palenight
colorscheme zephyr

let mapleader = " "

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
"
" greatest remap ever
vnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" buffer navigation
map <Leader>h :bp<cr>
map <Leader>l :bn<cr>

nnoremap <Leader>w :w<CR>  
nnoremap <Leader>q :q<CR>  

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END
