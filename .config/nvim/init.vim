set number             "行番号を表示
set autoindent         "改行時に自動でインデントする
set tabstop=2          "タブを何文字の空白に変換するか
set shiftwidth=2       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set smarttab
set autoindent
set nowrap             "長い行を折り返さない
set clipboard+=unnamed  "yank した文字列をクリップボードにコピー
set clipboard+=unnamedplus
set hls                "検索した文字をハイライトする
set smartcase
set incsearch
set showtabline=2       " タブライン出していこうぜ
let mapleader = "\<Space>"
noremap <Leader>r :source ~/.config/nvim/init.vim<CR>:noh<CR>:echo'reload!'<CR>

"------
" 最後まで飛ぶ
nnoremap <Leader>l $
nnoremap <Leader>h ^
vnoremap <Leader>l $
vnoremap <Leader>h ^

" 折り返し行移動(表示されている行で移動できる)
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nmap <Leader>y byw
nmap <Leader>v bve

" jjでノーマルモードに移動する&保存する
inoremap jj <ESC>
noremap <Leader>w :w<CR>

" <C-e>,<C-w>でスクロール
noremap <C-w> <C-y>
noremap <C-y> <C-w>

" 検索終わりのハイライトを消す
" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
nnoremap == ggvG=g;
nnoremap <Leader>= :%s/	/  /g

:command! Q q!

"--Undoをできるように
if has('persistent_undo')
  set undodir=~/.config/nvim/undo
  set undofile
endif

nnoremap <leader><C-i> :tabnext<CR>

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/fill/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/fill/.cache/dein')
  call dein#begin('/home/fill/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/fill/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#load_toml('~/.config/nvim/coc.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/lightline.toml', {'lazy': 0})
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

