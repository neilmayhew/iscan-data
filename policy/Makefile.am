##  Makefile.am -- an -*- automake -*- template for Makefile.in
##  Copyright (C) 2010  SEIKO EPSON CORPORATION
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


EXTRA_DIST = \
	fdi.xsl \
	sled10.custom.fdi \
	initramfs-hook.in

iscandatadir = $(datadir)/iscan-data

dist_iscandata_DATA = \
	sled10.custom.fdi \
	fdi.xsl

##  Created by $(top_srcdir)/configure because the make-policy-file
##  script does not refer to any of the directory variables.
pkglib_SCRIPTS = \
	make-policy-file
