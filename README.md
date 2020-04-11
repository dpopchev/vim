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

  Creates an source based vim config, i.e. adds 'source ~/.vim/config/*.vim'
  entries for the existing files in vimrc.
  It will make a backup of the existing **~/.vimrc** in **~/.vim/tmp/**.
