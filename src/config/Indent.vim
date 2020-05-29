" resource https://vim.fandom.com/wiki/Indenting_source_code

" set amount of spaces for indentation
let indent=4

" indentation without hard tabs
set expandtab           " convert tabs to 'softtabstop' amount of spaces
let &shiftwidth=indent  " affects when pressing >>, << or == and automatic indentation
let &softtabstop=indent " affects when pressing <TAB> or <BS> keys
                        " for indentation without hard tabs it should be set to 'shiftwidth'
let &tabstop=indent            " reset 'tabstop'
"set tabstop&            " reset 'tabstop'

" indentation purely hard tabs
"let &shiftwidthh=indent
"let &tabstop=indent     " change width of TAB character
"set expandtab&
"set softtabstop&

" indentation with mixed tabs and spaces
"let &shiftwidth=indent
"let &softtabstop=indent
"set expandtab&
"set tabstop&

" indentation method
set autoindent          " copy the indentation from the previus line
                                        " does not interfere with other indentation settings
"set smartindent        " automatically insert one extra level of indentation in some cases
                                        " does interfere with other indentation settings
"set cindent            " as smartindent, but more strict when comes to syntax
                                        " does interfere with other indentation settings

set shiftround          " when shifting lines, round the indentation to the nearest
                    " multiple of shiftwidht

"set smarttab           " insert tabstop number of spaces when tab

" force set expandtab; use case is if filetype plugin has been executed earlier
"augroup ForceExpandtab
    "autocmd!
    "autocmd FileType * setlocal expandtab " convert tabs to spaces
"augroup END

" pseudo indentation guidelines accomplished by highlighting the cursorcolumn
"set cursorcolumn
