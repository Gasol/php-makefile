COMPOSER   ?= $(shell command -v composer;)
VENDOR_DIR ?= vendor

ifdef CI
	COMPOSER_INSTALL_FLAGS+=--no-interaction
	COMPOSER_INSTALL_FLAGS+=--no-progress
endif

composer.json:
	$(COMPOSER) init

composer.lock: composer.json
	$(COMPOSER) update $(COMPOSER_UPDATE_FLAGS)
	@test -e "$@" || cat > "$@" <<<'{}'

$(VENDOR_DIR): composer.json composer.lock ## Install dependencies
	$(COMPOSER) validate --strict
	$(COMPOSER) install $(COMPOSER_INSTALL_FLAGS)
