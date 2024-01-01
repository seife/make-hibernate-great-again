# (c) 2021 Stefan Seyfried
#
# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What The Fuck You Want
# To Public License, Version 2, as published by Sam Hocevar. See
# http://www.wtfpl.net/ for more details, or the file "copying" 
#
# simplify installation
# ...for packaging...
#

# use "make install PREFIX=/usr/lib" for system wide installation
PREFIX := /etc
# dracut conf is in /usr/lib/dracut/dracut.conf.d, but /etc/dracut.conf.d
ifeq ($(PREFIX),/etc)
	DRACUT_PREFIX = $(PREFIX)
else
	DRACUT_PREFIX = $(PREFIX)/dracut
endif

help:
	@echo "use 'make install DESTDIR=...'"
	@echo

install:
	install -m0644 -pD src/systemd/10-resume-verbose.conf $(DESTDIR)$(PREFIX)/systemd/system/systemd-hibernate-resume@.service.d/10-resume-verbose.conf
	install -m0644 -pD src/systemd/10-resume-verbose.conf $(DESTDIR)$(PREFIX)/systemd/system/systemd-hibernate-resume.service.d/10-resume-verbose.conf
	install -m0644 -pD src/systemd/10-suspend-verbose.conf $(DESTDIR)$(PREFIX)/systemd/system/systemd-hibernate.service.d/10-suspend-verbose.conf
	install -m0644 -pD src/dracut/50-hibernate.conf $(DESTDIR)$(DRACUT_PREFIX)/dracut.conf.d/50-hibernate.conf
	sed -i -e "s|@PREFIX@|$(PREFIX)|" $(DESTDIR)$(DRACUT_PREFIX)/dracut.conf.d/50-hibernate.conf

