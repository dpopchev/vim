# vim config

The purpose of this project is to provide a nice and portable way of transferring
vim configuration to various stations and keep them in sync to the latest
configurations. 

## Getting started

### Prerequisites 

Currently the configs are tested against **vim** with following features:

```
dimitar@kaktus ~ $ vim --version
VIM - Vi IMproved 8.1 (2018 May 18, compiled Dec 14 2019 15:48:59)
Included patches: 1-648
Modified by Gentoo-8.1.0648-r1
Compiled by dimitar@kaktus
Huge version without GUI.  Features included (+) or not (-):
+acl               +extra_search      +mouse_netterm     +tag_old_static
+arabic            +farsi             +mouse_sgr         -tag_any_white
+autocmd           +file_in_path      -mouse_sysmouse    -tcl
+autochdir         +find_in_path      +mouse_urxvt       +termguicolors
-autoservername    +float             +mouse_xterm       -terminal
-balloon_eval      +folding           +multi_byte        +terminfo
+balloon_eval_term -footer            +multi_lang        +termresponse
-browse            +fork()            -mzscheme          +textobjects
++builtin_terms    +gettext           +netbeans_intg     +textprop
+byte_offset       -hangul_input      +num64             +timers
+channel           +iconv             +packages          +title
+cindent           +insert_expand     +path_extra        -toolbar
+clientserver      +job               -perl              +user_commands
+clipboard         +jumplist          +persistent_undo   +vartabs
+cmdline_compl     +keymap            +postscript        +vertsplit
+cmdline_hist      +lambda            +printer           +virtualedit
+cmdline_info      +langmap           +profile           +visual
+comments          +libcall           -python            +visualextra
+conceal           +linebreak         -python3           +viminfo
+cryptv            +lispindent        +quickfix          +vreplace
-cscope            +listcmds          +reltime           +wildignore
+cursorbind        +localmap          +rightleft         +wildmenu
+cursorshape       -lua               -ruby              +windows
+dialog_con        +menu              +scrollbind        +writebackup
+diff              +mksession         +signs             +X11
+digraphs          +modify_fname      +smartindent       +xfontset
-dnd               +mouse             +startuptime       -xim
-ebcdic            -mouseshape        +statusline        -xpm
+emacs_tags        +mouse_dec         -sun_workshop      +xsmp_interact
+eval              +mouse_gpm         +syntax            +xterm_clipboard
+ex_extra          -mouse_jsbterm     +tag_binary        -xterm_save
```

### Installing

Install the usual way

```
git clone https://github.com/dpopchev/vim.git
cd vim
make 
```

#### make options

**make** gives several options to handle and maintain the local project  

- all

  Default goal. It will execute **install** and **vimrc** recipes.
  
