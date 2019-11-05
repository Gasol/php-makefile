_last_mkfile := $(abspath $(lastword $(MAKEFILE_LIST)))
BASEDIR := $(patsubst %/,%,$(dir $(_last_mkfile)))
USESDIR ?= $(BASEDIR)/Mk

phpunit_DEPS := composer

DEPS := $(foreach use, $(USES), $($(use)_DEPS))
USES += $(DEPS)
UNIQUE_USES := $(shell IFS=' ' echo $(USES) | tr ' ' '\n' | sort -u)

include $(foreach use, $(UNIQUE_USES), $(wildcard $(USESDIR)/$(use).mk))
