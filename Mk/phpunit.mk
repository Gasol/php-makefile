PHPUNIT ?= vendor/bin/phpunit

phpunit.xml:
	$(PHPUNIT) --generate-configuration

phpunit: phpunit.xml $(VENDOR_DIR)
	$(PHPUNIT) $(PHPUNIT_FLAGS)

.PHONY: phpunit
