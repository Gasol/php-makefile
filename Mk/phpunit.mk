PHPUNIT ?= vendor/bin/phpunit

phpunit.xml:
	$(PHPUNIT) --generate-configuration

phpunit: syntax phpunit.xml $(VENDOR_DIR)
	$(PHPUNIT) $(PHPUNIT_FLAGS)

.PHONY: phpunit
