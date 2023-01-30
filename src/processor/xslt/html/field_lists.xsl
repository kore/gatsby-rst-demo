<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xsl:extension-element-prefixes="php" version="1.0">
  <xsl:template match="field_list/field">
    <xsl:choose>
      <xsl:when test="field_name='Address'">
        <address>
          <xsl:choose>
            <xsl:when test="field_body/line_block">
              <xsl:apply-templates select="field_body/line_block/line"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates select="field_body"/>
            </xsl:otherwise>
          </xsl:choose>
        </address>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
