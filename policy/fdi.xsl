<?xml version="1.0" encoding="UTF-8"?>
<!--
  fdi.xsl :: creates an fdi file following system policy
  Copyright (C) 2009  SEIKO EPSON CORPORATION

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
  <xsl:output mode="xml" encoding="UTF-8" indent="yes"/>
  <xsl:strip-space elements="*"/>

  <xsl:template match="/">
<xsl:comment>
This file is generated as part of the installation of "Image Scan! for Linux".
Any changes will be overwritten with each upgrade of the package.

This file was generated from: %ISCAN_LIBSANE_FDI_INPUT_FILE_PATH%
</xsl:comment>
    <xsl:apply-templates/>
  </xsl:template>

  <!-- Only match elements can have string attributes -->
  <xsl:template match="match[@string and not (contains(@string,'usb'))]">
  </xsl:template>

  <!-- Never mind other vendors, we're only interested in one -->
  <xsl:template match="match[@key and contains(@key,'usb')
                       and contains(@key,'vendor_id')
                       and translate(@int,'B','b') != '0x04b8']">
  </xsl:template>

  <!-- Suppress all but the last Epson USB vendor ID stanza -->
  <xsl:template match="match[@key and contains(@key,'usb')
                       and contains(@key,'vendor_id')
                       and translate(@int,'B','b') = '0x04b8']
                       [position() != last()]">
  </xsl:template>

  <!-- Output the last Epson USB vendor ID stanza and a product ID
       stanza for each product ID in 'usbids.xml' -->
  <xsl:template match="match[@key and contains(@key,'usb')
                       and contains(@key,'vendor_id')
                       and translate(@int,'B','b') = '0x04b8']
                       [position() = last()]">
    <xsl:variable name="context" select="*"/>
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:for-each select="document('usbids.xml')/usbids/usbid">
        <xsl:apply-templates select="$context">
          <xsl:with-param name="usbid">
            <xsl:value-of select="."/>
          </xsl:with-param>
        </xsl:apply-templates>
      </xsl:for-each>
    </xsl:copy>
  </xsl:template>

  <!-- Suppress all but the last USB product ID stanza -->
  <xsl:template match="match[@key and contains(@key,'usb')
                       and contains(@key,'product_id')]
                       [position() != last()]">
  </xsl:template>

  <!-- Make a copy of the last USB product ID stanza; replacing the
       product ID with the one supplied via the 'usbid' parameter -->
  <xsl:template match="match[@key and contains(@key,'usb')
                       and contains(@key,'product_id')]
                       [position() = last()]">
    <xsl:param name="usbid"/>
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:attribute name="int">
        <xsl:value-of select="$usbid"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>

  <!-- Output everything else -->
  <xsl:template match="*">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
