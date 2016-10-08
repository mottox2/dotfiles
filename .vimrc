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
set hlsearch
set incsearch
set laststatus=2

if has('gui_running')
  set cursorline
endif

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

"dein Scripts-----------------------------
if &compatible
  set nocompatible " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.vim/dein')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

call dein#add( 'tpope/vim-rails')
call dein#add( 'tpope/vim-fugitive', { 'lazy': 1 })
call dein#add( 'basyura/unite-rails')
call dein#add( 'scrooloose/nerdtree', { 'lazy' : 1 })
call dein#add( 'bling/vim-airline')
call dein#add( 'nathanaelkane/vim-indent-guides')
call dein#add( 'rking/ag.vim')
call dein#add( 'ctrlpvim/ctrlp.vim')
call dein#add( 'junegunn/vim-easy-align')
call dein#add( 'tpope/vim-fugitive')

call dein#add( 'Shougo/neocomplete')
call dein#add( 'Shougo/neosnippet')
call dein#add( 'Shougo/neosnippet-snippets')

call dein#add( 'Shougo/unite.vim')
call dein#add( 'Shougo/unite-outline')

call dein#add( 'hail2u/vim-css3-syntax')
call dein#add( 'othree/yajs.vim', { 'on_ft': 'javascript' })
call dein#add( 'kchmck/vim-coffee-script')
call dein#add( 'mxw/vim-jsx')
call dein#add( 'slim-template/vim-slim')
call dein#add( 'cakebaker/scss-syntax.vim')
call dein#add( 'digitaltoad/vim-jade')
call dein#add( 'dag/vim-fish')

if has('nvim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('neomake/neomake')
  call dein#add('benjie/neomake-local-eslint.vim')
else
  call dein#add( 'scrooloose/syntastic', { 'on_ft': 'javascript' })
  call dein#add( 'pmsorhaindo/syntastic-local-eslint.vim', { 'on_ft': 'javascript' })
endif

call dein#add( 'itchyny/vim-parenmatch')
" call dein#add( 'itchyny/vim-cursorword') " FIXME: Slow cursor
call dein#add( 'tomtom/tcomment_vim')

" call dein#add( 'Shougo/neocomplcache')
"
" call dein#add( 'YankRing.vim')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

if has('nvim')
  let g:deoplete#enable_at_startup = 1
endif

nnoremap ;p :set paste! paste?<CR>
nnoremap ;h :noh<CR>
nnoremap ;n :set number! number?<CR>
nnoremap Y y$
nnoremap ;f :NERDTreeFind<CR>
nnoremap ;o :Unite outline<CR>
nnoremap ;remove :%s/\s\+$//ge<CR>

nnoremap ;g :<C-u>!git<Space>

nnoremap <silent> <TAB>c :tabnew<CR>
nnoremap <silent> <TAB>n :tabnext<CR>
nnoremap <silent> <TAB>w :tabclose<CR>
nnoremap <silent> <TAB>o :tabonly<CR>
nnoremap <silent> <TAB>1 :tabn 1<CR>
nnoremap <silent> <TAB>2 :tabn 2<CR>
nnoremap <silent> <TAB>3 :tabn 3<CR>
nnoremap <silent> <TAB>4 :tabn 4<CR>
nnoremap <silent> <TAB>5 :tabn 5<CR>
nnoremap <silent> <TAB><TAB> :tabnext <CR>
nnoremap <silent> <TAB><RIGHT> :tabnext <CR>
nnoremap <silent> <TAB><LEFT> :tabprevious <CR>

imap <c-e> <end>
imap <c-a> <home>

au BufRead,BufNewFile *.scss set filetype=scss.css
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
au BufNewFile,BufRead *.json.jbuilder set ft=ruby

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

"lint
"let g:syntastic_mode_map = { 'mode': 'passive',
"                           \ 'active_filetypes': [],
"                           \ 'passive_filetypes': [] }
"let g:syntastic_javascript_jslint_conf = "--white --undef --nomen --regexp --plusplus --bitwise --newcap --sloppy --vars"
"
if has('nvim')
  autocmd! BufWritePost,BufEnter * Neomake
  let g:neomake_javascript_enabled_makers = ['eslint']
else
  let g:syntastic_javascript_checkers=['eslint']
endif


" ctrlp
let g:ctrlp_match_window        = 'min:1,max:20,results:20'
let g:ctrlp_custom_ignore       = '\v[\/](node_modules|build|vendor/bundle|vendor/etc|public/assets)$'

let g:ctrlp_mruf_exclude        = '\v[\/](node_modules|build|vendor/bundle|vendor/etc|public/assets)$'
let g:ctrlp_mruf_relative       = 0
let g:ctrlp_mruf_max            = 300
let g:ctrlp_clear_cache_on_exit = 0 " 終了時キャッシュをクリアしない
let g:ctrlp_jump_to_buffer      = 2 " タブで開かれていた場合はそのタブに切り替える

if executable('ag')
  let g:ctrlp_use_caching  = 0
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup -g ""'
endif

nnoremap R :CtrlPMRUFiles<CR>
nnoremap ;; :CtrlPBuffer<CR>
set wildignore+=*/tmp/*,*/db/*,*.sample,*/.git/*

" Airline
let g:airline_section_a = airline#section#create(['mode','','branch'])
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:Powerline_symbols = 'fancy'
"let g:airline_theme='badwolf'

let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '

" EasyAlign
vmap <Enter> <Plug>(EasyAlign)

" Vim-jsx
let g:jsx_ext_required = 0

" Parenmatchにカッコ処理を任せるので標準機能の無効化
let g:loaded_matchparen = 1
