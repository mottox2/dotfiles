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
set cursorline
set hlsearch

set backspace=indent,eol,start
"set cursorcolumn


if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

colorscheme railscasts
hi Search                    guibg=#5A647E ctermfg=NONE ctermbg=117 cterm=underline

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
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'Shougo/neocomplcache'
NeoBundle "Shougo/neosnippet"
NeoBundle "Shougo/neosnippet-snippets"
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'rking/ag.vim'
NeoBundle 'yegappan/mru'
" NeoBundle 'scrooloose/syntastic'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'

NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'cakebaker/scss-syntax.vim'

" vim 7.4 later
NeoBundle 'todesking/ruby_hl_lvar.vim'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck

nnoremap ;p :set paste! paste?<CR>
nnoremap ;h :noh<CR>
nnoremap ;n :set number! number?<CR>
nnoremap Y y$
nnoremap ;f :NERDTree<CR>
nnoremap ;o :Unite outline<CR>
nnoremap ;remove :%s/\s\+$//ge<CR>

nnoremap <silent> <TAB>c :tabnew<CR>
nnoremap <silent> <TAB>n :tabnext<CR>
nnoremap <silent> <TAB>w :tabclose<CR>
nnoremap <silent> <TAB><S-w> :tabonly<CR>
nnoremap <silent> <TAB>1 :tabn 1<CR>
nnoremap <silent> <TAB>2 :tabn 2<CR>
nnoremap <silent> <TAB>3 :tabn 3<CR>
nnoremap <silent> <TAB>4 :tabn 4<CR>
nnoremap <silent> <TAB>5 :tabn 5<CR>
nnoremap <silent> <TAB><TAB> :tabnext <CR>
nnoremap <silent> <TAB><RIGHT> :tabnext <CR>
nnoremap <silent> <TAB><LEFT> :tabprevious <CR>

let MRU_Auto_Close=1
let MRU_Window_Height=15
let MRU_Max_Entries=100
let MRU_Window_Open_Always=1
let MRU_Open_File_Use_Tabs=1
nnoremap R :MRU<CR>

au BufRead,BufNewFile *.scss set filetype=sass
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee

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

"neocomplcache
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

let g:NERDTreeDirArrows=1

"autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd VimEnter * wincmd p
autocmd BufWritePre * :%s/\s\+$//e

"jslint
"let g:syntastic_mode_map = { 'mode': 'passive',
"                           \ 'active_filetypes': [],
"                           \ 'passive_filetypes': [] }
"let g:syntastic_javascript_jslint_conf = "--white --undef --nomen --regexp --plusplus --bitwise --newcap --sloppy --vars"