- install

  If there is an existing **~/.vim/** directory make a backup with the name
  **~/.vim_backup**
  Copy the content of the project **src/** to newly created **~/.vim/**.
  Create **~/.vim/tmp** for auxiliary vim files.

- update

  Only the those files in the project **src/**, which are newer than those in
  the existing **~/.vim/**.

- deliver

  As **update**, but from **~/.vim/** to project **src/**.

- vimrc

  Creates an source based vim config, i.e. adds 'source \~/.vim/config/\*.vim'
  entries for the existing files in vimrc.
  It will make a backup of the existing **\~/.vimrc** in **\~/.vim/tmp/**.

### vim themes 

I have included some external themes, but they may not be up to date. To
download the latest, pelase follow the links below.

The default colorscheme is set by the `colorscheme_def` variable in
**UserInterface.vim**
    
- [gruvbox](https://github.com/morhetz/gruvbox)

- [molokai](https://github.com/tomasr/molokai) 

- [monokain](https://github.com/flazz/vim-colorschemes/blob/master/colors/monokain.vim)

- [tender](https://github/com/jacoborus/tender.vim)

- [rdark](https://raw.githubusercontent.com/flazz/vim-colorschemes/master/colors/rdark-terminal.vim)

### shortcuts

Find below an extensive, but not full, table containing the shortcut combination
and its respective mode with brief description on what it does.

| Mode | Shortcut | Command | Description |
|:---:|:---:|:---|---:|
| None | \<S-k\> | \<Nop\> | Disable built in search in man pages |
| insert | \<C-n\> | pumvisible() ? '\<C-n\>' : | Better navigation in completion menu |
| insert | \<C-p\> | pumvisible() ? '\<C-p\>' : | Better navigation in completion menu  |
| insert | \<CR\> | pumvisible() ? "\\<C-y\>" : "\\<C-g\>u\\<CR\>" | Enable selection of completion menu entry via Enter |
| insert | \<M-,\> | pumvisible() ? '\<C-n\>' : | Improve completion menu selection |
| insert | j | ((pumvisible())?("\\<C-n\>"):("j")) | enable vim style navigation in completion menu|
| insert | k | ((pumvisible())?("\\<C-p\>"):("k")) |  enable vim style navigation in completion menu|
| insert | \<leader\>\<leader\> | \<Esc\> | Map ESC to double leader tap |
| normal | U | :call EchoWARN("check caps lock")\<CR\> | warn when tapping capital u  |
| normal | \<C-j\> | m\`:silent +g/\m^\s*$/d\<CR\>\`\`:noh\<CR\> | remove blank line below |
| normal | \<C-k\> | m\`:silent -g/\m^\s*$/d\<CR\>\`\`:noh\<CR\> | remove blank line above |
| normal | \<C-j\>\<C-j\> | :set paste\<CR\>m\`o\<Esc\>\`\`:set nopaste\<CR\> | add blank line below |
| normal | \<C-k\>\<C-k\> | :set paste\<CR\>m\`O\<Esc\>\`\`:set nopaste\<CR\> | add blank line above |
| normal | \<leader\>/ | :nohlsearch\<cr\> | clear search highlight  |
| normal | \<leader\>\<return\> | :source $MYVIMRC\<cr\> | reload vimrc file  |
| normal | \<leader\>d | "_d\<cr\> | delete with sending selection to black hole register |
| normal | \<leader\>c | "_c\<cr\> | as above, but start inserting |
| normal | \<leader\>p | :set invpaste\<cr\> | toggle paste mode |
| normal | \<leader\>q | :q\<cr\> | quit  |
| normal | \<leader\>w | :w\<cr\> | write buffer |
| visual | \<C-c\> | :call CopyToClipboard()\<cr\> | copy to clipboard, if vim feature is compiled |
| visual | \<leader\>\<leader\> | \<Esc\> | map ESC to double leader tap |
| visual | \> | \>gv | shift visual selection to the right |
| visual | \< | \<gv | shift visual selection to the left |

The table is generated by the script below.
NOTE: table needs manual filling and editing, the script is only providing the
mappings found in the config files. 

```
printf '| Mode | Shortcut | Command | Description |\n|:---:|:---:|:---|---:|\n' \
&& find ~/.vim/ -type f -name "*.vim" \
| xargs sed -e '/^\"/d;'\
            -e '/map/!d;'\
            -e 's/nore//;'\
            -e 's/^i/| insert |/;'\
            -e 's/^v/| visual |/;'\
            -e 's/^n/| normal |/;'\
            -e 's/map//;'\
            -e '/autocmd/d;'\
            -e 's/ <expr>//;'\
            -e 's/<silent>//;'\
            -e 's/ / | /4;'\
            -e 's/$/ | /;'\
            -e 's/$/ | /;'\
            -e '/^[^\(insert|normal|visual\)]/{s/^[[:blank:]]/None | /};'\
            -e 's/</\\</g;'\
            -e 's/>/\\>/g;'\
            -e 's/`/\\`/g;'\
| sort -k 1
```
It does the following

1. prints the table header

1. searches for all vim modules in the home vim directory

1. filters out all lines which are

    - a vim comment

    - DO NOT have 'map' sub string in them

    - cleans an 'nore' substring to make it easier to

      - replace leading line 'i' with 'insert' with added column separator '|'

      - replace leading line 'v' with 'visual' with added column separator '|'

      - replace leading line 'n' with 'normal' with added column separator '|'

      - clean all 'map' substrings
    
    - delete all lines containing 'autocmd' substring

    - clean up '\<expr\>/\<silent\>' substring, specific use case

    - add a table separator on 

      - the third blank space w.r.t. begining of the line

      - append a colum separator at the end of the line

    - escape '<' and '>'  and '\`' characters by adding leading \

1. sort them w.r.t. to first word
