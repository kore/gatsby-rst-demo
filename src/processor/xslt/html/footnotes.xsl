<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xsl:extension-element-prefixes="php" version="1.0">
  <xsl:template match="footnote">
    <dl class="footnote">
      <dt>
        <a>
          <xsl:attribute name="href">#_footnote_<xsl:value-of select="@ids"/></xsl:attribute>
          <xsl:attribute name="name">
            <xsl:value-of select="@ids"/>
          </xsl:attribute>
          <xsl:value-of select="label"/>
        </a>
      </dt>
      <xsl:apply-templates select="paragraph"/>
    </dl>
  </xsl:template>
  <xsl:template match="footnote/paragraph">
    <dd>
      <xsl:apply-templates/>
    </dd>
  </xsl:template>
  <xsl:template match="footnote_reference">
    <a class="footnote"><xsl:attribute name="href">#<xsl:value-of select="@refid"/></xsl:attribute><xsl:attribute name="name">_footnote_<xsl:value-of select="@refid"/></xsl:attribute>
      [<xsl:apply-templates/>]
    </a>
  </xsl:template>
</xsl:stylesheet>
