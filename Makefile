# set bash as default shell
SHELL := /usr/bin/env bash

# common flags for rsync aliases
RSYNC_COMMON_FLAGS := --quiet --recursive --progress
RSYNC_COMMON_FLAGS += --exclude 'tmp'
RSYNC_COMMON_FLAGS += --exclude '.netrwhist'
RSYNC_COMMON_FLAGS += --exclude 'pack'

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
DST_PATH   := ${HOME}/.vim
DST_TMP    := $(DST_PATH)/tmp
DST_CONFIG := $(DST_PATH)/config
DST_PLUGIN := $(DST_PATH)/pack/plugins/opt

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

# get the plugins dynamically
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
#   	srcTOdst	 : update the destination config files with the ones present in
#   		   $(SRC_CONFIGS)
#
#   	dstTOsrc	 : as update, but updates the source files
#
#  	vimrc    : generates the vimrc based on delivered configs to $(DST_CONFIGS)
#		   it will make a backup of the old vimrc
#
#	plugin	: download plugins

.PHONY: install srcTOdst dstTOsrc vimrc vimrc_reset all plugins clean
.DEFAULT_GOAL := all

clean:
	@rm -rf ~/.vimrc
	@rm -rf ~/.vim/

install:
	@[[ -d $(DST_PATH) ]] && $(INSTALL) $(DST_PATH)/ $(DST_PATH)_backup/ || :
	@$(INSTALL) $(SRC_PATH)/ $(DST_PATH)/
	@mkdir -p $(DST_TMP)
	@mkdir -p $(DST_PLUGIN)

srcTOdst:
	@$(SYNC) $(SRC_PATH)/ $(DST_PATH)/

dstTOsrc:
	@$(INSTALL) $(DST_PATH)/ $(SRC_PATH)/
	@sed -i '/^packadd/d' $(wildcard $(SRC_CONFIG)/*.vim)

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

# each plugins is an separate recipe
# after their installation lets add them to the Init.vim to auot-load
plugins: $(PLUGINS) enable_plugins

.PHONY: enable_plugins
enable_plugins:
	$(foreach P,\
		$(patsubst $(DST_PLUGIN)/%/,%,$(dir $(wildcard $(DST_PLUGIN)/*/))),\
		$(file >>$(DST_CONFIG)/Misc.vim,packadd $P)\
		)

# each plugin is his own recipe
$(PLUGINS):
	@cd $(DST_PLUGIN) && git clone --depth 1 $(PLUGIN_URL_$@) || \
	    echo '$(@) plugin download failed'
	@cd $(MKFILE_PATH)

# default goal is to install the configs from source and generate
# source based on them vimrc
all: install vimrc plugins
