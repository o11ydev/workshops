HUGO_VERSION ?= 0.104.3
HUGO ?= ./hugo
BASEURL ?= https://workshops.o11y.eu

all: compile

compile:
	$(HUGO) -F --baseURL "$(BASEURL)/"

serve:
	$(HUGO) serve

install:
	sudo npm i -D postcss postcss-cli autoprefixer
	curl -L https://github.com/spf13/hugo/releases/download/v$(HUGO_VERSION)/hugo_extended_$(HUGO_VERSION)_Linux-64bit.tar.gz | tar xzf - hugo
