# set preferred shell
# SHELL :=

# set run command, e.g. path to target Perl version interpreter
# RUN_CMD :=

.DEFAULT_GOAL: none
.PHONY: none
none:
	$(error no default goal set)

# key directories as targets to automate creation
.PHONY: dirs

# stand alone software
# DIR_SRC := src

# modules, libraries, and other support code
# DIR_LIB := lib

# the test suite
# DIR_TEST := t

# the stable versions of the script placed for user
# DIR_PUBLIC :=

# dummy files to track non compiled files
# DIR_DUMMY := .dummy

# creation rules
# $(DIR_SRC) $(DIR_LIB) $(DIR_TEST):
	# @mkdir --parents $@

# dummy files should not be tracked by git
# $(DIR_DUMMY):
# 	@mkdir --parents $@
# 	@grep --quiet --fixed-strings '*dummy*' .gitignore || echo '*dummy*' >> .gitignore

# one target to rule them all directory targets
# dirs: $(DIR_SRC) $(DIR_LIB) $(DIR_TEST) $(DIR_DUMMY)

.PHONY: compile
COMPILE := $(RUN_CMD)
compile:
ifdef FILE
	@$(COMPILE) $(FILE)
else
	$(error missing file, pass with FILE=file)
endif

.PHONY: lint
LINT :=
lint:
ifdef FILE
	@$(LINT) $(FILE)
else
	$(error missing file, pass with FILE=file)
endif

.PHONY: format
FORMAT :=
format:
ifdef FILE
	@$(FORMAT) $(FILE)
else
	$(error missing file, pass with FILE=file)
endif

.PHONY: build
BUILD := $(RUN_CMD)
build:
	@$(BUILD) $(MAIN)

MAIN :=
.PHONY: run
RUN := $(RUN_CMD)
run:
ifdef FILE
    ifeq ($(findstring $(DIR_TEST)/,$(FILE)),$(DIR_TEST)/)
	@$(RUN) $(shell grep 'nearest_run_of_test' $(DIR_TEST)/ | head -n1)
    else
	@$(RUN) $(FILE) $(ARGS)
    endif
else
	@$(RUN) $(MAIN) $(ARGS)
endif

.PHONY: debug
DEBUG := $(RUN_CMD)
debug:
ifdef FILE
	@$(DEBUG) $(FILE) $(ARGS)
else
	@$(DEBUG) $(MAIN) $(ARGS)
endif

.PHONY: test
TEST :=

TEST_TARGETS := $(wildcard $(DIR)/*)
TEST_UNITS := $(addsuffix .mod,$(basename $(notdir $(TEST_TARGETS))))
TEST_DUMMIES := $(addprefix $(DIR_DUMMIES)/,$(TEST_UNITS))
$(DIR_DUMMIES)/%.mod: $(DIR)/% | $(DIR_DUMMIES)
	@printf "\n======= Testing $* \n\n"
	@$(TEST) $(DIR_TEST)/$*
	@touch $@
	@printf "\n======= End test $* \n\n"

test: $(TEST_DUMMIES)

.PHONY: clean
CLEAN := rm --recursive --force
clean:
	@$(CLEAN)

.PHONY: profile
PROFILE :=
profle:
	@$(PROFILE)

.PHONY: cover
COVER :=
cover:
	@$(COVER)

.PHONY: deploy
DEPLOY :=
deploy:
	@$(DEPLOY)

.PHONY: install
INSTALL :=
deploy:
	@$(INSTALL)
