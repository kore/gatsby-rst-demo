<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xsl:extension-element-prefixes="php" version="1.0">
  <xsl:template match="paragraph">
    <p>
      <xsl:if test="@classes">
        <xsl:attribute name="class">
          <xsl:value-of select="@classes"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="paragraph/text()">
    <xsl:call-template name="remove-newline"/>
  </xsl:template>
  <xsl:template match="reference/text()">
    <xsl:call-template name="remove-newline"/>
  </xsl:template>
  <xsl:template name="remove-newline">
    <xsl:param name="text" select="."/>
    <xsl:choose>
      <xsl:when test="contains($text, '&#10;')">
        <xsl:value-of select="substring-before($text, '&#10;')"/>
        <xsl:text> </xsl:text>
        <xsl:call-template name="remove-newline">
          <xsl:with-param name="text" select="substring-after($text, '&#10;')"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
