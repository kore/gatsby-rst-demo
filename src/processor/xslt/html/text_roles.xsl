<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xsl:extension-element-prefixes="php" version="1.0">
  <xsl:template match="inline">
    <span>
      <xsl:attribute name="class">
        <xsl:value-of select="@classes"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </span>
  </xsl:template>
</xsl:stylesheet>
