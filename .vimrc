" Vundle plugin manager setting
" set nocompatible
" filetype off
"
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
"
" Plugin 'VundleVim/Vundle.vim'
" Plugin 'Shougo/unite.vim'
" Plugin 'Shougo/vimfiler.vim'
" Plugin 'Shougo/vimproc.vim'
"
" call vundle#end()
" filetype plugin indent on
"
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

call dein#end()

" --------------------------------
" basic setting
" --------------------------------
let &t_Co=256				" 256色モード
syntax on				" シンタックスハイライト
set number				" 行番号表示
set clipboard=unnamed			" クリップボードを共用できるようにする
set laststatus=2			" ステータスライン表示
autocmd BufWritePre * :%s/\s\+$//ge	" クリップボードを共用できるようにする
inoremap <C-J> <nop>			" 日本語切り替えのctrl+Jの無効化

" --------------------------------
" unite.vim
" --------------------------------
"  画像ファイルを無視する
let s:unite_ignore_patterns='\.\(gif\|jpe\?g\|png\|webp\)$'
call unite#custom#source('file_rec', 'ignore_pattern', s:unite_ignore_patterns)

"  起動時にinsert modeに
let g:unite_enable_start_insert=1
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
" customize
" --------------------------------
nnoremap <silent> <C-l> gt	" ctrl+l 次のタブ
nnoremap <silent> <C-h> gT	" ctrl+h 前のタブ
