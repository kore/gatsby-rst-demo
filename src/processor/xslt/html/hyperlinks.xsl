<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xsl:extension-element-prefixes="php" version="1.0">
  <!--
    Thanks to mapi for this XSLT!
  -->
  <xsl:template name="makeJavascript">
    <xsl:param name="email"/>
    <xsl:text>this, '</xsl:text>
    <xsl:value-of select="substring-before( substring-after( $email, '@' ), '.' )"/>
    <xsl:text>', '</xsl:text>
    <xsl:value-of select="substring-after( substring-after( $email, '@' ), '.' )"/>
    <xsl:text>', '</xsl:text>
    <xsl:value-of select="substring-before( $email, '@' )"/>
    <xsl:text>'</xsl:text>
  </xsl:template>
  <xsl:template match="reference">
    <a>
      <xsl:choose>
        <xsl:when test="@refid">
          <xsl:attribute name="href">#<xsl:value-of select="@refid"/></xsl:attribute>
        </xsl:when>
        <xsl:when test="@ids">
          <xsl:attribute name="href">#<xsl:value-of select="@ids"/></xsl:attribute>
        </xsl:when>
        <!-- 
        This code snippets adds some javascript to hide mail addresses from
        robots.

        This makes only sense to use, if the text sources are not
        available, so we comment it out for now.

      <xsl:when test="starts-with( @refuri, 'mailto:' )">
        <xsl:variable name="javascript">
          <xsl:call-template name="makeJavascript">
            <xsl:with-param name="email">
              <xsl:value-of select="normalize-space( substring-after( @refuri, 'mailto:' ) )" />
            </xsl:with-param>
          </xsl:call-template>
        </xsl:variable>

        <xsl:attribute name="href"></xsl:attribute>
        <xsl:attribute name="onclick">returnMailLink( <xsl:value-of select="$javascript"/> );</xsl:attribute>
      </xsl:when> -->
        <xsl:when test="@refuri">
          <xsl:attribute name="href">
            <xsl:value-of select="@refuri"/>
          </xsl:attribute>
        </xsl:when>
      </xsl:choose>
      <xsl:apply-templates/>
    </a>
  </xsl:template>
  <xsl:template match="target">
  </xsl:template>
</xsl:stylesheet>
