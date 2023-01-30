<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xsl:extension-element-prefixes="php" version="1.0">
  <xsl:template match="line_block">
    <p class="line-block">
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="line_block/line">
    <xsl:apply-templates/>
    <br/>
  </xsl:template>
</xsl:stylesheet>
