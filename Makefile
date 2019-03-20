# -*- coding: utf-8-unix -*-

APP =
APPS = mtv spotify yle-areena
PREFIX = /usr/local
ICON_SIZE = $(if $(APP),$(shell identify -format "%wx%h" $(APP)/$(APP).png))

install:
	test -n "$(APP)" # APP
	test -n "$(ICON_SIZE)" # ICON_SIZE
	$(MAKE) uninstall
	sudo mkdir -p $(PREFIX)/bin
	sudo mkdir -p $(PREFIX)/share/applications
	sudo mkdir -p $(PREFIX)/share/icons/hicolor/$(ICON_SIZE)/apps
	sudo cp $(APP)/$(APP) $(PREFIX)/bin
	sudo cp $(APP)/$(APP).desktop $(PREFIX)/share/applications
	sudo cp $(APP)/$(APP).png $(PREFIX)/share/icons/hicolor/$(ICON_SIZE)/apps

install-all:
	for X in $(APPS); do $(MAKE) APP=$$X install; done

uninstall:
	test -n "$(APP)" # APP
	sudo rm -f $(PREFIX)/bin/$(APP)
	sudo rm -f $(PREFIX)/share/applications/$(APP).desktop
	sudo rm -f $(PREFIX)/share/icons/hicolor/*/apps/$(APP).png

uninstall-all:
	for X in $(APPS); do $(MAKE) APP=$$X uninstall; done

.PHONY: install install-all uninstall uninstall-all
