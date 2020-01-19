"set complete-=i     " limit the files searched for auto-complted
"set lazyredraw      " dont update screen during macro and script execution
"set ttyfast         " improves redrawing on newer computers

" if $TERM is set to use 256 colors to give 256 value to t_Co
" this is a suggested way to fix faulty colors in vim
"
" nevertheless, at the end seems better to just rely on vim and TERM to figure out
"if $TERM == "xterm-256color" || $TERM == "rxvt-unicode-256color"
"        \ || $COLORTERM == "gnome-terminal"
"    set t_Co=256
"endif

" some example options for airline status bar
"let g:airline_theme = "gruvbox"
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#branch#enabled = 1
"let g:airline_powerline_fonts = 1

" overwrite the space symbol
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"
