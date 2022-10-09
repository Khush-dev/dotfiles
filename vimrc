"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"                                                                              "
"                       __   _ _ _ __ ___  _ __ ___                            "
"                       \ \ / / | '_ ` _ \| '__/ __|                           "
"                        \ V /| | | | | | | | | (__                            "
"                         \_/ |_|_| |_| |_|_|  \___|                           "
"                                                                              "
"                                                                              "
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

let $vimhome=fnamemodify(resolve(expand("~/.vimrc")), ':p:h')
let $vundle=$vimhome."/bundle/Vundle.vim"
let mapleader=" "
" Be iMproved
set nocompatible

"=====================================================
"" Vundle settings
"=====================================================
filetype off
set rtp+=$vundle
call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'               " let Vundle manage Vundle, required

    "-------------------=== Code/Project navigation ===-------------
    " Plugin 'scrooloose/nerdtree'                " Project and file navigation
    Plugin 'mcchrish/nnn.vim'
    Plugin 'majutsushi/tagbar'                  " Class/module browser
    " Plugin 'kien/ctrlp.vim'                     " Fast transitions on project files

    "-------------------=== Other ===-------------------------------
    Plugin 'bling/vim-airline'                  " Lean & mean status/tabline for vim
    Plugin 'vim-airline/vim-airline-themes'     " Themes for airline
    Plugin 'Lokaltog/powerline'                 " Powerline fonts plugin
    Plugin 'fisadev/FixedTaskList.vim'          " Pending tasks list
    Plugin 'rosenfeld/conque-term'              " Consoles as buffers
    Plugin 'tpope/vim-surround'                 " Parentheses, brackets, quotes, XML tags, and more
    Plugin 'tpope/vim-fugitive'                 " Git Support
    Plugin 'flazz/vim-colorschemes'             " Colorschemes
    Plugin 'easymotion/vim-easymotion'          " Easy Motion

    "-------------------=== Snippets support ===--------------------
    Plugin 'garbas/vim-snipmate'                " Snippets manager
    Plugin 'sirver/ultisnips'
    Plugin 'MarcWeber/vim-addon-mw-utils'       " dependencies #1
    Plugin 'tomtom/tlib_vim'                    " dependencies #2
    Plugin 'honza/vim-snippets'                 " snippets repo

    "-------------------=== Languages support ===-------------------
    Plugin 'tpope/vim-commentary'               " Comment stuff out
    Plugin 'mitsuhiko/vim-sparkup'              " Sparkup(XML/jinja/htlm-django/etc.) support
    Plugin 'Rykka/riv.vim'                      " ReStructuredText plugin
    Plugin 'Valloric/YouCompleteMe'             " Autocomplete plugin

    "-------------------=== Python  ===-----------------------------
    Plugin 'python-mode/python-mode'                   " Python mode (docs, refactor, lints...)
    Plugin 'scrooloose/syntastic'               " Syntax checking plugin for Vim
    Plugin 'psf/black'                                 " Linting

    "-------------------=== Tex  ===-----------------------------
    Plugin 'lervag/vimtex'                      " Syntax highlighting + more in tex
    Plugin 'KeitaNakamura/tex-conceal.vim'      " Conceal text and view symbol in tex
    Plugin 'gillescastel/latex-snippets'         "latex snippets
    Plugin 'ervandew/supertab'                  "SuperTab for overloading tab
    
call vundle#end()                           " required
filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
"" General settings
"=====================================================
syntax enable                               " syntax highlight

set t_Co=256                                " set 256 colors
colorscheme wombat256mod                    " set color scheme

set number                                  " show line numbers
set ruler
set ttyfast                                 " terminal acceleration

set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code

set cursorline                              " shows line under the cursor's line
set showmatch                               " shows matching part of bracket pairs (), [], {}

set enc=utf-8	                            " utf-8 by default

set nobackup 	                            " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile 	                            " no swap files

set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?

set scrolloff=10                            " let 10 lines before/after cursor during scroll

set clipboard=unnamed                       " use system clipboard

set exrc                                    " enable usage of additional .vimrc files from working directory
set secure                                  " prohibit .vimrc files to execute shell, create files, etc...

