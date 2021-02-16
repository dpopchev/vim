# set bash as default shell
SHELL := /usr/bin/env bash

# the important stuff
VIMRC := src/vimrc
TEMPLATES := src/templates

# directory structure
.PHONY: dirs
VIM_HOME := ${HOME}/.vim
PLUGINS_START := $(VIM_HOME)/pack/plugins/start
TMP := $(VIM_HOME)/tmp
dirs: $(PLUGINS_START) $(TMP)

$(PLUGINS_START):
	@mkdir -p $@

$(TMP):
	@mkdir -p $@

# TODO automate installation
# git clone --depth 1  --branch master  https://github.com/cameronmcnz/my-github-repo.git master-folder
PLUGIN_URL := https://github.com/jiangmiao/auto-pairs.git
PLUGIN_URL += https://github.com/tpope/vim-commentary.git
PLUGIN_URL += https://github.com/kien/ctrlp.vim.git
PLUGIN_URL += https://github.com/junegunn/goyo.vim.git
PLUGIN_URL += https://github.com/morhetz/gruvbox.git
PLUGIN_URL += https://github.com/Yggdroot/indentLine.git
PLUGIN_URL += https://github.com/itchyny/lightline.vim.git
PLUGIN_URL += https://github.com/preservim/nerdtree.git
PLUGIN_URL += https://github.com/junegunn/vim-easy-align.git
PLUGIN_URL += https://github.com/itchyny/vim-gitbranch.git
PLUGIN_URL += https://github.com/airblade/vim-gitgutter.git
PLUGIN_URL += https://github.com/RRethy/vim-illuminate.git
PLUGIN_URL += https://github.com/vim-perl/vim-perl.git
PLUGIN_URL += https://github.com/tpope/vim-repeat.git
PLUGIN_URL += https://github.com/justinmk/vim-sneak.git
PLUGIN_URL += https://github.com/tpope/vim-surround.git
PLUGIN_URL += https://github.com/nelstrom/vim-visual-star-search.git

.PHONY: install
install: dirs
	ln -fs $(realpath $(VIMRC)) ${HOME}/.vimrc
	ln -fs $(realpath $(TEMPLATES)) $(VIM_HOME)/templates
