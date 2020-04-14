" resource https://vim.fandom.com/wiki/Searching
set hlsearch	" enable search highlighting
set incsearch	" incremental search that shows partial matches
set ignorecase	" ignore case when searching
set smartcase	" automatically switch to case-sensitive when search
                " query contains an uppercase letter
                " NOTE: applies only when typing
                " NOTE: not when '*' or '#' or 'gd'
set magic       " for regular expressions turn magic on

" clear search highlight
nnoremap <silent><leader>/ :nohlsearch<cr>
