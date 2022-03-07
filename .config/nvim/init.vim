" Set up plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-signify'
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-eunuch'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
Plug 'axvr/photon.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'romainl/Apprentice'
Plug 'hardselius/warlock'
Plug 'habamax/vim-alchemist'
Plug 'jnurmine/Zenburn'
Plug 'savq/melange'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'JuliaEditorSupport/julia-vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'iloginow/vim-stylus'
Plug 'posva/vim-vue'
Plug 'digitaltoad/vim-pug'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dag/vim-fish'
Plug 'ap/vim-css-color'
Plug 'evanleck/vim-svelte'
Plug 'dense-analysis/ale'
Plug 'RRethy/vim-illuminate'
Plug 'ziglang/zig.vim'
Plug 'lifepillar/vim-colortemplate'
Plug 'rktjmp/lush.nvim'

call plug#end()
" Display line numbers
set number

" Display relative line numbers
" set relativenumber

" Prevent Neovim from wrapping text
set nowrap
set textwidth=0
set wrapmargin=0

" Display invisible characters
set list
set listchars=eol:$
set listchars+=tab:>-
set listchars+=trail:~
set listchars+=precedes:<

" Make indentLine only conceal characters in NORMAL mode
let g:indentLine_concealcursor = 'n'
let g:indentLine_conceallevel = 2

" Use more dotted line for indent guide
let g:indentLine_char =  '┊'

" Add trailing comma when splitting into multiple lines
let g:splitjoin_trailing_comma = 1

syntax on
set background=dark
set termguicolors
colorscheme melange
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_italic = 1

" Detect syntax hightlighting languages on enter
let g:vue_pre_processors = 'detect_on_enter'

" Always show sign column (for gitgutter)
set signcolumn=yes

" Set lightline color scheme to jellybeans
" And enable git branch display via vim-gitbranch
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'fileicon', 'filename', 'modified' ] ],
      \   'right': [ ['lineinfo'],
      \              ['percent'],
      \              ['fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" Make invisible characters dark color to avoid distraction
highlight NonText ctermfg=DarkGray guifg=DarkGray
highlight Whitespace ctermfg=DarkGray guifg=DarkGray
highlight SpecialKey ctermfg=DarkGray guifg=DarkGray

" Turn on spellcheck for English
set spelllang=en
set spell



" Set window title to title of file
set title

" Update more frequently
set updatetime=100

" Highlight suggested line length
au FileType javascript set cc=81
au FileType coffee set cc=81
au FileType pug set cc=81
au FileType python set cc=101
au FileType java set cc=81
au FileType markdown set cc=101
au FileType gitcommit set cc=73
au FileType rust set cc=81
au FileType vue set cc=81
" Julia's completions and COC's conflict
au FileType julia CocDisable

let g:ale_linters = {
	\ 'python': ['flake8'],
	\ 'asm': [],
\ }

let g:ale_fixers = {
	\ 'javascript': ['eslint'],
	\ 'python': ['black'],
	\ 'rust': ['rustfmt'],
\ }
let g:ale_fix_on_save = 1

" ALEDisable actually doesn't disable everything, so make a custom command
" that *does.*
"
" https://github.com/dense-analysis/ale/issues/2260
command -bar ALEActuallyDisable         ALEDisable | let g:ale_fix_on_save = 0

" Character remaps
"" Terminal
tnoremap <Esc> <C-\><C-n>
