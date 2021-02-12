set encoding=utf-8
" shortcut para intercambiar el set list
nmap <leader>l :set list!<CR>
nmap <leader>n :set number!<CR>
nmap <leader>v :Vex
nmap <leader>s :Sex

"inserting listchars"
set listchars=tab:»\
set listchars+=eol:¬
set listchars+=extends:→
set listchars+=precedes:←
set listchars+=nbsp:°
set listchars+=trail:·

"setting IDE
set ruler
set number
set list
set history=100
set showcmd
set wildmenu
set lbr
set ai
set si
"set expandtab
set smarttab
set hlsearch
set incsearch
set ignorecase
set smartcase
set backup


match ErrorMsg '\s\+$'
"match ErrorMsg '/\s\+$\| \+\ze\t/'
"match ErrorMsg '/[^\t]\zs\t\+/'
"match ErrorMsg '/^\t*\zs \+/'
"match ErrorMsg '/\s\+\%#\@<!$/'


"Invisible character colors
"highlight NonText ctermbg=darkgreen
"highlight SpecialKey ctermbg=darkgreen
"colorscheme peachpuff
"set bg=dark

set ts=4 sts=4 sw=4

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
  " autocmd FileType python setlocal ts=3 sts=4 sw=4 noexpandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

" VimL Script
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" add all the plugins on here
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'joshdick/onedark.vim'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'kien/ctrlp.vim'
Plugin 'nvie/vim-flake8'
Plugin 'vim-syntastic/syntastic'
"Bundle 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'numirias/semshi'
Plugin 'davidhalter/jedi-vim'
" gg
call vundle#end()
filetype plugin indent on
set foldmethod=indent
set foldlevel=99
set clipboard=unnamed
"set editing-mode vi
nnoremap <space> za
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match ErrorMsg /\s\+$/

autocmd VimEnter * NERDTree

let g:jedio#use_tabs_not_buffers = 1



































if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
syntax on
colorscheme onedark
