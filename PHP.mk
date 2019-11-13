_last_mkfile := $(abspath $(lastword $(MAKEFILE_LIST)))
BASEDIR := $(patsubst %/,%,$(dir $(_last_mkfile)))
USESDIR ?= $(BASEDIR)/Mk

phpunit_DEPS := composer

DEPS := $(foreach use, $(USES), $($(use)_DEPS))
USES += $(DEPS)
UNIQUE_USES := $(shell echo $(USES) | tr ' ' '\n' | sort -u)

PHP_SRCDIR ?= src
PHP_TESTDIR ?= tests

find_php_files=$(shell find $1 -type f -name '*.php')
PHP_FILES := $(call find_php_files,$(PHP_SRCDIR))
PHP_FILES += $(call find_php_files,$(PHP_TESTDIR))

build/syntax/%.php: %.php
	@mkdir -p $(dir $@)
	@php -l $<
	@touch $@

.PHONY: syntax
syntax: $(PHP_FILES:%=build/syntax/%) ## Check syntax by PHP built-in linter

.PHONY: clean
clean: ## Remove temporary files during development cycle
	rm -rf build

include $(foreach use, $(UNIQUE_USES), $(wildcard $(USESDIR)/$(use).mk))
