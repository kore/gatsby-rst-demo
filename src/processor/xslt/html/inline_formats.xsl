<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xsl:extension-element-prefixes="php" version="1.0">
  <xsl:template match="strong">
    <strong>
      <xsl:apply-templates/>
    </strong>
  </xsl:template>
  <xsl:template match="emphasis">
    <em>
      <xsl:apply-templates/>
    </em>
  </xsl:template>
  <xsl:template match="literal">
    <code class="inline">
      <xsl:apply-templates/>
    </code>
  </xsl:template>
</xsl:stylesheet>
