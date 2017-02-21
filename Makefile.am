##  Makefile.am -- an -*- automake -*- template for Makefile.in
##  Copyright (C) 2010--2015  SEIKO EPSON CORPORATION
##
##  License: GPLv2+
##  Authors: AVASYS CORPORATION
##
##  This file is part of the 'iscan-data' package.
##  This package is free software: you can redistribute it and/or modify
##  it under the terms of the GNU General Public License as published by
##  the Free Software Foundation, either version 2 of the License or, at
##  your option, any later version.
##
##    This program is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##  You ought to have received a copy of the GNU General Public License
##  along with this package.  If not, see <http://www.gnu.org/licenses/>.
##
##  Process this file with automake to make a Makefile.in file.


SUBDIRS = \
	policy

iscandatadir = $(datadir)/iscan-data
pkglocalstatedir = $(localstatedir)/lib/$(PACKAGE_TARNAME)

dist_iscandata_DATA = \
	epkowa.desc \
	scsi \
	fs-blacklist

nodist_iscandata_DATA = \
	usb

EXTRA_DIST = \
	usb.in \
	usb.xsl \
	SUPPORTED-DEVICES \
	KNOWN-PROBLEMS.in \
	KNOWN-PROBLEMS \
	bootstrap \
	\
	debian/$(PACKAGE_TARNAME).postinst.in \
	debian/$(PACKAGE_TARNAME).prerm.in \
	debian/$(PACKAGE_TARNAME).postrm \
	debian/$(PACKAGE_TARNAME).docs

$(top_srcdir)/KNOWN-PROBLEMS: $(top_srcdir)/KNOWN-PROBLEMS.in
	@sed -n -e '/^=\{70\}/,/^-\{70\}/p' $< \
	   | sed -e '/^[-=]\{70\}/d' > $@.toc
	@sed -e '/^ TABLE OF CONTENTS/r $@.toc' $< > $@
	@rm -f $@.toc


usb: $(top_srcdir)/usb.in $(top_srcdir)/usb.xsl $(top_srcdir)/device/*.xml
	cat $< > $@
	for file in `ls $(top_srcdir)/device/*.xml`; do \
	  xsltproc $(top_srcdir)/usb.xsl $$file \
	    | tr '[A-F]' '[a-f]' | while read line ; do \
	    if ! grep "$$line" $@ > /dev/null 2>&1; then \
	      echo $$line >> $@; \
	    fi \
	  done \
	done

$(PACKAGE_TARNAME).hwdb: usb
	sed -e '/^usb/y/abcdef/ABCDEF/' \
	    -e 's/usB/usb/' \
	    -e '/^usb/s/ 0x/:v/' \
	    -e '/^usb/s/ 0x/p/' \
	    -e '/^usb/s/$$/*\n libsane_matched=yes\n/' \
	    -e '1s/$</$@/' \
	    -e '2s/2008/2015/' \
	    $< > $@

# only include xml files with stubbed model names when doing unofficial builds
dist-hook:
	-$(MKDIR_P) $(distdir)/device
	if test x'yes' = x$(SCM_PUBLIC_RELEASE); then \
	  for file in `egrep -L "#_.*_#" $(srcdir)/device/*.xml`; do \
	    cp -fp $$file $(distdir)/device; \
	  done; \
	else \
	  cp -fp $(srcdir)/device/*.xml $(distdir)/device; \
	  cp -fp $(srcdir)/matching $(distdir)/; \
	fi

install-data-hook:
	if test ! -d $(DESTDIR)/$(iscandatadir)/device; then \
	  $(MKDIR_P) $(DESTDIR)/$(iscandatadir)/device; \
	fi
	$(INSTALL_DATA) $(srcdir)/device/*.xml \
	                $(DESTDIR)/$(iscandatadir)/device
	if test x'yes' != x$(SCM_PUBLIC_RELEASE) && test -f $(srcdir)/matching; then \
	  if test ! -d $(DESTDIR)/$(pkglocalstatedir); then \
	    $(MKDIR_P) $(DESTDIR)/$(pkglocalstatedir); \
	  fi; \
	  $(INSTALL_DATA) $(srcdir)/matching $(DESTDIR)/$(pkglocalstatedir)/; \
	fi

uninstall-hook:
	for file in `ls $(srcdir)/device/*.xml`; do \
	  rm -f $(DESTDIR)/$(iscandatadir)/device/`basename $$file`; \
	done
	-rmdir $(DESTDIR)/$(iscandatadir)/device
	-rm -f $(DESTDIR)/$(pkglocalstatedir)/matching
	-rmdir $(DESTDIR)/$(pkglocalstatedir)

CLEANFILES = usb $(PACKAGE_TARNAME).hwdb

MAINTAINERCLEANFILES = 
MAINTAINERCLEANLOCAL = 

ACLOCAL_AMFLAGS = -I include

include $(top_srcdir)/include/scm-build.am
