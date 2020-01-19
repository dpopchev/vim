# set bash as default shell
SHELL := /usr/bin/env bash  

# command aliases
MKDIR	:= mkdir -p
CP 	:= cp -fr
RM	:= rm -fr

# input directory tree
MKFILE_PATH		:= $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

# .vim/ content in the MKFILE_PATH
MKFILE_SRC		:= $(MKFILE_PATH)/src
MKFILE_SRC_CONTENT	:= $(wildcard $(MKFILE_SRC)/*)

# additional install scripts are stored in here
MKFILE_INSTALL 	:= $(MKFILE_PATH)/install_scripts
# automated script to generated vimrc based on config file sourcing
GEN_VIMRC 	:= $(MKFILE_INSTALL)/generate_vimrc.sh

# tested configs are at the $(BRANCH_MASTER) branch
# while the not established/testing configs will go to $(BRANCH_DEV) branch
# the latter will be used for automated syncing 
BRANCH_MASTER 	:= master
BRANCH_DEV	:= development

# root of target vim directory tree
VIM_PATH 		:= ${HOME}/.vim
# directory tree is obtained by substituting the path
VIM_CONTENT		:= $(subst $(MKFILE_SRC),$(VIM_PATH),$(MKFILE_SRC_CONTENT))
# all config files should be stored here
VIM_CONFIG		:= $(VIM_PATH)/config
# the $(GEN_VIMRC) by appending a timestamp is creating a backup of the old vimrc
# when updating the $(MKFILE_SRC) we want to exlude those files 
VIM_UPDATE 		:= $(wildcard $(VIM_PATH)/*)
VIM_UPDATE_EXCLUDE 	:= $(wildcard $(VIM_PATH)/vimrc_????????????)
VIM_UPDATE		:= $(filter-out $(VIM_UPDATE_EXCLUDE), $(VIM_UPDATE))

# set of rules to copy contents of $(MKFILE_SRC) to $(VIM_PATH)
RULE_BUILD := vim
.PHONY: $(RULE_BUILD)

$(VIM_PATH)/%: $(MKFILE_SRC)/%
	$(CP) $< $@

create_vim_path:
	$(MKDIR) $(VIM_PATH)

$(RULE_BUILD): create_vim_path $(VIM_CONTENT)
	$(info )
	$(info content of $(MKFILE_SRC) has been copied to $(VIM_PATH))

# end of $(RULE_BUILD)

# set of rules to compile a vimrc based on config file sourcing from VIM_PATH 
RULE_COMPILE := vimrc
.PHONY: $(RULE_COMPILE)
$(RULE_COMPILE): 
	$(info )
	$(info create vimrc based on sourcing of config files)
	$(info the configs are to be taken recursevely from $(VIM_CONFIG))
	$(info the old config will be moved at $(VIM_PATH) with a timestamp)
	$(info the new one will be placed in its place)
	$(GEN_VIMRC) $(VIM_CONFIG)
# end of $(RULE_COMPILE)

# set of rules to update $(MKFILE_SRC) with the content at $(VIM_CONTENT)
RULE_UPDATE := update

# to update $(MKFILE_PATH) we want to make sure not mess up unrelated branches
.PHONY: check_branch
check_branch: 

    # check if $(MKFILE_PATH) is at correct branch
    ifneq ($(shell git rev-parse --abbrev-ref HEAD),$(BRANCH_DEV))
	$(error $(MKFILE_PATH) is not at desired branch: $(BRANCH_DEV))
    endif

    # check if git tree is clean
    ifneq ($(shell git status --porcelain),)
	$(error $(MKFILE_PATH) is dirty)
    endif

.PHONY: $(RULE_UPDATE)
$(RULE_UPDATE): check_branch $(MKFILE_SRC)
	$(info )
	$(info will update the $(MKFILE_SRC) content)
	$(info with the one present in $(VIM_PATH) for the git $(BRANCH_DEV) branch)
	$(CP) $(VIM_UPDATE) $(MKFILE_SRC)

# end of $(RULE_UPDATE)

# TODO all should be the default goal; but when runing make 
# TODO only $(RULE_BUILD) is executed
#
# TODO create a rule for cleaning residual vimrc in $(VIM_PATH)
#
# TODO rule naming not best and needs improvemnt

# set all target
all: $(RULE_BUILD) $(RULE_COMPILE)

# set a default goal
#.DEFAULT_GOAL: all
