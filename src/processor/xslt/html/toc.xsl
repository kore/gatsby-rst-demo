<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xsl:extension-element-prefixes="php" version="1.0">
  <xsl:template match="topic[@classes='contents']">
    <div>
      <xsl:attribute name="class">toc</xsl:attribute>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  <xsl:template match="topic[@classes='contents']/title">
    <xsl:element name="h{count( ancestor::section ) + 3}">
      <xsl:value-of select="."/>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
