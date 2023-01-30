<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xsl:extension-element-prefixes="php" version="1.0">
  <xsl:template match="raw">
    <xsl:choose>
      <xsl:when test="@format='html'">
        <p>
          <xsl:value-of select="." disable-output-escaping="yes"/>
        </p>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
