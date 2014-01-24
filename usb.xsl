<?xml version="1.0" encoding="UTF-8"?>
<!--
  usb.xsl :: extracts usb vendor/product ids from an XML data file
  Copyright (C) 2010  SEIKO EPSON CORPORATION

  This file is part of "Image Scan! for Linux".
  You can redistribute it and/or modify it under the terms of the GNU
  General Public License as published by the Free Software Foundation;
  either version 2 of the License or at your option any later version.

  This program is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY;  without even the implied warranty of FITNESS
  FOR A PARTICULAR PURPOSE or MERCHANTABILITY.
  See the GNU General Public License for more details.

  You should have received a verbatim copy of the GNU General Public
  License along with this program; if not, write to:

      Free Software Foundation, Inc.
      59 Temple Place, Suite 330
      Boston, MA  02111-1307  USA
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text"/>
  <xsl:strip-space elements="*"/>
  <xsl:template match="interfaces/usb">
    <xsl:text>usb</xsl:text>
    <xsl:text> 0x</xsl:text><xsl:value-of select="@vendor"/>
    <xsl:text> 0x</xsl:text><xsl:value-of select="@product"/>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>
</xsl:stylesheet>
