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
set incsearch
set laststatus=2

set backspace=indent,eol,start

if has("autocmd")
  augroup redhat
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

NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'basyura/unite-rails'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'bling/vim-airline'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'rking/ag.vim'
NeoBundle 'yegappan/mru'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'junegunn/vim-easy-align'

NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'

NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'dag/vim-fish'

NeoBundle 'itchyny/vim-parenmatch'
NeoBundle 'itchyny/vim-cursorword'

" NeoBundle 'scrooloose/syntastic'
" NeoBundle 'Shougo/neocomplcache'
"
" NeoBundle 'YankRing.vim'
" nmap sp :YRShow<CR>

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

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#enable_camel_case_completion  =  1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" END neocomplete


" indent guide
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラーの無効
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=239
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=236
let g:indent_guides_guide_size = 2
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

" ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor\|tmp'

" Airline
let g:airline_section_a = airline#section#create(['mode','','branch'])
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:Powerline_symbols = 'fancy'
let g:airline_theme='badwolf'

let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '

" EasyAlign
vmap <Enter> <Plug>(EasyAlign)

" Parenmatchにカッコ処理を任せるので標準機能の無効化
let g:loaded_matchparen = 1