" Additional mappings for Esc (useful for MacBook with touch bar)
inoremap jj <Esc>
" inoremap jk <Esc>
" nnoremap <CapsLock> <C>
" Go back to last misspelled word and pick first suggestion.
nnoremap <silent> <leader>j <C-G>u<Esc>[s1z=`]a<C-G>u

" Select last misspelled word (typing will edit).
nnoremap <silent> <leader>k <Esc>[sve<C-G>
" inoremap <silent> <leader>k <Esc>[sve<C-G>
snoremap <silent> <leader>k <Esc>b[sviw<C-G>

" Toggle relativenumber
nnoremap <silent> <leader>r :set invrelativenumber<CR>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>


"=====================================================
"" Tabs / Buffers settings
"=====================================================
tab sball
set switchbuf=useopen
set laststatus=2
nmap <silent> <leader>' :TagbarToggle<CR>
nmap gt :bnext<CR>
nmap g<S-t> :bprev<CR>
nmap <leader>3 :b#<CR>
nmap <leader>b :ls<CR>:b<Space>
nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR> bd #<CR>

"" Search settings
"=====================================================
set incsearch	                            " incremental search
set hlsearch	                            " highlight search results

"=====================================================
"" AirLine settings
"=====================================================
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled=1
let g:airline_symbols = {}
let g:airline_symbols.maxlinenr=''

"=====================================================
"" TagBar settings
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=36
" autocmd BufEnter *.py :call tagbar#autoopen(0)
autocmd FileType python,c,cpp TagbarOpen

""=====================================================
""" NERDTree settings
""=====================================================
"let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
"let NERDTreeWinSize=38
"autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
"nmap " :NERDTreeToggle<CR>

"=====================================================
"" NNN settings
"=====================================================
" let g:nnn#command = 'nnn -d'
let $EDITOR="vim" 
" " If a file is specified, start NnnExplorer and move the cursor to the file window.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() > 0 || exists("s:std_in") | call nnn#explorer() | wincmd p | stopinsert | endif

" Exit Vim if NnnExplorer is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && &filetype ==# 'nnn' | quit! | endif


"=====================================================
"" SnipMate settings
"=====================================================
let g:snippets_dir='~/.vim/vim-snippets/snippets'
let g:snipMate = {'snippet_version' : 1}

"=====================================================
"" Riv.vim settings
"=====================================================
let g:riv_disable_folding=1

"=====================================================
"" Python settings
"=====================================================

" python executables for different plugins
let g:pymode_python='python3'
let g:syntastic_python_python_exec='python3'

" rope
let g:pymode_rope=1
let g:pymode_rope_completion=0
let g:pymode_rope_complete_on_dot=0
let g:pymode_rope_auto_project=0
let g:pymode_rope_enable_autoimport=0
let g:pymode_rope_autoimport_generate=0
let g:pymode_rope_guess_project=0

" documentation
let g:pymode_doc=1
let g:pymode_doc_bind='<leader>ff'

" lints
let g:pymode_lint=1
nmap <Leader>l :PymodeLintAuto<CR>

" virtualenv
let g:pymode_virtualenv=1

" breakpoints
let g:pymode_breakpoint=1
let g:pymode_breakpoint_bind='<leader>bb'

" syntax highlight
let g:pymode_syntax=1
let g:pymode_syntax_slow_sync=1
let g:pymode_syntax_all=1
let g:pymode_syntax_print_as_function=g:pymode_syntax_all
let g:pymode_syntax_highlight_async_await=g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_self=g:pymode_syntax_all
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_string_formatting=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
let g:pymode_syntax_string_format=g:pymode_syntax_all
let g:pymode_syntax_string_templates=g:pymode_syntax_all
let g:pymode_syntax_doctests=g:pymode_syntax_all
let g:pymode_syntax_builtin_objs=g:pymode_syntax_all
let g:pymode_syntax_builtin_types=g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions=g:pymode_syntax_all
let g:pymode_syntax_docstrings=g:pymode_syntax_all

" highlight 'long' lines (>= 81 symbols) in python files
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python,rst,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python,rst,c,cpp match Excess /\%89v.*/
    autocmd FileType python,rst,c,cpp set nowrap
    autocmd FileType python,rst,c,cpp set colorcolumn=88
augroup END

" Spell check on for txt files
autocmd FileType txt,rst,md,tex set spell

" code folding
let g:pymode_folding=0

" pep8 indents
let g:pymode_indent=1

" code running
let g:pymode_run=1
let g:pymode_run_bind='<F5>'

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_wq=0
let g:syntastic_aggregate_errors=1
let g:syntastic_loc_list_height=5
let g:syntastic_error_symbol='X'
let g:syntastic_style_error_symbol='X'
let g:syntastic_warning_symbol='x'
let g:syntastic_style_warning_symbol='x'
let g:syntastic_python_checkers=['flake8', 'pydocstyle', 'python3']

" Vim Easy-motion
nmap <Leader>f <Plug>(easymotion-overwin-f)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" YouCompleteMe
set completeopt-=preview

let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0

" YCM UltiSnips issue
" let g:UltisnipsExpandTrigger="jk"
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" VimTex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

function! Compile()
    silent !pdflatex -synctex=1 %
    redraw!
    " !echo %
endfunction

"augroup latex
"  autocmd! CursorMovedI *.tex call Synctex()
"  autocmd! BufWritePost,BufReadPre *.tex :call Compile()
"  "silent !pdflatex % | redraw
"augroup end

"=====================================================
"" SyncTex
function! Synctex()
    let vimura_param = " --synctex-forward " . line('.') . ":" . col('.') . ":" . expand('%:p') . " " . substitute(expand('%:p'),"tex$","pdf", "")
    if has('nvim')
        call jobstart("vimura neovim" . vimura_param)
    else
        exe "silent !vimura vim" . vimura_param . "&"
    endif
    redraw!
endfunction
map <leader>v :call Synctex()<cr>

nmap <leader>g :YcmCompleter GoTo<CR>
nmap <leader>d :YcmCompleter GoToDefinition<CR>

" Recovery stuff
set undofile
set undodir=~/.vim/undodir
let g:auto_save = 1
augroup autosave
    autocmd!
    autocmd BufRead * if &filetype == "" | setlocal ft=text | endif
    autocmd FileType * autocmd TextChanged,InsertLeave <buffer> if &readonly == 0 | silent write | endif
augroup END
