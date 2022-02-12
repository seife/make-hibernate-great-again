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
# for non-package use stuff should actually be installed in /etc
# but that would need mangling of the config files and I'm just
# too lazy to do that now.
# 

help:
	@echo "use 'make install DESTDIR=...'"
	@echo

install:
	install -m0644 -pD src/systemd/10-resume-verbose.conf $(DESTDIR)/usr/lib/systemd/system/systemd-hibernate-resume@.service.d/10-resume-verbose.conf
	install -m0644 -pD src/systemd/10-suspend-verbose.conf $(DESTDIR)/usr/lib/systemd/system/systemd-hibernate.service.d/10-suspend-verbose.conf
	install -m0644 -pD src/dracut/50-hibernate.conf $(DESTDIR)/usr/lib/dracut/dracut.conf.d/50-hibernate.conf

