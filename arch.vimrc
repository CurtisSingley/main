set t_Co=256

" Set tab width to 2
set ts=2
set sw=2

" Set relative line numbers
set number
set relativenumber

" Set smartcase for searching
set ignorecase
set smartcase

call plug#begin('/home/zynx/.vim/autoload/plugged/')

" Declare the list of plugins.
 Plug 'junegunn/goyo.vim'
 " Plug 'itchyny/lightline.vim'
 Plug 'mileszs/ack.vim'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-rhubarb'
 Plug 'tpope/vim-surround'
 " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 Plug 'tpope/vim-commentary'
 Plug 'tpope/vim-repeat'
 Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
 Plug 'vim-scripts/ReplaceWithRegister'
 Plug 'beloglazov/vim-online-thesaurus'
 Plug 'lervag/vimtex'
 Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
 Plug 'vim-pandoc/vim-pandoc'
 Plug 'vim-pandoc/vim-pandoc-syntax'
 Plug 'easymotion/vim-easymotion'

 " Color plugins
 Plug 'junegunn/seoul256.vim'
 Plug 'ajh17/Spacegray.vim'
 Plug 'KKPMW/moonshine-vim'
 Plug 'romainl/Apprentice'
 Plug 'nightsense/stellarized'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Fixes auto-indent
filetype plugin indent on

" Splits open at the bottom and right
set splitbelow
set splitright

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
let mapleader = " "

" seoul256 (dark):
" "   Range:   233 (darkest) ~ 239 (lightest)
" "   Default: 237
let g:seoul256_background = 234
let g:tex_flavor = 'latex'
colo seoul256
"
