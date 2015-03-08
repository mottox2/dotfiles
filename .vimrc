set autoindent
set number
set ruler
set smartindent
set smarttab
set expandtab
set shiftwidth=2
set encoding=utf-8
set ambiwidth=double
set noswapfile
set whichwrap=b,s,h,l,<,>,[,]
set wildmode=list:longest
set wildmenu
set display=lastline
set showmatch
set matchtime=1
set t_Co=256
set showmode
set showcmd
set scrolloff=5

colorscheme railscasts

filetype indent on
syntax enable

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'tpope/vim-rails'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'itchyny/lightline.vim'
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'nathanaelkane/vim-indent-guides'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

nnoremap ;p :set paste! paste?<CR>
nnoremap ;h :noh<CR>
nnoremap ;n :set number! number?<CR>
nnoremap Y y$
nnoremap ;f :NERDTree<CR>
nnoremap ;o :Unite outline<CR>

au BufRead,BufNewFile *.scss set filetype=sass

if v:version >= 700 
  nnoremap !r :R<CR>
  nnoremap !R :call OpenNewTab()<CR>:R<CR>
  function! OpenNewTab()
    let f = expand("%:p")
    ""execute ":q"
    execute ":tabnew ".f
  endfunction
endif

let g:lightline = {
\ 'colorscheme': 'wombat',
\ }

" :Unite outline
let g:unite_data_directory = '~/'
let g:unite_abbr_highlight = 'Nomal'

" neocomplcache
let g:neocomplete#enable_at_startup = 1
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
\ 'default' : ''
\ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" end neocomplcache

" indent guide
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラーの無効
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=239
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=236
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 30

"autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd VimEnter * wincmd p

let g:NERDTreeDirArrows=1
