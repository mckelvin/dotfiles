set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Plugin 'tomasr/molokai'
Plugin 'Lokaltog/vim-powerline'
Plugin 'majutsushi/tagbar'
Plugin 'Raimondi/delimitMate'

"snipmate.vim
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"
Plugin 'garbas/vim-snipmate'
Plugin 'editorconfig/editorconfig-vim'

Plugin 'ervandew/supertab'
"Plugin 'spolu/dwm.vim'
Plugin 'xuhdev/SingleCompile'
Plugin 'davidhalter/jedi-vim'
Plugin 'python-rope/ropevim'
Plugin 'Rip-Rip/clang_complete'

Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/google.vim'
Plugin 'drmikehenry/vim-headerguard'
Plugin 'derekwyatt/vim-scala'

Plugin 'vim-scripts/Python-Syntax-Folding'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Bundle "lepture/vim-jinja"
Plugin 'pangloss/vim-javascript'
Plugin 'davidzchen/vim-bazel'

Plugin 'elixir-lang/vim-elixir'
Plugin 'fatih/vim-go'
Plugin 'chase/vim-ansible-yaml'

call vundle#end()
filetype plugin indent on


"""
" common
"""
set encoding=utf8
set langmenu=zh_CN.UTF-8
set imcmdline
set nocp	"no compatible
syntax enable
set wildmode=longest:full
set wildmenu
set ruler	"ruler
set number
set wrap
set autoindent
set smartindent
set nocindent
set ts=4 sw=4 noet
set smarttab
set expandtab
set showmode
set showcmd
set showmatch
set hlsearch	
autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
set ignorecase
set smartcase
set incsearch
set autochdir
let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936
set viminfo='10,\"100,:20,%,n~/.viminfo'
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
"au BufWritePost .vimrc so ~/.vimrc
set guifont=Monaco\ 8
set mouse=a
set autoread
set cursorline
set cursorcolumn  

set foldmethod=syntax
set foldlevel=100
set foldcolumn=2

set cinoptions+=g1,h2
autocmd FileType vim setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal smartindent ts=2 sw=2
autocmd FileType html setlocal sw=2 ts=2
autocmd FileType jinja setlocal sw=2 ts=2
"""
" colorscheme
"""
" Molokai
colorscheme molokai
set background=dark
let g:molokai_original = 1
set t_Co=256
let g:Powerline_symbols = 'fancy'
" Solarized"
"set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256


"""
" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
"""
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

"""
" FUNCTION Full Tabpage full Path
"""
function! TabpageName(mode) 
  if     a:mode == 1 
      return fnamemodify(expand("%"), ":p:h") 
  elseif a:mode == 2 
      let name = fnamemodify(expand("%"), ":p:t") 
      if name == "" 
          return "(Untitled)" 
      endif 
      return name 
  endif 
endfunction 
function! TabpageState() 
  if &modified != 0 
      return '*' 
  else 
      return '' 
  endif 
endfunction 
set guitablabel=%{TabpageName(1)}/%{TabpageName(2)}%{TabpageState()} "1:Full Path, 2:File Name

"""
" automatically open and close the popup menu / preview window
"""
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

let g:syntastic_aggregate_errors = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_cpp_checkers = ['gcc', 'cpplint', 'cppcheck']
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
if has('mac')
  let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
endif
"Key Map"
nmap <F8> :TagbarToggle<cr>
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>
