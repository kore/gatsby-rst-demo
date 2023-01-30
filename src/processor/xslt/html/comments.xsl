<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xsl:extension-element-prefixes="php" version="1.0">
  <xsl:template match="comment">
    <xsl:comment>
      <xsl:apply-templates/>
    </xsl:comment>
  </xsl:template>
</xsl:stylesheet>
