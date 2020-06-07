"set complete-=i     " limit the files searched for auto-complted
"set lazyredraw      " dont update screen during macro and script execution
"set ttyfast         " improves redrawing on newer computers
set t_ut=            " fix highlight problem on win 10 wls
set t_BE=            " remove extra characters when shift+insert

" CTRLP {{{
" build in netwr quick configs and shortcuts
" create file tree in the current directory
"let g:netrw_browse_split = 2
"let g:vrfr_rg = 'true'
"let g:netrw_banner = 0
"let g:netrw_winsize = 25
"nnoremap <leader>t :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
" lets use NERDtree plugin instead of build in file browser
nnoremap <leader>t :NERDTreeToggle<cr>
" in case I want to switch
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" }}} end CTRLP

" NERDCommenter {{{
" quick mapping recap
"   <leader>ci  -- invert comments
"   <leader>cy  -- yank the lines and then comment them
"   <leader>c$  -- comment from cursor to EOL
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

"Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" in case of mixed selection NERD will nest the comments
nnoremap <leader>c :call NERDComment(0,"nested")<cr>
vnoremap <leader>c :call NERDComment(0,"nested")<cr>

" when we have nested comments we need specify the action
nnoremap <leader><leader>c :call NERDComment(0,"uncomment")<cr>
vnoremap <leader><leader>c :call NERDComment(0,"uncomment")<cr>

" add comment deliminter at EOL and enter insert mode after it
nnoremap <leader>ca :call NERDComment(0,"append")<cr>
vnoremap <leader>ca :call NERDComment(0,"append")<cr>

" }}} end NERDCommenter

" show/hide Undotree plugin
nnoremap <leader>u :UndotreeToggle<cr>

" vim-man {{{
" open man page under cursor in horizontal/vertical split
map <leader>k <Plug>(Man)
map <leader>v <Plug>(VMan)
" open man page for word under cursor in a horizontal split

" }}}

" CtrlP plugin {{{
" fuzzy search files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar*,*.rar     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
nnoremap <leader>o :CtrlP<cr>

" }}} end Ctrlp recommend options

" Rainbow plugin
" rainbow plugin brackets activate globally
let g:rainbow_active = 1

" completor {{{
" jedi completion
" let g:completor_python_binary = '/path/to/python/with/jedi/installed'
" other languages completion

" completor tries to not overwrite the config completeopt, so use the one below
" let g:completor_complete_options = 'menuone,noselect,preview'

" completor actions
" jump to definition
noremap <leader>gd :call completor#do('definition')<CR>
" show documentation
noremap <leader>gk :call completor#do('doc')<CR>
" format code
noremap <leader>g= :call completor#do('format')<CR>
" hover info
noremap <leader>gi :call completor#do('hover')<CR>

" maybe one would like to format the file after every buffer write?
" do it with something like
" autocmd BufWritePost *.go :call completor#do('format')
" }}}

" syntastic {{{
if match(&runtimepath, 'MY-PLUGIN') != -1
    " :lnxet and lprevious will go around the erros;
    " get syntastic status with :SyntasticInfo
    nnoremap <leader>lj :lnext<cr>
    nnoremap <leader>lk :lprevious<cr>

    " recommend
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    " hide error list by default; show it with :Error
    let g:syntastic_always_populate_loc_list = 0
    let g:syntastic_auto_loc_list = 0
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    " change symbols if you want
    " let g:syntastic_error_symbol = '❌'
    " let g:syntastic_style_error_symbol = '⁉️'
    " let g:syntastic_warning_symbol = '⚠️'
    " let g:syntastic_style_warning_symbol = '💩'

    highlight link SyntasticErrorSign SignColumn
    highlight link SyntasticWarningSign SignColumn
    highlight link SyntasticStyleErrorSign SignColumn
    highlight link SyntasticStyleWarningSign SignColumn

    " set which checker to be used with following syntax
    " let g:syntastic_<filetype>_checkers = ['<checker-name>']
    let g:syntastic_python_checkers = ['pylint']
    let g:syntastic_perl_checkers = ['perl']
    let g:syntastic_sh_checkers = ['shellcheck']
endif
" }}}

" jedi-vim {{{
" jeid installation https://github.com/davidhalter/jedi
" Completion <C-Space>
" Goto assignment <leader>g (typical goto function)
" Goto definition <leader>d (follow identifier as far as possible, includes imports and statements)
" Goto (typing) stub <leader>s
" Show Documentation/Pydoc K (shows a popup with assignments)
" Renaming <leader>r
" Usages <leader>n (shows all the usages of a name)
" Open module, e.g. :Pyimport os (opens the os module)
" }}}

" buftabline {{{
set hidden
nnoremap <leader>L :bnext<CR>
nnoremap <leader>H :bprev<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bb :ls<CR>
" }}}

" load/unload plugins installed as described below
" https://opensource.com/article/20/2/how-install-vim-plugins
