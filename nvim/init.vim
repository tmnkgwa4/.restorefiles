let g:deoplete#enable_at_startup = 1

"set up XDG environment
let g:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let g:config_home = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME

" dein {{{
let s:dein_cache_dir = g:cache_home . '/dein'

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

if &runtimepath !~# '/nvim/dein.vim'
  let s:dein_repo_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'

  " Auto Download
  if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
  endif

  " dein.vim をプラグインとして読み込む
  execute 'set runtimepath^=' . s:dein_repo_dir
endif

" dein.vim settings
let g:dein#install_max_processes = 16
let g:dein#install_progress_type = 'title'
let g:dein#install_message_type = 'none'
let g:dein#enable_notification = 1
hi MatchParen term=standout ctermbg=White ctermfg=White guibg=White guifg=White

if dein#load_state(s:dein_cache_dir)
  call dein#begin(s:dein_cache_dir)

  let s:toml_dir = g:config_home . '/nvim/dein'

  call dein#load_toml(s:toml_dir . '/plugins.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/lsp.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})
  if has('nvim')
    call dein#load_toml(s:toml_dir . '/neovim.toml', {'lazy': 1})
  endif

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}


" 行数
set number relativenumber

set noswapfile

" insertモードから抜ける
inoremap <silent> jj <ESC>
inoremap <silent> kk <ESC>

" insert モードで Alt + hjkl でカーソル移動
inoremap <A-h> <left>
inoremap <A-j> <down>
inoremap <A-k> <up>
inoremap <A-l> <right>


filetype indent on
set incsearch
set ignorecase
set shiftwidth=4
set shiftround
set autoindent smartindent
set expandtab
set smarttab
set smartcase
set termguicolors
set scrolloff=3
set autoread
set noshowmode
set inccommand=split
set ambiwidth=double

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType yaml setl tabstop=4 expandtab shiftwidth=2 softtabstop=2
autocmd FileType ruby,eruby,scss setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType ruby let &colorcolumn=join(range(81,999),",")
autocmd FileType sh,zsh setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType make setl noexpandtab
autocmd FileType html,vue setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType dockerfile setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType vim setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType toml setl tabstop=2 expandtab shiftwidth=2 softtabstop=2

autocmd BufRead,BufNewFile *.gs setfiletype javascript
autocmd FileType javascript,typescript setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType dockerfile setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

set clipboard&
set clipboard^=unnamedplus

au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

"set up the dein.vim directory
let s:dein_dir = expand('$XDG_CACHE_HOME/nvim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let g:rc_dir = expand('$XDG_CONFIG_HOME/nvim')

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " load the file which contain the plugin list
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" automatically install any plug-ins that need to be installed.
if dein#check_install()
  call dein#install()
endif
