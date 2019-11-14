# PHP Makefile

A set of makefiles consists of useful rules for PHP development.

[![asciicast](https://asciinema.org/a/MGbvJeArxMCHmDJfrR1n9XuJF.svg)](https://asciinema.org/a/MGbvJeArxMCHmDJfrR1n9XuJF)

# Installation

Install as development package by using [Composer](https://getcomposer.org/)

    composer require --dev gasolwu/php-makefile

Or, append the following snippet into your composer.json and then run install manually by `composer install`

    {
        "require-dev": {
            "gasolwu/php-makefile": "^0.1"
        }
    }

# Getting Started

The minimum setup is to create your own Makefile and includes the PHP.mk.

    cat > Makefile <<EOF
    include vendor/gasolwu/php-makefile/PHP.mk
    EOF
	
# Usage

## Available targets

### Basic
- `make syntax` - Check syntax by PHP built-in linter
- `make clean` - Remove build directory

### With `USES=phpunit`

- `make phpunit.xml` - Generate configuration file for PHPUnit with suggested settings
- `make phpunit` - Run test with PHPUnit

### With `USES=composer`

- `make vendor` - Install dependencies by using Composer

## Hints

There are two approches to run test by default, So you can run test by running `make` instead of `make phpunit`

1. Define `.DEFAULT_GOAL`

        .DEFAULT_GOAL := phpunit

2. Declare `all` target that depends on `phpunit`

        all: phpunit


# Configuration

Those variables should work well for most PHP libraries by default, If it doesn't, Feel free to apply changes that applicable to you.

* `USES` - Possible values are
	* `composer` 
	* `phpunit`
*   `BUILD_DIR` - Build directory that contains all generated files during the build phase are placed here. Should be listed in VCS  ignore file. Default to `build`.
*   `PHP_SRCDIR` - Source directory, Default to `src`.
*   `PHP_TESTDIR` - Tests directory, Default to `tests`.

# License

[MIT](https://gasolwu.mit-license.org/) - Copyright © 2019 Gasol Wu

