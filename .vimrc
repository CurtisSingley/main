" Change default leader key
let mapleader =" "

" Basics
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set relativenumber
set tabstop=2
set nu
set autoindent
set smartindent
set lazyredraw
set laststatus=2
set showcmd
set incsearch
set autoread


" Plugins will be downloaded under the specified directory.
call plug#begin()

" Declare the list of plugins.
 Plug 'junegunn/goyo.vim'
 " Plug 'itchyny/lightline.vim'
 Plug 'mileszs/ack.vim'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-rhubarb'
 Plug 'tpope/vim-surround'
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
 Plug 'junegunn/fzf.vim'
 Plug 'tpope/vim-commentary'
 Plug 'tpope/vim-repeat'
 Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
 Plug 'vim-scripts/ReplaceWithRegister'
 Plug 'beloglazov/vim-online-thesaurus'
 Plug 'lervag/vimtex'
 Plug 'iamcco/mathjax-support-for-mkdp'
 Plug 'iamcco/markdown-preview.vim'

 " Color plugins
 Plug 'junegunn/seoul256.vim'
 Plug 'ajh17/Spacegray.vim'
 Plug 'KKPMW/moonshine-vim'
 Plug 'romainl/Apprentice'
 Plug 'nightsense/stellarized'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'

  return '[%n] %F %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
endfunction
let &statusline = s:statusline_expr()

" Map F2 to compile python code
map <f2> :w\|!python %

" Splits open at the bottom and right
set splitbelow
set splitright

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" undotree
let g:undotree_WindowLayout = 2
nnoremap U :UndotreeToggle<CR>

" Open the selected text in a split (i.e. should be a file).
map <leader>o "oyaW:sp <C-R>o<CR>
xnoremap <leader>o "oy<esc>:sp <C-R>o<CR>
vnoremap <leader>o "oy<esc>:sp <C-R>o<CR>

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Open corresponding.pdf
map <leader>p :!opout <c-r>%<CR><CR>

" Compile document
map <leader>c :!compiler <c-r>&<CR>

" Annoying temporary files
set backupdir=/tmp//,.
set directory=/tmp//,.
if v:version >= 703
  set undodir=/tmp//,.
endif

" Interpret .md files, etc. as .markdown
"let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Readmes autowrap text:
autocmd BufRead,BufNewFile *.md,*.tex set tw=79

" Get line, word and character counts with F3:
map <F3> :!wc <C-R>%<CR>

" Spell-check set to F6:
map <F6> :setlocal spell! spelllang=en_us<CR>

" Use urlview to choose and open a url:
":noremap <leader>u :w<Home>silent <End> !urlview<CR>
":noremap ,, :w<Home>silent <End> !urlview<CR>

" Enable autocompletion:
set wildmode=longest,list,full
set wildmenu

"Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" when shortcut files are updated, renew bash and ranger configs with new
" material:
autocmd BufWritePost ~/.scripts/folders,~/.scripts/configs !bash ~/.scripts/shortcuts.sh

" Runs a script that cleans out tex build files whenever I close out of a .tex
" file.
autocmd Vimleave *.tex !texclear %

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" C-T for new tab
nnoremap <C-t> :tabnew<cr>

" AutoSave
function! s:autosave(enable)
				augroup autosave
								autocmd!
								if a:enable
												autocmd TextChanged,InsertLeave <buffer>
													\	if empty(&buftype) && !empty(bufname(''))
													\|	silent! update
													\| endif
								endif
				augroup END
endfunction

command! -bang AutoSave call s:autosave(<bang>1)

" vim-commentary
map  gc  <Plug>Commentary
nmap gcc <Plug>Commentary

" vim-fugitive
nmap			<Leader>g :Gstatus<CR>gg<c-n>
nnoremap	<Leader>d :Gdiff<CR>

" Make Windows clipboard the default
set clipboard=unnamed

if &term =~ '256color'
" disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=
endif

" Needed for lightline status bar
set laststatus=2

" Used to set browser for markdown-preview plugin
let g:mkdp_path_to_chrome = "chrome"

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background = 234
colo seoul256
