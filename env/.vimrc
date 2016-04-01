colorscheme LastNight
set t_Co=256
syntax on

" set list
" set listchars=tab:>.,trail:.,extends:#,nbsp:.

set hlsearch		" highlight search terms
set incsearch		" show search matches as you type

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set tabstop=4		" a tab is four spaces
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set backspace=indent,eol,start  " allow backspacing over everything in insert mode

set title
set mouse=i

set nobackup
set noswapfile




" set tabstop=2 
" set smarttab 
" set wrap 
" set ai 
" set listchars=tab:·· 
" set list 
" set ffs=unix,dos,mac 
set fencs=utf-8,cp1251,koi9-r,ucs-2,cp866
" setup encryption alghorithm for using with option -x
set cm=blowfish

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

" Vundle
set nocompatible
filetype off 

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

filetype plugin indent on

Plugin 'itchyny/lightline.vim'

filetype plugin indent on
autocmd filetype python set expandtab

set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"-":""}',
      \ },
      \ 'separator': { 'left': '<', 'right': '>' },
      \ 'subseparator': { 'left': '<', 'right': '>' }
      \ }
