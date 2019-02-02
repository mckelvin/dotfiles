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
Plug 'w0rp/ale' "{{{
  let b:ale_warn_about_trailing_whitespace = 1
"}}}
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
Plug 'airblade/vim-gitgutter' "{{{
  let g:gitgutter_highlight_lines = 0
"}}}
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'skielbasa/vim-material-monokai'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar' "{{{
  nmap <F8> :TagbarToggle<CR>
"}}}
Plug 'Raimondi/delimitMate'
Plug 'editorconfig/editorconfig-vim'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" A list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'

Plug 'mileszs/ack.vim' "{{{
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack
endif
"}}}
call plug#end()

set autochdir
set encoding=utf8
set number
syntax on
set cursorline
set cursorcolumn
set background=dark
set termguicolors
colorscheme material-monokai
let g:airline_theme='materialmonokai'

filetype plugin indent on
set autoindent
set smartindent
set nocindent
set ts=4 sw=4 noet
if has('mouse')
  set mouse=a
endif
autocmd Filetype vim,javascript,css,html,jinja2,json,yaml set sw=2 ts=2 et
autocmd Filetype python set sw=4 ts=4 foldmethod=indent et
set foldmethod=syntax
set foldlevel=100
set foldcolumn=2
