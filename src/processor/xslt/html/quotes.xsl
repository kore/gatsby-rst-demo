<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xsl:extension-element-prefixes="php" version="1.0">
  <xsl:template match="block_quote">
    <blockquote>
      <xsl:if test="starts-with(attribution, 'http')">
        <xsl:attribute name="cite">
          <xsl:value-of select="attribution"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates select="paragraph"/>
    </blockquote>
    <xsl:if test="attribution">
      <div class="cite">
        <cite>
          <xsl:choose>
            <xsl:when test="starts-with(attribution, 'http')">
              <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="attribution"/>
                </xsl:attribute>
                <xsl:value-of select="attribution"/>
              </a>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="attribution"/>
            </xsl:otherwise>
          </xsl:choose>
        </cite>
      </div>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
