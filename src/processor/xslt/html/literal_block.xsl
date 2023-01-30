<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xsl:extension-element-prefixes="php" version="1.0">
  <xsl:template match="literal_block">
    <code>
      <xsl:attribute name="class">
        <xsl:text>block</xsl:text>
        <xsl:if test="@classes">
          <xsl:text> </xsl:text>
          <xsl:value-of select="@classes"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:apply-templates/>
    </code>
  </xsl:template>
</xsl:stylesheet>
