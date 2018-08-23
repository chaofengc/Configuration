"--------------------------------------------------------------------------------
" Vim configuration of fly-cfchen
" Last Modified:    2017-08-14
"--------------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Color and Theme
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
" AutoComplete and Program Tools
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tell-k/vim-autoflake'
" Plugin 'tell-k/vim-autopep8'
Plugin 'Chiel92/vim-autoformat'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/vim-easy-align'
" Markdown Tools
" Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'terryma/vim-smooth-scroll'
call vundle#end()            " required

"------------------------------------
" Plugin Settings  
"------------------------------------
    let mapleader=" "
    
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
    let NERDTreeWinSize=30

    let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
    let NERDTreeShowBookmarks=1
    let NERDTreeWinPos="left"
    set encoding=utf-8
    nmap <F3> :NERDTreeToggle<cr>
    nmap <leader>m :NERDTreeToggle<cr> 
    
    " autocmd VimEnter * set winfixwidth
  " Tagbar
    let g:tagbar_width=25
    let g:tagbar_autofocus=1
    " let g:tagbar_compact = 1
    " let g:tagbar_sort = 0
    nmap <F4> :TagbarToggle<CR>
    nmap <leader>t :TagbarToggle<CR>
  "  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    nmap <F6> :NERDTreeToggle<CR> :Tagbar<CR> 
  
  " airline
    set re=1  "Prevent airline to slow down vim
    set ttyfast
    set lazyredraw
    "let g:airline_theme="wombat"
    " let g:airline_theme="luna"
    let g:airline_theme="solarized"
    let g:airline_solarized_bg='dark'
    let g:airline_powerline_fonts = 0 
    " old vim-powerline symbols
    if !exists('g:airline_symbols')
            let g:airline_symbols = {}
        endif
    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = ''
    let g:airline_right_sep = '«'
    let g:airline_right_sep = ''
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.maxlinenr = '㏑'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    " let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.notexists = '∄'
    let g:airline_symbols.whitespace = 'Ξ'

    
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1
    "let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
    " nnoremap <S-TAB> :bp<CR>  
    let g:airline#extensions#whitespace#enabled = 0
    let g:airline#extensions#whitespace#symbol = '!'

    " Buffer config
    set hidden
    nnoremap <TAB> :bn<CR>
    nmap <leader>b :enew<cr>
    " Move to the next buffer
    nmap <leader>l :bnext<CR>
    " " Move to the previous buffer
    nmap <leader>h :bprevious<CR>"
    " Close the current buffer and move to the previous one
    " This replicates the idea of closing a tab
    nmap <leader>bq :bp <BAR> bd #<CR>
    "" Show all open buffers and their status
    nmap <leader>bl :ls<CR>

  " indentLine
    let g:indentLine_char='┆'
    let g:indentLine_enabled = 1

  " autopep8 \
    " autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
    " let g:autopep8_disable_show_diff=1
    noremap <F8> :Autoformat<CR>
    let g:autoformat_verbosemode=1
    let g:autoflake_remove_all_unused_imports=1
    let g:autoflake_remove_unused_variables=1

  " Easy Align
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)

  " Fugitive
    nmap gw :Gwrite<CR> 
    nmap gb :Gblame<CR>
    nmap gs :Gstatus<CR>
    nmap gd :Gdiff<CR>

  " NerdCommenter
    let g:NERDSpaceDelims=1
  " Markdown 
    let g:vim_markdown_folding_disabled = 1
    let g:vim_markdown_no_default_key_mappings = 1
    let g:vim_markdown_toc_autofit = 1
    let g:vim_markdown_math = 1
    let g:vim_markdown_conceal = 0
    
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
    " set completeopt=menu,menuone
    let g:ycm_min_num_of_chars_for_completion=2
    let g:ycm_complete_in_comments = 1
    let g:ycm_complete_in_strings = 1
    " let g:ycm_cache_omnifunc=0
    " let g:ycm_seed_identifiers_with_syntax=1
    " let g:ycm_collect_identifiers_from_comments_and_strings = 0
    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
    " let g:syntastic_check_on_open=1
    " let g:syntastic_enable_signs=1
    " let g:syntastic_cpp_check_header = 1
    " let g:syntastic_cpp_remove_include_errors = 1
    "Close window when complete"
    let g:ycm_autoclose_preview_window_after_completion=1
    " let g:ycm_server_python_interpreter= '/home/cfchen/anaconda2/bin/python' 
    " let g:ycm_error_symbol = '>>'
    " let g:ycm_warning_symbol = '>*'
    "Close popup menue when leave insert mode"\
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
    " youcompleteme select keys
    " let g:ycm_key_list_select_completion = ['<Down>']
    " let g:ycm_key_list_previous_completion = ['<Up>']
    " inoremap <expr> <CR>       pumvisible() ? '<C-y>' : '\<CR>'   
    " inoremap <expr> <Down>     pumvisible() ? '\<C-n>' : '\<Down>'
    " inoremap <expr> <Up>       pumvisible() ? '\<C-p>' : '\<Up>'
    " inoremap <expr> <PageDown> pumvisible() ? '\<PageDown>\<C-p>\<C-n>' : '\<PageDown>'
    " inoremap <expr> <PageUp>   pumvisible() ? '\<PageUp>\<C-p>\<C-n>' : '\<PageUp>'
    nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
    nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
    nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
    " nmap <F4> :YcmDiags<CR>
    
"------------------------------------
" General Settings  
"------------------------------------
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
  set scrolloff=10
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
    let g:solarized_termtrans = 1
    colorscheme solarized
    " colorscheme wombat256mod
    "colorscheme dracula 
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
  " autocmd BufNewFile,BufRead *.md set filetype=markdown "Markdown to HTML
  filetype on
  filetype plugin on
  filetype indent on
  au BufRead,BufNewFile *  setfiletype txt
  " Smooth scoll
  noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
  noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
  noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
  noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

"------------------------------------
" Key Map Settings  
"------------------------------------
  " window command
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
  " space and enter
  
  "Use F2 to save and exit"                       
  " noremap  <leader>wq  <Esc>:wq<CR> 
  nnoremap <leader>w <Esc>:w<CR> 
  nnoremap <leader>q <Esc>:q<CR> 
  imap <C-l> <Esc>
  "Use backspace(cmd + del in mac) to delete in normal mode" 
  nnoremap <BS> x   
"------------------------------------
" Functions 
"------------------------------------
" Spell Check
let g:myLang=0
let g:myLangList=["nospell", "en_us"]
function! ToggleSpell()
  let g:myLang=g:myLang+1
  if g:myLang>=len(g:myLangList) | let g:myLang=0 | endif
  if g:myLang==0
    setlocal nospell
  else
    execute "setlocal spell spelllang=".get(g:myLangList, g:myLang)
  endif
  echo "spell checking language:" g:myLangList[g:myLang]
endfunction

nmap <leader>s :call ToggleSpell()<CR>
