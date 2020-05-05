let g:python_host_prog = '/usr/local/bin/python3'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:NVIM_DIR = expand("~/.config/nvim/")

if !filereadable(NVIM_DIR."autoload/plug.vim")
  echo "Installing vim-plug and plugins. Restart vim after finishing the process."
  silent call mkdir(expand(NVIM_DIR."autoload", 1), 'p')
  execute "!curl -fLo ".expand(NVIM_DIR."autoload/plug.vim", 1)." https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall
endif

call plug#begin(NVIM_DIR."plugged")

Plug 'w0rp/ale'
  let b:ale_warn_about_trailing_whitespace = 1
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
Plug 'airblade/vim-gitgutter'
  let g:gitgutter_highlight_lines = 0
Plug 'vim-airline/vim-airline'
  let g:airline_theme='materialmonokai'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'skielbasa/vim-material-monokai'

Plug 'majutsushi/tagbar'
  nmap <F8> :TagbarToggle<CR>
Plug 'Raimondi/delimitMate'
Plug 'editorconfig/editorconfig-vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python3'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'mileszs/ack.vim'
  if executable('ag')
    let g:ackprg = 'ag --vimgrep --smart-case'
    cnoreabbrev ag Ack
    cnoreabbrev aG Ack
    cnoreabbrev Ag Ack
    cnoreabbrev AG Ack
  endif

Plug 'vim-scripts/a.vim'
Plug 'nathangrigg/vim-beancount'
Plug 'mustache/vim-mustache-handlebars'
Plug 'lepture/vim-jinja'
call plug#end()

" General
set autochdir
set encoding=utf8
set number
syntax on
set t_Co=256
colorscheme material-monokai
set cursorline
set cursorcolumn
set background=dark
if has("termguicolors")
    set termguicolors
endif

" Indent
filetype plugin indent on
set autoindent
set smartindent
set nocindent
set ts=4 sw=4 noet
if has('mouse')
  set mouse=a
endif

" Filetype
autocmd BufNewFile,BufRead *.jinja2 setf jinja2
autocmd BufNewFile,BufRead *.md setf markdown
autocmd BufNewFile,BufRead Jenkinsfile setf groovy
autocmd Filetype vim,javascript,css,html,jinja2,json,yaml,zsh,markdown set sw=2 ts=2 et
autocmd Filetype python,groovy set sw=4 ts=4 et
autocmd Filetype python,yaml set foldmethod=indent

" Fold
set foldmethod=syntax
set foldlevel=100
set foldcolumn=2

let b:beancount_root = expand("$BEANCOUNT_ROOT")
autocmd FileType beancount inoremap . .<c-o>:AlignCommodity<cr>
autocmd FileType beancount inoremap <Tab> <c-x><c-o>
