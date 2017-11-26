" dein plugin manager setting
if &compatible
	  set nocompatible
  endif
  set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

  call dein#begin(expand('~/.vim/dein'))

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})

  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/unite.vim')

  call dein#add('itchyny/lightline.vim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('Yggdroot/indentLine')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-endwise')
call dein#end()

" --------------------------------
" basic setting
" --------------------------------
let &t_Co=256				        " 256色モード
syntax on				            " シンタックスハイライト
set number				            " 行番号表示
set clipboard=unnamed		        " クリップボードを共用できるようにする
set laststatus=2			        " ステータスライン表示
autocmd BufWritePre * :%s/\s\+$//ge	" クリップボードを共用できるようにする
inoremap <C-J> <nop>			    " 日本語切り替えのctrl+Jの無効化

" ---------------
" cursor line setting
" ---------------
set cursorline			 	        " カーソル行のハイライト
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgrey
" 行が折り返し表示されていた場合、行単位でなく表示単位で移動
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gj

" ---------------
" status line setting
" ---------------
set laststatus=2    " ステータスラインを常に表示
set showmode        " 現在のモードを表示
"set showcmd         " コマンド表示
set ruler           " カーソル位置
" set statusline=%F%r%h%m%=
highlight StatusLine term=none cterm=none ctermbg=grey ctermfg=black

" ---------------
" indent setting
" ---------------
set tabstop=4		" タブを表示する時の幅
set shiftwidth=4	" 自動インデントでずれる幅
set expandtab		" タブをスペースに変換
filetype plugin indent on

" ---------------
" search setting
" ---------------
set incsearch       " インクリメンタルサーチ
set hlsearch        " 検索結果をハイライト
set showmatch       " カッコの対応関係を表示
source $VIMRUNTIME/macros/matchit.vim  " vimの%を拡張する

" ---------------
" command setting
" ---------------
set wildmenu        " コマンドモードの補完
set history=500     " 保存するコマンド履歴数

" --------------------------------
" unite.vim
" --------------------------------
"  画像ファイルを無視する
let s:unite_ignore_patterns='\.\(gif\|jpe\?g\|png\|webp\)$'
call unite#custom#source('file_rec', 'ignore_pattern', s:unite_ignore_patterns)

"  起動時にinsert modeに let g:unite_enable_start_insert=1
" デフォルトアクションはタブで開く
call unite#custom#default_action('file', 'tabswitch')
" filear && buffer
nnoremap <silent> ,uu :<C-u>Unite file file_rec buffer<CR>
" unite grepにhighwayを使う
nnoremap <silent> ,g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

if executable('hw')
  let g:unite_source_grep_command = 'hw'
  let g:unite_source_grep_default_opts = '--no-group --no-color'
  let g:unite_source_grep_recursive_opt = ''
endif
" grep結果の再呼び出し
nnoremap <silent> ,r :<C-u>UniteResume search-buffer<CR>

" --------------------------------
" intendLine
" --------------------------------
let g:indentLine_color_term = 240

" --------------------------------
" neocomplete.vim
" --------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

" --------------------------------
" rsense
" --------------------------------
"let g:neocomplete#sources#omni#input_patterns = {
"\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
"\}

" --------------------------------
" rsense
" --------------------------------
"if !exists('g:neocomplete#force_omni_input_patterns')
"	let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"let g:rsenseHome = expand("~/.rbenv/shims/rsense")

" --------------------------------
" customize
" --------------------------------
nnoremap <silent> <C-l> gt	" ctrl+l 次のタブ
nnoremap <silent> <C-h> gT	" ctrl+h 前のタブ

inoremap ,date <C-R>=strftime('%Y-%m-%d')<CR>   " インサートモード時に日付入力

