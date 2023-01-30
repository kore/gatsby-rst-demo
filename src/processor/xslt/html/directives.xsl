<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xsl:extension-element-prefixes="php" version="1.0">
  <xsl:template match="danger">
    <div class="danger">
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  <xsl:template match="attention">
    <div class="attention">
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  <xsl:template match="note">
    <div class="note">
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  <xsl:template match="hint">
    <div class="hint">
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  <xsl:template match="warning">
    <div class="warning">
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  <xsl:template match="admonition">
    <div>
      <xsl:attribute name="class">
        <xsl:text>admonition</xsl:text>
        <xsl:if test="@classes">
          <xsl:text> </xsl:text>
          <xsl:value-of select="@classes"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  <xsl:template match="admonition/title">
    <span class="title">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
</xsl:stylesheet>
