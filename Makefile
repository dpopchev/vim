# set bash as default shell
SHELL := /usr/bin/env bash

# common flags for rsync aliases
RSYNC_COMMON_FLAGS := --quiet --recursive --progress
RSYNC_COMMON_FLAGS += --exclude 'tmp'
RSYNC_COMMON_FLAGS += --exclude '.netrwhist'
RSYNC_COMMON_FLAGS += --exclude 'colors'
RSYNC_COMMON_FLAGS += --exclude 'plugin'

# install means to create exact copy
# which includes deleting files not existing in the source
INSTALL := rsync
INSTALL += $(RSYNC_COMMON_FLAGS)
INSTALL += --delete

# as install, but do not delete non-existing files
# and overwrite only those who are newer
SYNC := rsync
SYNC += $(RSYNC_COMMON_FLAGS)
SYNC += --update

# path for the source of config files
MKFILE_PATH := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

# source of the config files and etc
SRC_PATH    := $(MKFILE_PATH)/src
SRC_CONFIG  := $(SRC_PATH)/config

# destination path for vimrc and its direcotry tree
DST_PATH    := ${HOME}/.vim
DST_TMP	    := $(DST_PATH)/tmp
DST_CONFIG  := $(DST_PATH)/config
DST_COLOR   := $(DST_PATH)/colors
DST_PLUGIN  := $(DST_PATH)/plugin

# to decouple the dependency of creating vimrc and installing vim modules
# the existing *.vim files are stored as phony targets
DST_CONFIG_FILES := $(wildcard $(SRC_CONFIG)/*.vim)
DST_CONFIG_FILES := $(patsubst $(SRC_CONFIG)/%,$(DST_CONFIG)/%,$(DST_CONFIG_FILES))
DST_CONFIG_FILES := $(filter-out $(DST_CONFIG)/Init.vim,$(DST_CONFIG_FILES))
.PHONY: $(DST_CONFIG_FILES)

# vimrc separators
LINE_PREFIX    = \"
LINE_SEPARATOR = $(LINE_PREFIX)
LINE_SEPARATOR += $(shell printf '%.s-' {1..76})

# make sure to get the latest versions of the plugins and color schemes
DOWNLOAD := wget --quiet --output-document
COLORSCHEMES_DOWNLOAD := $(DOWNLOAD) $(DST_COLOR)
COLORSCHEMES :=
include colorschemes.mk
.PHONY: $(COLORSCHEMES)

PLUGINS_DOWNLOAD := $(DOWNLOAD) $(DST_PLUGIN)
PLUGINS :=
include plugins.mk
.PHONY: $(PLUGINS)

# automate the repetitive process of filling the vimrc file with config paths
define echo_config
	@echo "$(LINE_PREFIX) start $(notdir $(basename $(1)))" >> ${HOME}/.vimrc
	@echo $(LINE_SEPARATOR) >> ${HOME}/.vimrc
	@echo "source $(1)" >> ${HOME}/.vimrc
	@echo $(LINE_SEPARATOR) >> ${HOME}/.vimrc
	@echo "$(LINE_PREFIX) end $(notdir $(basename $(1)))" >> ${HOME}/.vimrc
	@echo "" >> ${HOME}/.vimrc
endef

# rule names with brief description
#	install	 : installs the configs to destination directory
#   		   and creates corresponding vimrc
#
#   	update	 : update the destination config files with the ones present in
#   		   $(SRC_CONFIGS)
#
#   	deliver	 : as update, but updates the source files
#
#  	vimrc    : generates the vimrc based on delivered configs to $(DST_CONFIGS)
#		   it will make a backup of the old vimrc
#
#	colorscheme : download the colorschmes
#
#	plugin	: download plugins

.PHONY: install update deliver vimrc vimrc_reset all colorscheme plugin
.DEFAULT_GOAL := all

install:
	@[[ -d $(DST_PATH) ]] && $(INSTALL) $(DST_PATH)/ $(DST_PATH)_backup/ || :
	@$(INSTALL) $(SRC_PATH)/ $(DST_PATH)/
	@mkdir -p $(DST_TMP)
	@mkdir -p $(DST_COLOR)
	@mkdir -p $(DST_PLUGIN)

update:
	@$(SYNC) $(SRC_PATH)/ $(DST_PATH)/

deliver:
	@$(SYNC) $(DST_PATH)/ $(SRC_PATH)/

vimrc_reset:
	@# if .vimrc exists in user home make a backup in .vim/tmp/; else do nothing
	@[[ -f ${HOME}/.vimrc ]] \
	    && mv ${HOME}/.vimrc $(DST_TMP)/vimrc.bk_$(shell date +%Y%M%d%H%M) \
	    || :

	@# create an empty vim config file
	@echo -n "" > ${HOME}/.vimrc

	@# Init vim config should be the first entry
	$(call echo_config,$(DST_CONFIG)/Init.vim)

vimrc: vimrc_reset $(DST_CONFIG_FILES)

# all vim configs are handled with this rule
$(DST_CONFIG_FILES):
	$(call echo_config,$@)

# each colorscheme is an separate recipe
colorscheme: $(COLORSCHEMES)

$(COLORSCHEMES):
	@$(COLORSCHEMES_DOWNLOAD)/$@.vim $(COLORSCHEME_URL_$@) || \
	    echo '$(@) colorscheme download failed'

# each plugins is an separate recipe
plugin: $(PLUGINS)

$(PLUGINS):
	@$(PLUGINS_DOWNLOAD)/$@.vim $(PLUGIN_URL_$@) || \
	    echo '$(@) plugin download failed'

# default goal is to install the configs from source and generate
# source based on them vimrc
all: install vimrc colorscheme plugin
