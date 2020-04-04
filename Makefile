# set bash as default shell
SHELL := /usr/bin/env bash

# common flags for rsync aliases
RSYNC_COMMON_FLAGS := --quiet --recursive --progress

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

# destination path for vimrc and its direcotry
DST_PATH    := ${HOME}/.vim
DST_TMP	    := $(DST_PATH)/tmp
DST_CONFIG  := $(DST_PATH)/config

# to decouple the dependency of creating vimrc and installing vim modules
# the existing *.vim files are stored as phony targets
# TODO for new install it is unreasonable to expect same tree structure
# TODO should make a check if the variable is empty
DST_CONFIG_FILES := $(filter-out $(DST_CONFIG)/Init.vim,$(wildcard $(DST_CONFIG)/*.vim))
.PHONY: $(DST_CONFIG_FILES)

# vimrc separators
LINE_PREFIX    = \"
LINE_SEPARATOR = $(LINE_PREFIX)
LINE_SEPARATOR += $(shell printf '%.s-' {1..76})

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
#   		   $(DST_CONFIGS)
#   
#   	deliver	 : as update, but updates the source files
#
#  	vimrc    : generates the vimrc based on delivered configs to $(DST_CONFIGS)
#		   it will make a backup of the old vimrc

.PHONY: install update deliver vimrc vimrc_reset all
.DEFAULT_GOAL := all  

install: 
	@$(INSTALL) $(SRC_PATH)/ $(DST_PATH)/
	@mkdir $(DST_TMP)

update: 
	@$(SYNC) $(SRC_PATH)/ $(DST_PATH)/

deliver: 
	@rm -rf $(DST_TMP)
	@$(SYNC) $(DST_PATH)/ $(SRC_PATH)/

vimrc_reset: 
	@# if .vimrc exists in user home make a backup in .vim/tmp/; else do nothing
	@[ -f ${HOME}/.vimrc ] \
	    && mv ${HOME}/.vimrc $(DST_TMP)/vimrc.bk_$(shell date +%Y%M%d%H%M) \
	    || :

	@# create an empty vim config file 
	@echo -n "" > ${HOME}/.vimrc

	@# Init vim config should be the first entry
	$(call echo_config,$(DST_CONFIG)/Init.vim)

# all vim configs are handled with this rule
vimrc: vimrc_reset $(DST_CONFIG_FILES)

$(DST_CONFIG_FILES): 
	$(call echo_config,$@)

all: install vimrc

