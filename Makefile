PLUGIN_NAME = remote-plugin

INSTALL_FILES = \
	$(WEB)/l10n/cultures.json \
	$(WEB)/l10n/de-DE.json \
	$(WEB)/l10n/en-US.json \
	$(WEB)/remote-plugin.js \
	RemotePlugin.config.yml

# XXX: not in source CSV
#	$(WEB)/l10n/es-ES.json \
#	$(WEB)/l10n/it-IT.json \

L10N_FILES = l10n/remote-plugin.csv

L10N_GOOGLE_KEY = 1Z3UPJ6XqLBp-P8SUf-ewq4osNJ3iZWKJB83tc6Wrfn0
L10N_GOOGLE_GID = 1714698779

COFFEE_FILES = \
	src/webfrontend/RemotePlugin.coffee

all: build

include easydb-library/tools/base-plugins.make

build: code # $(SCSS)

code: $(JS) $(L10N)

clean: clean-base
