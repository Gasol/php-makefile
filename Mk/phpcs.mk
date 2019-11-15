
PHPCS ?= vendor/bin/phpcs

PHP_CONFIG := $(shell command -v php-config)
PHP_VERNUM := $(shell test -n "$(PHP_CONFIG)" && $(PHP_CONFIG) --vernum)
PHPCS_STANDARD ?= $(shell test "$(PHP_VERNUM)" \< "70000" && echo 'PSR2' || echo 'PSR12')
ifeq ($(findstring --standard,$(PHPCS_FLAGS)), )
    PHPCS_FLAGS += --standard=$(PHPCS_STANDARD)
endif
INTERACTIVE := $(shell [ -t 0 ] && echo 1)

ifdef INTERACTIVE
    ifeq ($(findstring --colors,$(PHPCS_FLAGS)), )
        PHPCS_FLAGS += --colors
    endif
endif

PHPCS_FILES ?= $(PHP_SRCDIR) $(PHP_TESTDIR)

.PHONY: style
style:
	$(PHPCS) $(PHPCS_FLAGS) $(PHPCS_FILES)
