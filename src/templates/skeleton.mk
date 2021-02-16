# set preferred shell
SHELL := /usr/bin/env bash

.DEFAULT_GOAL: none
.PHONY: none
none:
	@echo 'no default goal set as for now'

.PHONY: dirs
MUST_HAVE_DIR := dirname
dirs: $(MUST_HAVE_DIR)

$(MUST_HAVE_DIR):
	@mkdir -p $@

.PHONY: compile
COMPILE :=
compile:
	@echo 'no compile rules, targets and dependants set'
	@echo 'make compile FILE=... creates $(FILE) variable to use'

.PHONY: lint
LINT :=
lint:
	@echo 'no lint rules'

.PHONY: aformat
AFORMAT :=
aformat:
	@echo 'no auto format rules'

.PHONY: exec
EXEC :=
exec: compile
	@echo 'no execution rule set'

.PHONY: debug_file
DEBUG_FILE :=
debug_file: compile
	@echo 'no execution rule with debugger rule set'

DUMMY_FILE_COUNTERPART :=

$(DUMMY_FILE_COUNTERPART): %.dummy: %.source | $(DUMMY_DIR_TO_COLLECT_THEM)
	@echo 'maybe we want to track files, which cannot be targets'
	@echo 'and thus cannot be build in the sense of objects from C sources'
	@echo 'to be able to track those anyway, create dummy targets'
	@echo 'each on of them depends on the desired source file'
	@echo 'and tracks its modification timestamp'

.PHONY: test
RUN_TEST :=
test:
	@echo 'no test rules set'

.PHONY: build
BUILD :=
build:
	@echo 'no build rules set'

.PHONY: run
run:
	@echo 'no run rules set'

.PHONY: debug
debug:
	@echo 'no run with debugger set'

.PHONY: clean
clean:
	@echo 'no clean rules set'

.PHONY: deploy
deploy:
	@echo 'no deploy rules set'

.PHONY: install
install:
	@echo 'no install rules set'
