<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xsl:extension-element-prefixes="php" version="1.0">
  <xsl:template match="document/title">
    <h2>
      <xsl:apply-templates/>
    </h2>
  </xsl:template>
  <xsl:template match="transition">
    <hr />
  </xsl:template>
  <xsl:template match="section">
    <section>
      <xsl:if test="@ids">
        <xsl:attribute name="id">
          <xsl:value-of select="@ids"/>
        </xsl:attribute>
        <a>
          <xsl:attribute name="name">
            <xsl:value-of select="@ids"/>
          </xsl:attribute>
        </a>
      </xsl:if>
      <xsl:apply-templates/>
    </section>
  </xsl:template>
  <xsl:template match="section/title">
    <xsl:if test="@refid">
      <a>
        <xsl:attribute name="name">
          <xsl:value-of select="@refid"/>
        </xsl:attribute>
      </a>
    </xsl:if>
    <xsl:element name="h{count( ancestor::section ) + 2}">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="section/title/target">
    <xsl:if test="@ids">
      <a>
        <xsl:attribute name="name">
          <xsl:value-of select="@ids"/>
        </xsl:attribute>
      </a>
    </xsl:if>
    <xsl:apply-templates/>
  </xsl:template>
</xsl:stylesheet>
