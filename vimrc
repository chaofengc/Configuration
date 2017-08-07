"--------------------------------------------------------------------------------
" Vim configuration of fly-cfchen
" Last Modified:    2017-08-07
"--------------------------------------------------------------------------------

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Color and Theme
Plugin 'Lokaltog/vim-powerline'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
" AutoComplete and Program Tools
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tell-k/vim-autopep8'
Plugin 'scrooloose/nerdcommenter'
Plugin 'fholgado/minibufexpl.vim'

Plugin 'tpope/vim-fugitive'
call vundle#end()            " required

""""""""""""""" Plugin Settings  """""""""""""""
  " Fugitive 
    set diffopt+=vertical
    autocmd BufReadPost fugitive://* set bufhidden=delete
    " If doing a diff. Upon writing changes to file, automatically update the
    " differences
    autocmd BufWritePost * if &diff == 1 | diffupdate | endif
    autocmd User fugitive 
      \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
      \   nnoremap <buffer> .. :edit %:h<CR> |
      \ endif

  " NERD tree
    let NERDChristmasTree=0
    let NERDTreeWinSize=35
    let NERDTreeChDirMode=2
    let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']

    let NERDTreeWinPos="left"
    set encoding=utf-8
    nmap <F3> :NERDTreeToggle<cr>
    
  " Tagbar
    let g:tagbar_width=35
    let g:tagbar_autofocus=1
    nmap <F4> :TagbarToggle<CR>
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
  
  " indentLine
    let g:indentLine_char='┆'
    let g:indentLine_enabled = 1

  " autopep8 \
    autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
    let g:autopep8_disable_show_diff=1
  
  " NerdCommenter
    let mapleader='#'
    map <F5> <leader>ci <CR>
  
  " airline
    let g:airline_powerline_fonts = 1

  " CtrlP 
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    
    if executable('ag')
      " Use Ag over Grep
      set grepprg=ag\ --nogroup\ --nocolor
      " Use ag in CtrlP for listing files.
      let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
      " Ag is fast enough that CtrlP doesn't need to cache
      let g:ctrlp_use_caching = 0
      let g:ctrlp_working_path_mode = 'ra'
    endif
    map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
    map <C-n> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
  "
  " Plugin YCM settings.
    set completeopt=longest,menu
    let g:ycm_min_num_of_chars_for_completion=2
    let g:ycm_cache_omnifunc=0
    let g:ycm_seed_identifiers_with_syntax=1
    let g:ycm_complete_in_comments = 1
    let g:ycm_complete_in_strings = 1
    let g:ycm_collect_identifiers_from_comments_and_strings = 0
    let g:ycm_global_ycm_extra_conf = '/home/cfchen/.vim/.ycm_extra_conf.py'
    let g:syntastic_check_on_open=1
    let g:syntastic_enable_signs=1
    let g:syntastic_cpp_check_header = 1
    let g:syntastic_cpp_remove_include_errors = 1
    "Close window when complete"
    let g:ycm_autoclose_preview_window_after_completion=1
    let g:ycm_server_python_interpreter='/home/cfchen/anaconda2/bin/python2.7'
    "Close popup menue when leave insert mode"\
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
    " inoremap <expr> <CR>       pumvisible() ? '<C-y>' : '\<CR>'   
    inoremap <expr> <Down>     pumvisible() ? '\<C-n>' : '\<Down>'
    inoremap <expr> <Up>       pumvisible() ? '\<C-p>' : '\<Up>'
    inoremap <expr> <PageDown> pumvisible() ? '\<PageDown>\<C-p>\<C-n>' : '\<PageDown>'
    inoremap <expr> <PageUp>   pumvisible() ? '\<PageUp>\<C-p>\<C-n>' : '\<PageUp>'

""""""""""""""" general settings  """""""""""""""
  set showcmd
  set completeopt=preview,menu 
  set nocompatible
  set magic                   " open regular operation
  set clipboard+=unnamed 
  set nobackup
  set autowrite
  set noeb " no error beeze
  set confirm " show promt 
  set history=1000 "hitory record
  set noswapfile
  set gdefault
  set viminfo+=!
  set iskeyword+=_,$,@,%,#,-
  set linespace=0
  set whichwrap+=<,>,h,l
  set scrolloff=5
  set mouse=a       
" GUI status, tools, menu bar
  "" syntax
    syntax on
    let g:tex_flavor = "latex"
  "" theme: solarized options 
    set t_Co=256  " For Ubuntu
    set term=screen-256color
    syntax enable
    set background=dark
    let g:solarized_termcolors=256
  " let g:solarized_termtrans = 1
  colorscheme solarized
  "" GUI status
    set cursorline              " emphasize current line
    set statusline+=%{fugitive#statusline()} "  Git Hotness
    set statusline+=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
  "  set relativenumber
    set number " line number
    set laststatus=2 " Always display the status line
  " fold and unfold
    " set foldenable      
    " set foldmethod=manual   
    " set foldmethod=indent 
    " set foldcolumn=0
    " set foldlevel=3 
  " indent
    set autoindent
    set cindent
    set smartindent
    set backspace=2
  " search and replace
	set ignorecase smartcase
	set hlsearch
	set incsearch
  "tab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set smarttab
  "split 
	set splitbelow
	set splitright
  " autocmd and file type
  autocmd BufNewFile,BufRead *.md set filetype=markdown "Markdown to HTML
  filetype on
  filetype plugin on
  filetype indent on
  au BufRead,BufNewFile *  setfiletype txt

""""""""""""""" mapping """""""""""""""""""
  " window command
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
  " space and enter
  map <Space> i<Space><ESC>
  map <Enter> o<ESC>
  
  noremap! <C-F> <ESC> li
  " F2 save
  noremap <F2> <Esc>:w<CR>
  inoremap <F2> <Esc>:w<CR>
  map <S-s> <Esc>:wq<CR>
  map <S-q> <Esc>:q<CR>

"""""""""" Function""""""""""""""""
" TODO
