dnl  configure.ac -- an -*- autoconf -*- template for configure
dnl  Copyright (C) 2010--2015  SEIKO EPSON CORPORATION
dnl
dnl  License: GPLv2+
dnl  Authors: AVASYS CORPORATION
dnl
dnl  This file is part of the 'iscan-data' package.
dnl  This package is free software: you can redistribute it and/or modify
dnl  it under the terms of the GNU General Public License as published by
dnl  the Free Software Foundation, either version 2 of the License or, at
dnl  your option, any later version.
dnl
dnl    This program is distributed in the hope that it will be useful,
dnl    but WITHOUT ANY WARRANTY; without even the implied warranty of
dnl    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
dnl    GNU General Public License for more details.
dnl
dnl  You ought to have received a copy of the GNU General Public License
dnl  along with this package.  If not, see <http://www.gnu.org/licenses/>.
dnl
dnl  Process this file with autoconf to make a configure file.


dnl  preamble

AC_PREREQ(2.60)
AC_INIT([iscan-data],
	[1.39.0],
	[linux-scanner@epson.jp],
	[iscan-data])

SCM_INIT([-Wall -Werror])

AC_SUBST(COPYRIGHT_PERIOD, ["2010-2016"])
SCM_RELEASE([1])

SCM_VENDOR([SEIKO EPSON CORPORATION])
SCM_AUTHOR([AVASYS CORPORATION])
SCM_WEBSITE([http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX])
SCM_INFO(["Image Scan! for Linux data files"],["\
Provides the necessary support files for Image Scan! for Linux,\\
including device information and policy file generation logic.\
"],["\
Image Scan! for Linux will not function without this package.\
"])

AC_CONFIG_SRCDIR([iscan-data.spec])
AC_CONFIG_MACRO_DIR([include])


AM_INIT_AUTOMAKE([1.7 foreign -Wall -Werror])


dnl  checks for programs


dnl  checks for modules


dnl  checks for libraries


dnl  checks for header files


dnl  checks for typedefs, structures, and compiler characteristics


dnl  checks for library functions


dnl  appendix

AC_CONFIG_FILES([
	Makefile
	policy/Makefile
	policy/make-policy-file
	])

AC_OUTPUT
