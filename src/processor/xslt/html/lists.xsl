<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xsl:extension-element-prefixes="php" version="1.0">
  <xsl:template match="enumerated_list">
    <ol>
      <xsl:apply-templates/>
    </ol>
  </xsl:template>
  <xsl:template match="bullet_list">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>
  <xsl:template match="list_item">
    <li>
      <xsl:apply-templates/>
    </li>
  </xsl:template>
  <xsl:template match="definition_list">
    <dl>
      <xsl:apply-templates/>
    </dl>
  </xsl:template>
</xsl:stylesheet>
